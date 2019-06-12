/// @description Insert description here
// You can write your code in this editor
if(true){ //check if outside of pause menus/events
	for(var _i = 0;_i < 6;_i++){
		if(ailment[_i] > 0){
			ailment[_i] += -1;
			
			if(ailment[_i] <= 0){
				ailment[_i] = 0;
				scr_cEvent(id,EVENT_BATTLM_ICONREFRESH);
			}
		}
	}
	
	iFrames--;
}

if(ailment[CHAR_SA_PAR] > 0){
	if(scr_exists(stance,asset_object)){
		instance_destroy(stance);
		stance = noone;
	}
}

if(instance_exists(actUsing) && actUsing.cdCurr <= 0 && actUsing.usable){
	enCurr += -actUsing.enCost;
	
	globalvar G_tmp;
	with obj_handler_dungeon{
		G_tmp = tgtSlot;
	}
	
	tgtIndex = G_tmp;
	
	scr_cEvent(actUsing,EVENT_ACT_USE);
	
	for(var _i = 0;_i < 8;_i++){
		var _act = act[_i];
		
		if(scr_exists(_act,asset_object) && !_act.xAct){
			_act.cdCurr += UNIVERSAL_COOLDOWN;
			_act.cdMax = _act.cdCurr;
		}
	}
	
	actUsing.cdCurr += actUsing.cdAdd;
	actUsing.cdMax = actUsing.cdCurr;
	
	actUsing = noone;
}

if(hpCurr > 0){
	enCurr += .1 / (1 + ((ailment[CHAR_SA_SLW] > 0) * 3));
	enCurr = min(enCurr,enMax);
	
	if(ailment[CHAR_SA_PSN] > 0){
		hpCurr += -hpMax * .0005;
	}
	
	if(enemyWait > 0){
		var _spd = spd;
		
		global.tempFloat = 0;
		scr_cEvent(all,EVENT_BATTLE_SPDMOD,id);
		_spd += abs(spd) * global.tempFloat;
		
		_spd = max(_spd,-99);
		
		enemyWait += -(100 + _spd) / (1 + ((ailment[CHAR_SA_SLW] > 0) * 3));
	
		if(enemyWait <= 0){
			var
			_act = act[0],
			_aggroHi = -99,
			_aggroIndex = -1,
			_tgts = ds_list_create();
			
			ds_list_add(_tgts,
				0,
				1,
				2
			);
			
			for(var _i = 0;_i < 3;_i++){
				var _obj = global.grd_party_player[# _i,0];
				
				if(scr_exists(_obj,asset_object) && _obj.hpCurr > 0){
					repeat(abs(_obj.aggro)){
						if(_obj.aggro > 0){
							ds_list_add(_tgts,_i);
						}else{
							ds_list_add(_tgts,(_i + 1) mod 3,(_i + 2) mod 3);
						}
					}
					
					if(_obj.aggro > _aggroHi){
						_aggroHi = _obj.aggro;
						_aggroIndex = _i;
					}
				}
			}
			
			if(_aggroIndex != -1){
				repeat(2){
					ds_list_add(_tgts,_aggroIndex);
				}
			}
			
			ds_list_shuffle(_tgts);
			
			var _obj;
			
			do{
				scr_trace(scr_list_toString(_tgts));
				
				tgtIndex = _tgts[| 0];
				ds_list_delete(_tgts,0);
				_obj = global.grd_party_player[# tgtIndex,0];
			}until(
				(scr_exists(_obj,asset_object) && _obj.hpCurr > 0)
				|| ds_list_size(_tgts) == 0
			)
		
			enemyWait = UNIVERSAL_COOLDOWN;
		
			if(instance_exists(_act)){
				enemyWait += _act.cdAdd;
			
				scr_cEvent(_act,EVENT_ACT_USE);
			}
		
			enemyWaitMax = enemyWait;
		}
	}
}else if(allyParty == global.grd_party_enemy && instance_number(obj_fpo_actBanner) == 0){
	globalvar G_tmp;
	G_tmp = true;
	
	with obj_handler_act{
		if(using){
			G_tmp = false;
		}
	}
	
	if(G_tmp){
		instance_destroy();
	}
}

if(hurtShake > 0){
	direction += 180 + random_range(-60,60);
}

hurtShake = ktk_scr_tween(hurtShake,0,4,.1);