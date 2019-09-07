with scr_createSubmenu(450){
	//y += -100;
	//link_panel.y += -100;
	
	ds_grid_resize(grd_txt,1,3);
	scr_menu_matchGrids(id,true);
	
	global.simFloor = 0;
	
	ds_list_clear(global.lst_simAreas);
	ds_list_add(global.lst_simAreas,
	    SIM_FOREST,
	    SIM_TUNDRA,
	    SIM_TUNNELS
	);
	
	for(var SV_i = ds_list_size(global.lst_simAreas) + -1;SV_i >= 0;SV_i--){
	    var SV_key = SIM_FG_STATUS + global.lst_simAreas[| SV_i];
	    
	    if(global.map_flags[? SV_key] == -1 && !DEBUG){
	        ds_list_delete(global.lst_simAreas,SV_i);
	    }
	}
	
	var SV_i = 0;
	
	scr_menu_sim_tog_area(true,true);
	grd_scr[# 0,SV_i] = scr_menu_sim_tog_area;
	grd_toggle[# 0,SV_i] = true;
	
	menu_y = ++SV_i;
	
	scr_menu_sim_tog_floor(true,true);
	grd_scr[# 0,SV_i] = scr_menu_sim_tog_floor;
	grd_toggle[# 0,SV_i] = true;
	
	menu_y = ++SV_i;
	
	grd_txt[# 0,SV_i] = "ENGAGE";
	grd_scr[# 0,SV_i] = scr_menu_sim_start;
	
	menu_y = 0;
	
	scr_cEvent(id,EVENT_MENU_RESIZEPANEL);
}