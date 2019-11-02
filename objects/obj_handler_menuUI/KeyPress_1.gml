
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

if(CANARY){
	if(keyboard_check_pressed(vk_insert)){
		global.manualDebug = !global.manualDebug;
	}
}

if(scr_checkInput(en_ic_check.press,en_ic_key.menuExtra) && !instance_exists(obj_handler_dialogue) && !title){
	var
	_ok = true,
	_dh = instance_find(obj_handler_dungeon,0),
	_m = ds_stack_top(global.stk_menu);
	
	if(scr_exists(_dh,asset_object) && (_dh.state_battle || _dh.state_results)){
		_ok = false;
	}
	
	if(_ok){
		if(scr_exists(_m,asset_object) && script_exists(_m.extra_function)){
			script_execute(_m.extra_function);
		}else if(
			(!scr_exists(_m,asset_object) || (_m.extra_function != -1 && !_m.submenu))
			&& grd_ps_xDraw[# 0,1] = 1
		){
			scr_runTimeline(tl_menuUI_ps_open);
		}
	}
}