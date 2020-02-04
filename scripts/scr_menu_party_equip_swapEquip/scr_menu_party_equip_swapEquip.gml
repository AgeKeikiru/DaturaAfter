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
    
    if(scr_exists(G_tmp) && scr_exists(G_tmp.src)){
        with G_tmp.src{
            for(var SV_i = en_charVar.hb0;SV_i <= en_charVar.clsU;SV_i++){
                if(src[? SV_i] == G_tmp){
                    src[? SV_i] = noone;
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
    SV_y = SV_menu.menu_y,
    _o = SV_mem.src[? en_charVar.hb0 + SV_y];
    
    scr_trace(SV_y);
    
    if(instance_exists(_o)){
        if(SV_y >= 10){
            //class chip specific handling
            for(var _i = en_charVar.hb0;_i <= en_charVar.hb7;_i++){
                var SV_act = SV_mem.src[? _i];
                
                if(scr_exists(SV_act) && ds_grid_value_exists(_o.grd_skillAct,0,0,ds_grid_width(_o.grd_skillAct) + -1,ds_grid_height(_o.grd_skillAct) + -1,SV_act)){
                    SV_act.src = noone;
                    SV_mem.src[? _i] = noone;
                }
            }
        }
        
        _o.src = noone;
    }
    
    if(scr_exists(G_tmp)){
        with G_tmp.src{
            for(var _i = en_charVar.hb0;_i <= en_charVar.clsU;_i++){
                if(src[? _i] == G_tmp){
                    src[? _i] = noone;
                }
            }
        }
    }
    
    SV_mem.src[? en_charVar.hb0 + SV_y] = G_tmp;
    
    scr_playSfx(sfx_equip);
    scr_playSfx(sfx_cutin);
    scr_playSfx(sfx_spell);
    
    scr_refreshEquips();
}