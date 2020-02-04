var _m = ds_stack_top(global.stk_menu);

global.playerControl = false;
global.tempObj = _m.grd_equipSrc[# _m.menu_x,_m.menu_y];

with scr_createSubmenu(50){
	ds_grid_resize(grd_txt,3,2);
	scr_menu_matchGrids(id,true);
	
	for(var _ix = 0;_ix < 3;_ix++){
	    for(var _iy = 0;_iy < 2;_iy++){
    	    grd_txt[# _ix,_iy] = (_iy ? "R" : "V") + string(_ix);
    	    grd_scr[# _ix,_iy] = scr_menu_social_formation_select_set;
    	}
	}
	
	scr_cEvent_id(id,EVENT_MENU_RESIZEPANEL);
}