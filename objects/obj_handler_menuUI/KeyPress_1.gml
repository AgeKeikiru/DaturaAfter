/// @description Insert description here

if(scr_checkInput(IC_CHECK_PRESS,IC_KEY_MENUEXTRA) && grd_ps_xDraw[# 0,1] = 1 && !instance_exists(obj_handler_dialogue)){
	var
	_ok = true,
	_dh = instance_find(obj_handler_dungeon,0);
	
	if(scr_exists(_dh,asset_object) && (_dh.state_battle || _dh.state_results)){
		_ok = false;
	}
	
	if(_ok){
	    timeline_index =  tl_menuUI_ps_open;
	    timeline_position = 0;
	    timeline_loop = false;
	    timeline_running = true;
	}
}