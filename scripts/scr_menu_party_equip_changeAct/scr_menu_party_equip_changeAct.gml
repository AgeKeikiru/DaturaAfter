with ds_stack_top(global.stk_menu){
	global.tempInt = menu_y;
	
	with obj_handler_menuUI{
		ps_actSelected = global.tempInt;
	}
	
    visible = false;
    global.tempInt = global.lst_activePartySlots[| menu_x];
}

var SV_m = scr_createMenuPanel(20,105,500,-1,"party/equip/act/..");

with SV_m{
    page_h = 8;
    
	ds_grid_resize(grd_txt,1,2);
	ds_grid_resize(grd_scr,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_desc,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_descLabel,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_equipSrc,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	
	var SV_i = 0;
	
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
				    		grd_scr[# 0,SV_i] = noone;
				    	}
				    	
				    	ds_grid_resize(grd_txt,1,ds_grid_height(grd_txt) + 1);
						ds_grid_resize(grd_scr,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
						ds_grid_resize(grd_desc,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
						ds_grid_resize(grd_descLabel,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
						ds_grid_resize(grd_equipSrc,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
						
						SV_i++;
				    }
				    
				    SV_iy++;
				}
				
				SV_ix++;
		    }
		}
	}
	
	for(var SV_i2 = 0;SV_i2 < ds_list_size(global.lst_inv_acts);SV_i2++){
	    var SV_obj = global.lst_inv_acts[| SV_i2];
	    
    	grd_txt[# 0,SV_i] = SV_obj.name;
    	grd_desc[# 0,SV_i] = SV_obj.desc;
    	grd_descLabel[# 0,SV_i] = "Weapon Chip";
    	grd_scr[# 0,SV_i] = scr_menu_party_equip_swapEquip;
    	grd_equipSrc[# 0,SV_i] = SV_obj;
    	
    	if(SV_obj.src != noone){
    		grd_txt[# 0,SV_i] = "[E]" + grd_txt[# 0,SV_i];
    		grd_scr[# 0,SV_i] = noone;
    		grd_descLabel[# 0,SV_i] = "E: " + SV_obj.src.src[? CHAR_VAR_NAMEDISP];
    	}
    	
    	ds_grid_resize(grd_txt,1,ds_grid_height(grd_txt) + 1);
		ds_grid_resize(grd_scr,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
		ds_grid_resize(grd_desc,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
		ds_grid_resize(grd_descLabel,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
		ds_grid_resize(grd_equipSrc,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
		
		SV_i++;
    }
    
	grd_txt[# 0,SV_i] = "Unequip";
	grd_desc[# 0,SV_i] = "Nothing equipped.";
	grd_descLabel[# 0,SV_i] = "Act Chip";
	grd_scr[# 0,SV_i] = scr_menu_party_equip_swapEquip;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Return";
	grd_desc[# 0,SV_i] = "Return to previous menu.";
	grd_descLabel[# 0,SV_i] = "Back";
	grd_scr[# 0,SV_i] = scr_menu_back;
	
	scr_cEvent(id,EVENT_MENU_RESIZEPANEL);
}