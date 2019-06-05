txt_title = "MARKET";
txt_titleDesc = "Buy Weapon, Armor, and Item Chips here";

var SV_m = scr_createMenuPanel(80,160,360,400,"menu/market/..");

with SV_m{
	ds_grid_resize(grd_txt,1,4);
	ds_grid_resize(grd_scr,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_desc,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_descLabel,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	
	var SV_i = 0;
	
	grd_txt[# 0,SV_i] = "Buy Weapons";
	grd_desc[# 0,SV_i] = "Check what Act Chips are in stock.";
	grd_descLabel[# 0,SV_i] = "Weapon Rack";
	grd_scr[# 0,SV_i] = scr_menu_market_wpnArm;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Buy Armors";
	grd_desc[# 0,SV_i] = "Check what Armor Chips are in stock.";
	grd_descLabel[# 0,SV_i] = "Armor Rack";
	grd_scr[# 0,SV_i] = scr_menu_market_wpnArm;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Buy Items";
	grd_desc[# 0,SV_i] = "Check what Item Chips are in stock.";
	grd_descLabel[# 0,SV_i] = "Item Rack";
	grd_scr[# 0,SV_i] = scr_menu_market_item;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Return";
	grd_desc[# 0,SV_i] = "Return to previous menu.";
	grd_descLabel[# 0,SV_i] = "Home";
	grd_scr[# 0,SV_i] = scr_menu_back;
	
	scr_cEvent(id,EVENT_MENU_RESIZEPANEL);
}