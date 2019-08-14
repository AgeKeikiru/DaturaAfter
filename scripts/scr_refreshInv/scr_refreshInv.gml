///@arg list

with ds_stack_top(global.stk_menu){
    var
    SV_lst = argument0;
    
    ds_grid_resize(grd_txt,1,2);
    scr_menu_matchGrids(id,true);
    
    var SV_i = 0;
    
    if(SV_lst == global.lst_inv_acts){
        for(var SV_i3 = 0;SV_i3 < 4;SV_i3++){
        	var
        	SV_mem = global.grd_party_player[# global.tempInt % 3,global.tempInt > 2],
        	SV_class = SV_mem.class[SV_i3];
        	
        	if(scr_exists(SV_class,asset_object)){
        		var
        		SV_ix = 0,
        		SV_iy = 0;
        		
        		repeat(ds_grid_width(SV_class.grd_skillAct)){
        			SV_iy = 0;
        			
        			repeat(ds_grid_height(SV_class.grd_skillAct)){
        			    var SV_obj = SV_class.grd_skillAct[# SV_ix,SV_iy];
        			    
        			    if(scr_exists(SV_obj,asset_object) && SV_class.grd_skills[# SV_ix,SV_iy] > 0){
        			    	grd_txt[# 0,SV_i] = SV_obj.name;
        			    	grd_desc[# 0,SV_i] = SV_obj.desc;
        			    	grd_descLabel[# 0,SV_i] = SV_class.name + " Skill Chip";
        			    	grd_scr[# 0,SV_i] = scr_menu_party_equip_swapEquip;
        			    	grd_equipSrc[# 0,SV_i] = SV_obj;
        			    	
        			    	if(SV_obj.src != noone){
        			    		grd_txt[# 0,SV_i] = "[E]" + grd_txt[# 0,SV_i];
        			    		grd_scr[# 0,SV_i] = scr_menu_party_equip_unequip;
        			    	}
        			    	
        			    	ds_grid_resize(grd_txt,1,ds_grid_height(grd_txt) + 1);
        					scr_menu_matchGrids(id,false);
        					
        					SV_i++;
        			    }
        			    
        			    SV_iy++;
        			}
        			
        			SV_ix++;
        	    }
        	}
        }
    }
    
    for(var SV_i2 = 0;SV_i2 < ds_list_size(SV_lst);SV_i2++){
        scr_trace("i/i2: " + string(SV_i) + "/" + string(SV_i2));
        
        var SV_obj = SV_lst[| SV_i2];
        
        if(scr_exists(SV_obj,asset_object)){
            scr_trace(SV_obj.name);
            
            switch SV_lst{
            	case global.lst_inv_acts:
                	grd_txt[# 0,SV_i] = SV_obj.name;
                	grd_desc[# 0,SV_i] = SV_obj.desc;
                	grd_descLabel[# 0,SV_i] = "Weapon Chip";
                	grd_scr[# 0,SV_i] = scr_menu_party_equip_swapEquip;
                	grd_equipSrc[# 0,SV_i] = SV_obj;
                	
                	break;
                	
                case global.lst_inv_arms:
                    grd_txt[# 0,SV_i] = SV_obj.name;
                	grd_desc[# 0,SV_i] = SV_obj.desc;
                	grd_descLabel[# 0,SV_i] = "Armor Chip";
                	grd_scr[# 0,SV_i] = scr_menu_party_equip_swapEquip;
                	grd_equipSrc[# 0,SV_i] = SV_obj;
                	
                	break;
                	
                case global.lst_inv_classes:
                    grd_txt[# 0,SV_i] = SV_obj.name + " \"" + SV_obj.cName + "\"";
                	grd_desc[# 0,SV_i] = SV_obj.desc;
                	grd_descLabel[# 0,SV_i] = "Class Chip";
                	grd_scr[# 0,SV_i] = scr_menu_party_equip_swapEquip;
                	grd_equipSrc[# 0,SV_i] = SV_obj;
                	
                	break;
            }
            
            if(SV_obj.src != noone){
        		grd_txt[# 0,SV_i] = "[E]" + grd_txt[# 0,SV_i];
        		grd_scr[# 0,SV_i] = (SV_lst == global.lst_inv_classes) ? noone : scr_menu_party_equip_unequip;
        		grd_descLabel[# 0,SV_i] = "E: " + SV_obj.src.src[? CHAR_VAR_NAMEDISP];
        	}
        	
        	ds_grid_resize(grd_txt,1,ds_grid_height(grd_txt) + 1);
        	scr_menu_matchGrids(id,false);
        	
        	SV_i++;
        }else{
            ds_list_delete(SV_lst,SV_i2);
            SV_i2--;
        }
    }
    
    grd_txt[# 0,SV_i] = "Unequip";
    grd_desc[# 0,SV_i] = "Nothing equipped.";
    grd_scr[# 0,SV_i] = scr_menu_party_equip_swapEquip;
    
    SV_i++;
    
    grd_txt[# 0,SV_i] = "Return";
    grd_desc[# 0,SV_i] = "Return to previous menu.";
    grd_descLabel[# 0,SV_i] = "Back";
    grd_scr[# 0,SV_i] = scr_menu_back;
    
    if(ds_grid_height(grd_txt) >= page_h){
        page_y = clamp(page_y,0,ds_grid_height(grd_txt) + -page_h);
    }
}