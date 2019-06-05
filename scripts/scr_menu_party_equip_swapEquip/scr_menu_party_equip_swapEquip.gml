if(object_index == obj_handler_menu_parent){
    with obj_handler_menuUI{
        scr_menu_party_equip_swapEquip();
    }
}else{
    globalvar G_tmp;
    G_tmp = noone;
    
    var SV_menu = ds_stack_top(global.stk_menu);
    
    switch(SV_menu.link_panel.txt[0]){
        
        case "party/equip/act/..":
            if(SV_menu.menu_y < ds_list_size(global.lst_inv_acts)){
                G_tmp = global.lst_inv_acts[| SV_menu.menu_y];
                
                //ds_list_delete(global.lst_inv_acts,SV_menu.menu_y);
            }
            
            break;
            
        case "party/equip/armor/..":
            if(SV_menu.menu_y < ds_list_size(global.lst_inv_arms)){
                G_tmp = global.lst_inv_arms[| SV_menu.menu_y];
                
                //ds_list_delete(global.lst_inv_arms,SV_menu.menu_y);
            }
            
            break;
            
        case "party/equip/class/..":
            if(SV_menu.menu_y < ds_list_size(global.lst_inv_classes)){
                G_tmp = global.lst_inv_classes[| SV_menu.menu_y];
                
                //ds_list_delete(global.lst_inv_classes,SV_menu.menu_y);
            }
            
            break;
    }

    scr_menu_back();
    
    var
    SV_menu = ds_stack_top(global.stk_menu),
    SV_memX = global.lst_activePartySlots[| SV_menu.menu_x],
    SV_mem = global.grd_party_player[# SV_memX,0],
    SV_y = SV_menu.menu_y;
    
    scr_trace(SV_y);
    
    if(SV_y < 8){
        //act
        var SV_act = SV_mem.src[? "char_var_hb" + string(SV_y)];
        
        if(instance_exists(SV_act)){
            //ds_list_add(global.lst_inv_acts,SV_act);
            SV_act.src = noone;
        }
        
        SV_mem.src[? "char_var_hb" + string(SV_y)] = G_tmp;
        
        SV_menu.grd_txt[# SV_menu.menu_x,SV_menu.menu_y] = "ACT" + string(SV_menu.menu_y) + ": ";
    	
    	SV_act = G_tmp;
    	
    	if(instance_exists(SV_act)){
    	    SV_menu.grd_txt[# SV_menu.menu_x,SV_menu.menu_y] += SV_act.name;
    	    SV_menu.grd_desc[# SV_menu.menu_x,SV_menu.menu_y] = SV_act.desc;
    	}else{
    	    SV_menu.grd_txt[# SV_menu.menu_x,SV_menu.menu_y] += "-none-";
    	    SV_menu.grd_desc[# SV_menu.menu_x,SV_menu.menu_y] = "Nothing equipped.";
    	}
    }else if(SV_y < 10){
        //armor
        var SV_arm = SV_mem.src[? "char_var_arm" + string(SV_y + -8)];
        
        if(instance_exists(SV_arm)){
            //ds_list_add(global.lst_inv_arms,SV_arm);
            SV_arm.src = noone;
        }
        
        SV_mem.src[? "char_var_arm" + string(SV_y + -8)] = G_tmp;
        
        SV_menu.grd_txt[# SV_menu.menu_x,SV_menu.menu_y] = "ARM" + string(SV_menu.menu_y + -8) + ": ";
    	
    	SV_arm = G_tmp;
    	
    	if(instance_exists(SV_arm)){
    	    SV_menu.grd_txt[# SV_menu.menu_x,SV_menu.menu_y] += SV_arm.name;
    	    SV_menu.grd_desc[# SV_menu.menu_x,SV_menu.menu_y] = SV_arm.desc;
    	}else{
    	    SV_menu.grd_txt[# SV_menu.menu_x,SV_menu.menu_y] += "-none-";
    	    SV_menu.grd_desc[# SV_menu.menu_x,SV_menu.menu_y] = "Nothing equipped.";
    	}
    }else if(SV_y < ds_grid_height(SV_menu.grd_txt)){
        //class
        var SV_cls = SV_mem.src[? "char_var_cls" + string(SV_y + -10)];
        
        if(instance_exists(SV_cls)){
            //ds_list_add(global.lst_inv_classes,SV_cls);
            SV_cls.src = noone;
        }
        
        SV_mem.src[? "char_var_cls" + string(SV_y + -10)] = G_tmp;
        
        SV_menu.grd_txt[# SV_menu.menu_x,SV_menu.menu_y] = "CLS" + string(SV_menu.menu_y + -10) + ": ";
    	
    	SV_cls = G_tmp;
    	
    	if(instance_exists(SV_cls)){
    	    SV_menu.grd_txt[# SV_menu.menu_x,SV_menu.menu_y] += SV_cls.name  + " \"" + SV_cls.cName + "\"";
    	    SV_menu.grd_desc[# SV_menu.menu_x,SV_menu.menu_y] = SV_cls.desc;
    	}else{
    	    SV_menu.grd_txt[# SV_menu.menu_x,SV_menu.menu_y] += "-none-";
    	    SV_menu.grd_desc[# SV_menu.menu_x,SV_menu.menu_y] = "Nothing equipped.";
    	}
    }
    
    scr_cEvent(SV_mem,EVENT_BATTLM_INIT);
}