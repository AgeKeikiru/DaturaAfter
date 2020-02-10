var SV_m = ds_stack_top(global.stk_menu);

with SV_m{
    var
	_y = 0;
	
	back_function = scr_menu_social_formation_confirm;
	
	page_h = 6;
	
	ds_grid_resize(grd_txt,1,1);
	scr_menu_matchGrids(id,true);
	
	for(_char = 0;_char < en_chars.slime;_char++){
    	var
    	_map = global.grd_chars[# 1,_char],
    	_key = global.grd_chars[# 0,_char];
    	
    	if(_map != noone && (global.map_flags[? _key] || DEBUG)){
	    	var
	    	_id = _map[? en_charVar.charID],
	    	_mem = global.map_chars[? _id],
	    	_mx = ds_grid_value_x(global.grd_newFormation,0,0,2,1,_mem),
	    	_my = ds_grid_value_y(global.grd_newFormation,0,0,2,1,_mem);
	    	
	    	grd_txt[# 0,_y] = "";
	    	
	    	if(_mx >= 0 && _my >= 0){
	    	    grd_txt[# 0,_y] = "[" + (_my ? "R" : "V") + string(_mx + 1) + "]"
	    	}
	    	
	    	grd_txt[# 0,_y] += _map[? en_charVar.nameDisp];
	    	grd_scr[# 0,_y] = scr_menu_social_formation_select;
	    	grd_equipSrc[# 0,_y] = _mem;
	    	
	    	_y++;
	    	ds_grid_resize(grd_txt,1,_y + 2);
		    scr_menu_matchGrids(id,false);
    	}
	}
	
	grd_txt[# 0,_y] = "Clear";
	grd_scr[# 0,_y] = scr_menu_social_formation_clear;
	
	_y++;
	
	grd_txt[# 0,_y] = "Return";
	grd_scr[# 0,_y] = scr_menu_social_formation_confirm;
}