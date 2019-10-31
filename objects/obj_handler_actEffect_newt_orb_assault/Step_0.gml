event_inherited();

atkDelay += -scr_timeMod(1);

if(atkDelay < 0 && scr_exists(src,asset_object) && ds_list_size(special) > 0){
	atkDelay = room_speed * 3;
	
	var
	_dmg = special[| 0] * (1 + (src.fAtk / 100)),
	_i = irandom(2),
	_party = src.enemyParty,
	_tgt = _party[# _i,0],
	_valid = false;
	
	repeat(3){
		if(scr_exists(_tgt,asset_object) && _tgt.hpCurr > 0){
			_valid = true;
			break;
		}else{
			_i = (_i + 1) % 3;
			_tgt = _party[# _i,0];
		}
	}
	
	if(_valid){
		var _p = scr_createEffectTxt(_tgt,string(_dmg));
		
		_tgt.hpCurr += -_dmg;
		_tgt.hpCurr = clamp(_tgt.hpCurr,0,_tgt.hpMax);
		
		if(_tgt.hpCurr <= 0){
			scr_cEvent(EVENT_BATTLE_ENEMYKILLED,src,_tgt,id);
		}
		
		scr_playSfx(sfx_elc);
		scr_createSpark(_p.x,_p.y,spr_spark_shoot,CHAR_VAR_ELE_ELC);
		
		_p.y += -100;
		
		_tgt.hurtShake = 1;
		
		if(_tgt.allyParty == global.grd_party_player){
			with obj_handler_dungeon{
				ve_col = ve_tgtCol == c_black ? c_red : c_white;
			}
		}
	}
}