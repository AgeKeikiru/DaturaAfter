txt_title = "CHIP LAB";
txt_titleDesc = "Upgrade Class, Weapon, and Armor Chips";

var SV_m = scr_createMenuPanel(80,160,360,400,"menu/lab/..");

with SV_m{
	ds_grid_resize(grd_txt,1,7);
	ds_grid_resize(grd_scr,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_desc,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_descLabel,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	
	var SV_i = 0;
	
	grd_txt[# 0,SV_i] = "Upgrade Class";
	grd_desc[# 0,SV_i] = "\"You won't get far without Skills. I can install new ones here.\"";
	grd_descLabel[# 0,SV_i] = "CC Module";
	grd_scr[# 0,SV_i] = scr_menu_lab_class;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Rename Class";
	grd_desc[# 0,SV_i] = "\"You can change a Class Chip's unique name free of charge. Good for keeping track of alternate or specialty builds.\"";
	grd_descLabel[# 0,SV_i] = "Terminal";
	grd_scr[# 0,SV_i] = scr_menu_lab_class;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Upgrade Weapon";
	grd_desc[# 0,SV_i] = "\"Increase a Weapon Chip's Plus Rating to boost its power.\"";
	grd_descLabel[# 0,SV_i] = "WC Module";
	grd_scr[# 0,SV_i] = noone;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Remodel Weapon";
	grd_desc[# 0,SV_i] = "\"Weapon Chips at +10 can increase their Rank, boosting unique stats. This is the only way to obtain R5 Weapon Chips.\"";
	grd_descLabel[# 0,SV_i] = "Crafting Station";
	grd_scr[# 0,SV_i] = noone;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Upgrade Armor";
	grd_desc[# 0,SV_i] = "\"Increase an Armor Chip's Plus Rating to boost its defensive ability.\"";
	grd_descLabel[# 0,SV_i] = "AC Module";
	grd_scr[# 0,SV_i] = noone;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Edit Armor";
	grd_desc[# 0,SV_i] = "\"You can reallocate an Armor Chip's Element Resist points here. Just know the total number of points cannot change.\"";
	grd_descLabel[# 0,SV_i] = "Editing Station";
	grd_scr[# 0,SV_i] = noone;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Return";
	grd_desc[# 0,SV_i] = "Return to previous menu.";
	grd_descLabel[# 0,SV_i] = "Home";
	grd_scr[# 0,SV_i] = scr_menu_back;
	
	scr_cEvent_id(id,EVENT_MENU_RESIZEPANEL);
}