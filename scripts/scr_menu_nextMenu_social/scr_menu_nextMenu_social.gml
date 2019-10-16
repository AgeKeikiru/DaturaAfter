txt_title = "SOCIAL";
txt_titleDesc = "Gather info and change formation here";

var SV_m = scr_createMenuPanel(80,160,360,400,"menu/social/..");

with SV_m{
	ds_grid_resize(grd_txt,1,3);
	scr_menu_matchGrids(id,true);
	
	var SV_i = 0;
	
	grd_txt[# 0,SV_i] = "Talk";
	grd_desc[# 0,SV_i] = "Mingle and gather information from NPCs or other players.";
	grd_descLabel[# 0,SV_i] = "Social Area";
	grd_scr[# 0,SV_i] = scr_menu_social_talk;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Formation";
	grd_desc[# 0,SV_i] = "Rearrange party members.";
	grd_descLabel[# 0,SV_i] = "Team Room";
	grd_scr[# 0,SV_i] = scr_menu_social_formation;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Return";
	grd_desc[# 0,SV_i] = "Return to previous menu.";
	grd_descLabel[# 0,SV_i] = "Home";
	grd_scr[# 0,SV_i] = scr_menu_back;
	
	scr_cEvent_id(id,EVENT_MENU_RESIZEPANEL);
}