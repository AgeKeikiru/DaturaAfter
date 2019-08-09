if(object_index == obj_handler_menu_parent){
    with obj_handler_menuUI{
        scr_menu_party_equip_swapEquip();
    }
}else{
    globalvar G_tmp;
    G_tmp = noone;
    
    var SV_menu = ds_stack_top(global.stk_menu);
    
    while(SV_menu.submenu){
        scr_menu_back(false,false);
        SV_menu = ds_stack_top(global.stk_menu);
    }
    
    switch(SV_menu.link_panel.txt[0]){
        
        case "party/equip/act/..":
            if(SV_menu.menu_y < ds_grid_height(SV_menu.grd_equipSrc) + -2){
                G_tmp = SV_menu.grd_equipSrc[# SV_menu.menu_x,SV_menu.menu_y];
                global.buyLst = global.lst_inv_acts;
            }
            
            break;
            
        case "party/equip/armor/..":
            if(SV_menu.menu_y < ds_list_size(global.lst_inv_arms)){
                G_tmp = global.lst_inv_arms[| SV_menu.menu_y];
                global.buyLst = global.lst_inv_arms;
            }
            
            break;
            
        case "party/equip/class/..":
            if(SV_menu.menu_y < ds_list_size(global.lst_inv_classes)){
                G_tmp = global.lst_inv_classes[| SV_menu.menu_y];
                global.buyLst = global.lst_inv_classes;
            }
            
            break;
    }
    
    if(scr_exists(G_tmp,asset_object) && scr_exists(G_tmp.src,asset_object)){
        with G_tmp.src{
            var SV_key = "";
            
            switch global.buyLst{
                case global.lst_inv_acts: SV_key = CHAR_VAR_HB; break;
                case global.lst_inv_arms: SV_key = CHAR_VAR_ARM; break;
                case global.lst_inv_classes: SV_key = CHAR_VAR_CLS; break;
            }
            
            for(var SV_i = 0;ds_map_exists(src,SV_key + string(SV_i));SV_i++){
                if(src[? SV_key + string(SV_i)] == G_tmp){
                    src[? SV_key + string(SV_i)] = noone;
                }
            }
        }
        
        G_tmp.src = noone;
    }

    scr_menu_back(true,false);
    
    var
    SV_menu = ds_stack_top(global.stk_menu),
    SV_memX = global.lst_activePartySlots[| SV_menu.menu_x],
    SV_mem = global.grd_party_player[# SV_memX % 3,SV_memX > 2],
    SV_y = SV_menu.menu_y;
    
    scr_trace(SV_y);
    
    if(SV_y < 8){
        //act
        var SV_act = SV_mem.src[? "char_var_hb" + string(SV_y)];
        
        if(instance_exists(SV_act)){
            SV_act.src = noone;
        }
        
        SV_mem.src[? "char_var_hb" + string(SV_y)] = G_tmp;
    }else if(SV_y < 10){
        //armor
        var SV_arm = SV_mem.src[? "char_var_arm" + string(SV_y + -8)];
        
        if(instance_exists(SV_arm)){
            SV_arm.src = noone;
        }
        
        SV_mem.src[? "char_var_arm" + string(SV_y + -8)] = G_tmp;
    }else if(SV_y < ds_grid_height(SV_menu.grd_txt)){
        //class
        var SV_cls = SV_mem.src[? "char_var_cls" + string(SV_y + -10)];
        
        if(instance_exists(SV_cls)){
            for(var SV_i = 0;SV_i < 8;SV_i++){
                var SV_act = SV_mem.src[? "char_var_hb" + string(SV_i)];
                
                if(scr_exists(SV_act,asset_object) && ds_grid_value_exists(SV_cls.grd_skillAct,0,0,ds_grid_width(SV_cls.grd_skillAct) + -1,ds_grid_height(SV_cls.grd_skillAct) + -1,SV_act)){
                    SV_act.src = noone;
                    SV_mem.src[? "char_var_hb" + string(SV_i)] = noone;
                }
            }
            
            SV_cls.src = noone;
        }
        
        SV_mem.src[? "char_var_cls" + string(SV_y + -10)] = G_tmp;
    }
    
    scr_playSfx(sfx_equip);
    scr_playSfx(sfx_cutin);
    scr_playSfx(sfx_spell);
    
    scr_refreshEquips();
}