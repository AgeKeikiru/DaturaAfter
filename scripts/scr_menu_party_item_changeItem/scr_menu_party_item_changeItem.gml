with ds_stack_top(global.stk_menu){
    visible = false;
}

var SV_m = scr_createMenuPanel(20,105,500,-1,"party/item/change/..");

with SV_m{
    page_h = 8;
    
    var
    SV_i = 0,
    SV_grd = scr_getItemMenuInfo();
    
	ds_grid_resize(grd_txt,1,ds_grid_height(SV_grd) + 2);
	ds_grid_resize(grd_scr,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_desc,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_descLabel,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	
	for(SV_i = 0;SV_i < ds_grid_height(SV_grd);SV_i++){
    	grd_txt[# 0,SV_i] = SV_grd[# 0,SV_i] + " [x" + string(SV_grd[# 1,SV_i]) + "]";
    	grd_desc[# 0,SV_i] = SV_grd[# 2,SV_i];
    	grd_descLabel[# 0,SV_i] = "Item Chip";
    	grd_scr[# 0,SV_i] = scr_menu_party_item_swapItem;
    }
    
	grd_txt[# 0,SV_i] = "Unequip";
	grd_desc[# 0,SV_i] = "Nothing equipped.";
	grd_descLabel[# 0,SV_i] = "Item Chip";
	grd_scr[# 0,SV_i] = scr_menu_party_item_swapItem;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Return";
	grd_desc[# 0,SV_i] = "Return to previous menu.";
	grd_descLabel[# 0,SV_i] = "Back";
	grd_scr[# 0,SV_i] = scr_menu_back;
	
	scr_cEvent_id(id,EVENT_MENU_RESIZEPANEL);
}