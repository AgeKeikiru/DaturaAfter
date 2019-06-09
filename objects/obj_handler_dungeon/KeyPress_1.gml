/// @description Insert description here
// You can write your code in this editor

if(state_battle){
	var
	_mem = noone;
	
	for(var _i = 0;_i < 3;_i++){
		if(
			global.grd_party_player[# _i,0] != noone
			&& global.grd_party_player[# _i,0].hpCurr > 0
			&& scr_checkInput(IC_CHECK_DOWN,IC_KEY_PARTY1 + _i)
		){
			_mem = global.grd_party_player[# _i,0];
			break;
		}
	}
	
	if(_mem != noone){
		var _i = scr_checkInput(IC_CHECK_DOWN,IC_KEY_PARTYSHIFT) * 4;
		
		global.tempBool = true;
		global.tempObj = _mem;
		
		with(obj_handler_act){
			if(src == global.tempObj && using){
				global.tempBool = false;
			}
		}
		
		repeat(4){
			if(_mem.act[_i] != noone && global.tempBool && scr_checkInput(IC_CHECK_PRESS,IC_KEY_UP + (_i mod 4))){
				_mem.actUsing = _mem.act[_i];
				_mem.tgtIndex = tgtSlot;
				_mem.tgtEnemy = _mem.actUsing.tgtEnemy;
				
				break;
			}
			
			_i++;
		}
	}else{
		if(scr_checkInput(IC_CHECK_PRESS,IC_KEY_LEFT)){
			tgtSlot = 0;
		}
		
		if(scr_checkInput(IC_CHECK_PRESS,IC_KEY_UP)){
			tgtSlot = 1;
		}
		
		if(scr_checkInput(IC_CHECK_PRESS,IC_KEY_RIGHT)){
			tgtSlot = 2;
		}
		
		if(scr_checkInput(IC_CHECK_PRESS,IC_KEY_DOWN)){
			tgtSlot = -1;
		}
	}
}