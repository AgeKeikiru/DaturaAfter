
transCurr = 0;
transTgt = 1;
txt_desc = "";
txt_descLabel = "";
txt_title = "PARTY";
txt_titleDesc = "Adjust party settings";
txt_ctrl[2] = "";
ps_baseMenuIndex = ds_stack_size(global.stk_menu);

var SV_m = scr_createMenuPanel(80,250,540,500,"party/..");

with SV_m{
    //link_panel.fill_alpha = 0;
    //link_panel.crosshair_alpha = 0;
    
	ds_grid_resize(grd_txt,1,5);
	ds_grid_resize(grd_scr,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_desc,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_descLabel,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	
	var SV_i = 0;
	
	grd_txt[# 0,SV_i] = "Check Items";
	grd_desc[# 0,SV_i] = "View and set consumable items.";
	grd_descLabel[# 0,SV_i] = "Inventory";
	grd_scr[# 0,SV_i] = scr_menu_party_item;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Check Status";
	grd_desc[# 0,SV_i] = "View the stats of party members.";
	grd_descLabel[# 0,SV_i] = "Status";
	grd_scr[# 0,SV_i] = scr_menu_party_status;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Change Equipment";
	grd_desc[# 0,SV_i] = "Adjust equipped Act, Accessory, and Class chips.";
	grd_descLabel[# 0,SV_i] = "Equip";
	grd_scr[# 0,SV_i] = scr_menu_party_equip;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Mission Info";
	grd_desc[# 0,SV_i] = "Review mission info and conditions.";
	grd_descLabel[# 0,SV_i] = "Mission";
	grd_scr[# 0,SV_i] = noone;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Options";
	grd_desc[# 0,SV_i] = "Adjust game settings.";
	grd_descLabel[# 0,SV_i] = "Setting";
	grd_scr[# 0,SV_i] = noone;
	
	scr_cEvent(id,EVENT_MENU_RESIZEPANEL);
}