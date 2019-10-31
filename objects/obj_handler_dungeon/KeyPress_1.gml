/// @description Insert description here
// You can write your code in this editor

if(state_battle){
	var
	_mem = noone;
	
	for(var _i = 0;_i < 3;_i++){
		if(
			global.grd_party_player[# _i,0] != noone
			&& global.grd_party_player[# _i,0].hpCurr > 0
			&& scr_checkInput(en_ic_check.down,en_ic_key.party1 + _i)
		){
			_mem = global.grd_party_player[# _i,0];
			break;
		}
	}
	
	if(_mem != noone){
		var _i = scr_checkInput(en_ic_check.down,en_ic_key.partyShift) * 4;
		
		global.tempBool = true;
		global.tempObj = _mem;
		
		with(obj_handler_act){
			if(src == global.tempObj && using){
				global.tempBool = false;
			}
		}
		
		repeat(4){
			if(scr_exists(_mem.act[_i],asset_object) && global.tempBool && scr_checkInput(en_ic_check.press,en_ic_key.up + (_i mod 4))){
				_mem.actUsing = _mem.act[_i];
				_mem.tgtIndex = tgtSlot;
				_mem.tgtEnemy = _mem.actUsing.tgtEnemy;
				
				break;
			}
			
			_i++;
		}
	}else{
		if(scr_checkInput(en_ic_check.press,en_ic_key.left)){
			tgtSlot = 0;
		}
		
		if(scr_checkInput(en_ic_check.press,en_ic_key.up)){
			tgtSlot = 1;
		}
		
		if(scr_checkInput(en_ic_check.press,en_ic_key.right)){
			tgtSlot = 2;
		}
		
		if(scr_checkInput(en_ic_check.press,en_ic_key.down)){
			tgtSlot = global.set_altDownTgt ? 1 : -1;
		}
	}
}