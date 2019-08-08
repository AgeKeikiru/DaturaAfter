var _m = scr_createMenuPanel(room_width + 100,600,0,0,"");
	
with _m{
	ds_grid_resize(grd_txt,1,3);
	scr_menu_matchGrids(id,true);
	
	var _i = 0;
	
	grd_txt[# 0,_i] = "New Game";
	grd_scr[# 0,_i] = scr_newGame;
	
	_i++;
	
	grd_txt[# 0,_i] = "Load Game";
	grd_scr[# 0,_i] = file_exists(DATA_FNAME + "SYS") ? scr_load : noone;
	
	_i++;
	
	grd_txt[# 0,_i] = "Quit";
	grd_scr[# 0,_i] = scr_quit;
	
	menu_y = file_exists(DATA_FNAME + "SYS");
}