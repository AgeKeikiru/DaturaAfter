global.map_flags[? FG_PROLOGUE] = false;

txt_title = "HOME";
txt_titleDesc = "Select an area";

var SV_m = scr_createMenuPanel(80,160,360,400,"menu/..");

with SV_m{
	ds_grid_resize(grd_txt,1,5);
	scr_menu_matchGrids(id,true);
	
	var SV_i = 0;
	
	grd_txt[# 0,SV_i] = "Request Mission";
	grd_desc[# 0,SV_i] = "Tackle a specially assigned task.";
	grd_descLabel[# 0,SV_i] = "Request Counter";
	grd_scr[# 0,SV_i] = scr_menu_nextMenu;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Exploration";
	grd_desc[# 0,SV_i] = "Venture into the depths.";
	grd_descLabel[# 0,SV_i] = "Exploration Counter";
	grd_scr[# 0,SV_i] = noone;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Market";
	grd_desc[# 0,SV_i] = "Buy weapons, armor, and items.";
	grd_descLabel[# 0,SV_i] = "Merchant Counter";
	grd_scr[# 0,SV_i] = scr_menu_nextMenu;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Chip Lab";
	grd_desc[# 0,SV_i] = "Upgrade Class, Weapon, and Armor Chips.";
	grd_descLabel[# 0,SV_i] = "R&D Counter";
	grd_scr[# 0,SV_i] = scr_menu_nextMenu;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Gathering Hub";
	grd_desc[# 0,SV_i] = "Gather info and change formation.";
	grd_descLabel[# 0,SV_i] = "Gathering Hub";
	grd_scr[# 0,SV_i] = scr_menu_nextMenu;
	
	scr_cEvent(id,EVENT_MENU_RESIZEPANEL);
}