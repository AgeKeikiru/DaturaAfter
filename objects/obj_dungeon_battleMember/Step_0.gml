/// @description Insert description here
var
_ui = instance_find(obj_handler_menuUI,0),
_dh = instance_find(obj_handler_dungeon,0);

if( //check if outside of pause menus/events
	scr_exists(_dh,asset_object)
	&& !_dh.state_event
	&& !_dh.state_results
	&& (!scr_exists(_ui,asset_object) || _ui.grd_ps_xDraw[# 0,0] == 1)
){
	for(var _i = 0;_i < 6;_i++){
		if(ailment[_i] > 0){
			ailment[_i] += -scr_timeMod(1);
			
			if(ailment[_i] <= 0){
				ailment[_i] = 0;
				scr_cEvent_id(id,EVENT_BATTLM_ICONREFRESH);
			}
		}
	}
	
	if(iFrames >= 0){
		iFrames += -scr_timeMod(1);
	}
	
	swapCd += -scr_timeMod(1);
	swapCd = clamp(swapCd,0,swapMax);
}

if(ailment[CHAR_SA_PAR] > 0){
	if(scr_exists(stance)){
		instance_destroy(stance);
		stance = noone;
	}
}

if(instance_exists(actUsing) && actUsing.cdCurr <= 0 && actUsing.usable){
	global.tempBool = false;
	global.tempObj = id;
	
	with obj_handler_actEffect_idol_finale{
		if(src == global.tempObj){
			global.tempBool = true;
		}
	}
	
	if(!global.tempBool){
		global.tempFloat = 1;
		
		scr_cEvent(EVENT_SNCT_SHDMOD,id);
		
		enCurr += -actUsing.enCost * max(global.tempFloat,0);
	}
	
	globalvar G_tmp;
	with obj_handler_dungeon{
		G_tmp = tgtSlot;
	}
	
	//tgtIndex = G_tmp;
	
	scr_cEvent_id(actUsing,EVENT_ACT_USE);
	
	for(var _i = 0;_i < 8;_i++){
		var _act = act[_i];
		
		if(scr_exists(_act,asset_object) && !_act.xAct && _act.cdCurr < UNIVERSAL_COOLDOWN && !_act.agileAct && !_act.tempAgile && !actUsing.agileAct && !actUsing.tempAgile){
			_act.cdCurr += UNIVERSAL_COOLDOWN;
			_act.cdMax = _act.cdCurr;
		}
	}
	
	actUsing.cdCurr += actUsing.cdAdd * (actUsing.xAct ? 1 : 100);
	actUsing.cdMax = actUsing.cdCurr;
	actUsing.tempAgile = false;
	
	actUsing = noone;
}

if(hpCurr > 0){
	var _rec = .2;
	
	if(!scr_exists(_ui,asset_object) || _ui.grd_ps_xDraw[# 0,0] == 1){
		global.tempFloat = 0;
		
		scr_cEvent_id(obj_handler_actEffect,EVENT_EFFECT_ENRECMOD,id);
		scr_cEvent_id(obj_handler_class_parent,EVENT_EFFECT_ENRECMOD,id);
		
		with obj_handler_dungeon{
			global.tempFloat += !state_battle;
		}
		
		_rec *= 1 + max(global.tempFloat,-1);
		
		if(scr_exists(stance,asset_object) && stance.object_index == obj_handler_actEffect_shd){
			enCurr += -scr_timeMod((enMax * .02) / room_speed);
			
			if(enCurr <= 0){
				instance_destroy(stance);
			}
		}else{
			enCurr += scr_timeMod(_rec / (1 + ((ailment[CHAR_SA_SLW] > 0) * 3)));
		}
		
		if(ailment[CHAR_SA_PSN] > 0){
			if(hpCurr > 1){
				hpCurr += -scr_timeMod(hpMax * .0005);
				hpCurr = max(hpCurr,1);
			}
		}else if(hpCurr > 0){
			global.tempFloat = 0;
			
			scr_cEvent_id(obj_handler_actEffect,EVENT_EFFECT_HPRECMOD,id);
			scr_cEvent_id(obj_handler_class_parent,EVENT_EFFECT_HPRECMOD,id);
			
			hpCurr += global.tempFloat / room_speed;
		}
		
		enCurr = clamp(enCurr,0,enMax);
		hpCurr = clamp(hpCurr,0,hpMax);
	}
	
	if(enemyWait > 0){
		#region //enemy act
			var _spd = spd;
			
			global.tempFloat = 0;
			
			scr_cEvent_id(obj_handler_actEffect,EVENT_BATTLE_SPDMOD,id);
			scr_cEvent_id(obj_handler_class_parent,EVENT_BATTLE_SPDMOD,id);
			
			_spd += abs(spd) * global.tempFloat;
			
			_spd = max(_spd,-99);
			
			enemyWait += -scr_timeMod((100 + _spd) / (1 + ((ailment[CHAR_SA_SLW] > 0) * 3)));
		
			if(enemyWait <= 0){
				var
				_act = act[0],
				_aggroHi = -99,
				_aggroIndex = -1,
				_tgts = ds_list_create();
				
				//determine act to use
				switch src[? CHAR_VAR_ID]{
					#region //wolfeant
						case CHAR_WOLFEANT:
							if(random(1) < .2){
								_act = act[2];
							}else{
								_act = act[choose(0,1)];
							}
							
							break;
					#endregion
					
					#region //bigslime
						case CHAR_BIGSLIME:
							if(random(1) < .5 && instance_exists(obj_handler_dungeon) && ds_list_empty(obj_handler_dungeon.lst_popcorn)){
								_act = act[1];
							}else{
								_act = act[choose(0,0,2)];
							}
							
							break;
					#endregion
					
					#region //gDragon
						case CHAR_GDRAGON:
							if(random(1) < .4 && arr_ecd[0] <= 0){
								_act = act[0];
								
								arr_ecd[0] = 5;
							}else if(random(1) < .3){
								_act = act[choose(1,2)];
							}else{
								_act = act[choose(3,4,5)];
							}
							
							break;
					#endregion
					
					#region //gDragonGlitch
						case CHAR_GDRAGONGLITCH:
							if(random(1) < .3){
								_act = act[choose(0,1,2,3)];
							}else{
								_act = act[choose(4,5,6,7)];
							}
							
							break;
					#endregion
					
					default:
						var lst_acts = ds_list_create();
						
						for(var _i = 0;_i < 8;_i++){
							if(scr_exists(act[_i],asset_object)){
								ds_list_add(lst_acts,act[_i]);
							}
						}
						
						ds_list_shuffle(lst_acts);
						
						if(ds_list_size(lst_acts) > 0){
							_act = lst_acts[| 0];
						}
						
						break;
				}
				
				for(var _i = 0;_i < array_length_1d(arr_ecd);_i++){
					if(arr_ecd[_i] > 0){
						arr_ecd[_i] += -1;
					}
				}
				
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
					enemyWait += _act.cdAdd * 100;
				
					scr_cEvent_id(_act,EVENT_ACT_USE);
				}
			
				enemyWaitMax = enemyWait;
			}
		}
	#endregion
}else if(allyParty == global.grd_party_enemy && instance_number(obj_fpo_actBanner) == 0){
	globalvar G_tmp;
	G_tmp = true;
	
	with obj_handler_act{
		if(using){
			G_tmp = false;
		}
	}
	
	if(image_xscale == 1){
		scr_playSfx(sfx_killed);
		image_alpha += -.1;
	}
	
	if(G_tmp && image_xscale == 0){
		instance_destroy();
	}
}

if(image_alpha < 1 && hpCurr <= 0){
	image_xscale = ktk_scr_tween(image_xscale,0,2,-1);
	image_yscale = ktk_scr_tween(image_yscale,2,2,-1);
	image_alpha = ktk_scr_tween(image_alpha,0,2,-1);
}

if(hurtShake > 0){
	direction += 180 + random_range(-60,60);
}

hurtShake = ktk_scr_tween(hurtShake,0,4,.1);