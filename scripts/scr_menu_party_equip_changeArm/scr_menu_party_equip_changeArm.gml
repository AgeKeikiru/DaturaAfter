with ds_stack_top(global.stk_menu){
    visible = false;
}

var SV_m = scr_createMenuPanel(20,105,500,-1,"party/equip/armor/..");

with SV_m{
    page_h = 8;
    
	ds_grid_resize(grd_txt,1,ds_list_size(global.lst_inv_arms) + 2);
	ds_grid_resize(grd_scr,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_desc,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_descLabel,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	
	var SV_i = 0;
	
	for(SV_i = 0;SV_i < ds_list_size(global.lst_inv_arms);SV_i++){
	    var SV_obj = global.lst_inv_arms[| SV_i];
	    
    	grd_txt[# 0,SV_i] = SV_obj.name;
    	grd_desc[# 0,SV_i] = SV_obj.desc;
    	grd_descLabel[# 0,SV_i] = "Armor Chip";
    	grd_scr[# 0,SV_i] = scr_menu_party_equip_swapEquip;
    	
    	if(SV_obj.src != noone){
    		grd_txt[# 0,SV_i] = "[E]" + grd_txt[# 0,SV_i];
    		grd_scr[# 0,SV_i] = noone;
    		grd_descLabel[# 0,SV_i] = "E: " + SV_obj.src.src[? CHAR_VAR_NAMEDISP];
    	}
    }
    
	grd_txt[# 0,SV_i] = "Unequip";
	grd_desc[# 0,SV_i] = "Nothing equipped.";
	grd_descLabel[# 0,SV_i] = "Armor Chip";
	grd_scr[# 0,SV_i] = scr_menu_party_equip_swapEquip;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Return";
	grd_desc[# 0,SV_i] = "Return to previous menu.";
	grd_descLabel[# 0,SV_i] = "Back";
	grd_scr[# 0,SV_i] = scr_menu_back;
	
	scr_cEvent(id,EVENT_MENU_RESIZEPANEL);
}