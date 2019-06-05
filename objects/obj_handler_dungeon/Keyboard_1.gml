/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(vk_home) && CANARY && global.missionCurr == MSN_DEBUG){
	game_restart();
}

if(global.playerControl){
	var _ui = instance_find(obj_handler_menuUI,0);
	
	if(state_results && !instance_exists(obj_handler_dialogue)){
		if(scr_checkInput(IC_CHECK_DOWN,IC_KEY_MENUACCEPT)){
			global.playerControl = false;
			
			with obj_handler_menuUI{
				visible = false;
				
				scr_menu_nextMenu();
			}
		}
	}else if(state_event){
		//
	}else if(state_battle){
		//
	}else if(ds_stack_size(global.stk_menu) < 1 && !instance_exists(obj_handler_dialogue)){
		var
		_newX = global.dMap_xPos,
		_newY = global.dMap_yPos,
		_change = false; //flag if position is changed
	
		if(scr_checkInput(IC_CHECK_DOWN,IC_KEY_RIGHT)){
			_newX++;
			_change = true;
			
			pIcon = spr_imo_ow_runRight;
		}else if(scr_checkInput(IC_CHECK_DOWN,IC_KEY_LEFT)){
			_newX--;
			_change = true;
			
			pIcon = spr_imo_ow_runLeft;
		}else if(scr_checkInput(IC_CHECK_DOWN,IC_KEY_UP)){
			_newY--;
			_change = true;
			
			pIcon = spr_imo_ow_runUp;
		}else if(scr_checkInput(IC_CHECK_DOWN,IC_KEY_DOWN)){
			_newY++;
			_change = true;
			
			pIcon = spr_imo_ow_runDown;
		}
	
		if(
			_change
			&& _newX >= 0 && _newX < ds_grid_width(global.grd_dMap_terrain)
			&& _newY >= 0 && _newY < ds_grid_height(global.grd_dMap_terrain)
			&& global.grd_dMap_terrain[# _newX,_newY] != noone
		){
			global.playerControl = false;
			global.dMap_xPosTgt = _newX;
			global.dMap_yPosTgt = _newY;
			
			state_moving = true;
		}
	}
}