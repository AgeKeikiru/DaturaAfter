txt_title = "MISSION";
txt_titleDesc = "Select a mission";

ds_list_clear(global.lst_missionIndex);
	
var SV_m = scr_createMenuPanel(80,160,560,400,"menu/mission/..");

with SV_m{
	ds_grid_resize(grd_txt,1,1);
	ds_grid_resize(grd_scr,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_desc,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_descLabel,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	
	var SV_i = 0;
	
	for(var SV_i2 = 0;SV_i2 < ds_grid_height(global.grd_missions);SV_i2++){
		var SV_mission = global.grd_missions[# 1,SV_i2];
		
		if(SV_mission[? MSN_VAR_STATUS] == 1){ //todo: change to 1
			ds_list_add(global.lst_missionIndex,SV_mission[? MSN_VAR_ID]);
		
			grd_txt[# 0,SV_i] = SV_mission[? MSN_VAR_NAME];
			grd_desc[# 0,SV_i] = "Client: " + SV_mission[? MSN_VAR_CLIENT] + "\nReward: " + string(SV_mission[? MSN_VAR_REWARD]) + "g";
			grd_descLabel[# 0,SV_i] = "Commission";
			grd_scr[# 0,SV_i] = scr_menu_mission_brief;
	
			SV_i++;
			
			ds_grid_resize(grd_txt,1,ds_grid_height(grd_txt) + 1);
			ds_grid_resize(grd_scr,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
			ds_grid_resize(grd_desc,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
			ds_grid_resize(grd_descLabel,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
		}
	}
	
	grd_txt[# 0,SV_i] = "Return";
	grd_desc[# 0,SV_i] = "Return to previous menu.";
	grd_descLabel[# 0,SV_i] = "Home";
	grd_scr[# 0,SV_i] = scr_menu_back;
	
	scr_cEvent(id,EVENT_MENU_RESIZEPANEL);
}