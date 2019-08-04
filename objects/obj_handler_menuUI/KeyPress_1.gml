/// @description Insert description here

if(DEBUG){
	if(keyboard_check_pressed(vk_home)){
		game_restart();
	}else if(keyboard_check_pressed(vk_insert)){
		global.missionCurr = MSN_NLOEWI_01;
		
		scr_menu_briefConfirm_yes();
	}else if(keyboard_check_pressed(vk_end)){
		with obj_handler_dungeon{
			missionComplete = true;
		}
	}
}

if(scr_checkInput(IC_CHECK_PRESS,IC_KEY_MENUEXTRA) && grd_ps_xDraw[# 0,1] = 1 && !instance_exists(obj_handler_dialogue) && !title){
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