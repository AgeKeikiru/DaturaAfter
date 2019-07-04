with ds_stack_top(global.stk_menu){
    visible = false;
}

var
SV_m = scr_createMenuPanel(20,105,520,-1,"menu/market/items/.."),
SV_lst = global.lst_shop_items;

with SV_m{
	ds_grid_resize(grd_txt,1,ds_list_size(SV_lst) + 1);
	scr_menu_matchGrids(id,true);
	
	var SV_i = 0;
	
	for(SV_i = 0;SV_i < ds_list_size(SV_lst);SV_i++){
	    var SV_item = SV_lst[| SV_i];
	    
    	grd_txt[# 0,SV_i] = scr_stringGapFormat(global.map_item_name[? SV_item],string(global.map_item_price[? SV_item]) + "g",30);
    	grd_desc[# 0,SV_i] = global.map_item_desc[? SV_item];
    	grd_descLabel[# 0,SV_i] = "Item Chip";
    	grd_scr[# 0,SV_i] = scr_menu_market_itemConfirm;
    }
    
	grd_txt[# 0,SV_i] = "Return";
	grd_desc[# 0,SV_i] = "Return to previous menu.";
	grd_descLabel[# 0,SV_i] = "Back";
	grd_scr[# 0,SV_i] = scr_menu_back;
	
	scr_cEvent(id,EVENT_MENU_RESIZEPANEL);
}