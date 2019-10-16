global.playerControl = false;

with(obj_handler_menuUI){
	with ds_stack_top(global.stk_menu){
	    visible = false;
	}
	
	txt_desc = "";
	txt_descLabel = "";
	txt_title = "ITEM";
	txt_titleDesc = "View and set consumable items";
}

var SV_m = scr_createMenuPanel(20,105,500,-1,"party/item/..");

with SV_m{
	extra_function = -1;
	
	var
	SV_i = 0;
	
	ds_grid_resize(grd_txt,1,9);
	ds_grid_resize(grd_scr,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_desc,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_descLabel,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	
	repeat(8){
    	grd_txt[# 0,SV_i] = "ITEM" + string(SV_i) + ": " + global.arr_itemSet[SV_i];
    	grd_desc[# 0,SV_i] = "Nothing equipped.";
    	grd_descLabel[# 0,SV_i] = "Item Chip";
    	grd_scr[# 0,SV_i] = scr_menu_party_item_changeItem;
    	
    	if(global.arr_itemSet[SV_i] == ""){
    		grd_txt[# 0,SV_i] += "-none-";
    	}
    	
    	var SV_key = scr_data_map_findKey(global.map_item_name,global.arr_itemSet[SV_i]);
    	
    	if(!is_undefined(SV_key)){
    		grd_desc[# 0,SV_i] = global.map_item_desc[? SV_key];
    	}
    	
    	SV_i++;
	}
	
	grd_txt[# 0,SV_i] = "Return";
	grd_desc[# 0,SV_i] = "Return to previous menu.";
	grd_descLabel[# 0,SV_i] = "Back";
	grd_scr[# 0,SV_i] = scr_menu_back;
	
	scr_cEvent_id(id,EVENT_MENU_RESIZEPANEL);
}