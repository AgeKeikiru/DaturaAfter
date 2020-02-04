/// @description Insert description here
// You can write your code in this editor
if(DEBUG){
	if(keyboard_check_pressed(vk_pageup)){
		with(obj_handler_actEffect_ange_angelite){
			charge = 5;
		}
		
		with(obj_handler_actEffect_idol_hype){
			charge = 6;
		}
	}
}

if(global.playerControl){
	var _ui = instance_find(obj_handler_menuUI,0);
	
	if(state_results && !instance_exists(obj_handler_dialogue)){
		if(scr_checkInput(en_ic_check.down,en_ic_key.menuAccept)){
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
	}else if(ds_stack_size(global.stk_menu) < 1 && !instance_exists(obj_handler_dialogue) && !scr_checkInput(en_ic_check.down,en_ic_key.partySwap)){
		var
		_newX = global.dMap_xPos,
		_newY = global.dMap_yPos,
		_change = false; //flag if position is changed
	
		if(scr_checkInput(en_ic_check.down,en_ic_key.right)){
			_newX++;
			_change = true;
			
			pIcon = spr_imo_ow_runRight;
		}else if(scr_checkInput(en_ic_check.down,en_ic_key.left)){
			_newX--;
			_change = true;
			
			pIcon = spr_imo_ow_runLeft;
		}else if(scr_checkInput(en_ic_check.down,en_ic_key.up)){
			_newY--;
			_change = true;
			
			pIcon = spr_imo_ow_runUp;
		}else if(scr_checkInput(en_ic_check.down,en_ic_key.down)){
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