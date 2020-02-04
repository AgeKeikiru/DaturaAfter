
if(abort){
	abort = false;
	using = false;
	exit;
}

if(hitLoopRemaining == hitCount){
	for(var _i = 0;_i < ds_list_size(dc_tgt);_i++){
		var _tgt = eSelf_start ? src : dc_tgt[| _i];
		
		scr_act_createEffect(effect_start,eChance_start,_tgt,rare,stanceAct,special);
		scr_createSpark(_tgt.x,_tgt.y + -70,spark_start,ele);
		scr_playSfx(se_start);
	}
}

if(!nonAttack){
	for(var _i = 0;_i < (tgtType == ACT_TGT_RANDOM ? 1 : ds_list_size(dc_tgt));_i++){
		var _hit = false;
		
		if(tgtType == ACT_TGT_RANDOM){
			_i = hitLoopRemaining + -1;
		}
		
		global.tempInt = dc_tgt[| _i];
		scr_cEvent(EVENT_SNCT_SAVECHECK,dc_dmgMax[| _i],id);
		
		dc_tgt[| _i] = global.tempInt;
		
		repeat(hitSimul){
			var
			_aimCheck = (random(1) + dc_aim[| _i]) * 100,
			_dmg = irandom_range(dc_dmgMin[| _i],dc_dmgMax[| _i]),
			_p = scr_createEffectTxt(dc_tgt[| _i],""),
			_pX = _p.x,
			_pY = _p.y;
			
			var _debug = 0;
			
			scr_trace(string(_debug++) + ": " + string(_dmg));
			
			//special act behaviors
			switch(object_index){
				case obj_handler_act_ange_hRend:
					_dmg = round(min(dc_tgt[| _i].hpCurr / 2,special[| 0]));
				
					scr_trace("special case [" + name + "]: dmg = half remaining hp");
					
					break;
				case obj_handler_act_raze_rCross:
					if(ds_list_size(special) > 0 && random(1) < special[| 0]){
						_dmg = 99999999;
						
						scr_trace("special case [" + name + "]: instakill");
					}
					
					break;
			}
			
			//shield handling
			global.tempFloat = 1;
			global.tempGrd = dc_tgt[| _i].allyParty;
			
			with obj_handler_actEffect_shd{
				if(src.allyParty == global.tempGrd && ds_list_size(special) > 0){
					global.tempFloat += -special[| 0];
					scr_trace("shield damage cut: -" + string(special[| 0] * 100) + "%");
				}
			}
			
			_dmg = max(round(_dmg * global.tempFloat),0);
			var _chip = ((_dmg / dc_tgt[| _i].hpMax) < .01) && tgtEnemy;
			
			global.tempBool = false;
			scr_cEvent(EVENT_NEWT_SAVECHECK,dc_dmgMax[| _i],dc_tgt[| _i],id);
			
			scr_trace(string(_debug++) + ": " + string(_dmg));
			
			if(global.tempBool){
				_dmg = 0;
				_chip = true;
			}
			
			scr_trace(string(_debug++) + ": " + string(_dmg));
			
			scr_trace("\naimCheck " + string(_aimCheck) + " > " + string(100 + -acc));
			
			if(
				scr_exists(dc_tgt[| _i])
				&& (
					_aimCheck > 100 + -acc
					|| dc_tgt[| _i].ailment[CHAR_SA_PAR] > 0
					|| dc_tgt[| _i].ailment[CHAR_SA_SLW] > 0
				)
				&& !(src.ailment[CHAR_SA_BLD] > 0 && choose(true,false))
				&& !(src.ailment[CHAR_SA_SLC] > 0 && ele != "")
				&& !(tgtEnemy && dc_tgt[| _i].iFrames > 0)
				&& ((revive ^^ dc_tgt[| _i].hpCurr > 0) || dc_tgt[| _i].allyParty == global.grd_party_enemy)
			){
				_hit = true;
				
				_p.visible = pwr > 0;
				_p.y += -100;
				
				global.tempFloat = 1;
				
				if(pwr > 0){
					scr_cEvent(tgtEnemy ? EVENT_BATTLE_ENEMYHIT : EVENT_BATTLE_HEALED,src,dc_tgt[| _i],id,_dmg);
				}
				
				scr_trace(string(_debug++) + ": " + string(_dmg));
				
				_dmg = ceil(_dmg * global.tempFloat);
				
				scr_trace(string(_debug++) + ": " + string(_dmg));
				
				global.critChance = clamp(dc_aim[| _i],0.01,0.1);
				global.critBonus = 1.2;
				
				scr_cEvent(EVENT_BATTLE_CRITMOD,src,dc_tgt[| _i],id);
				
				var _crit = random(1) < global.critChance;
				
				scr_trace(string(_debug++) + ": " + string(_dmg));
				
				_p.txt[0] = string(_dmg);
				_p.txt_col[0] = tgtEnemy ? c_white : CC_HEALGREEN;
				
				_p.txt[1] = dc_weakres[| _i];
				_p.txt_col[1] = (_p.txt[1] == "WEAK") ? c_yellow : c_ltgray;
				
				if(_crit){
					_p.txt_col[0] = CC_CRIT;
					_p.txt_xScale[0] += .5;
					_p.txt_yScale[0] = _p.txt_xScale[0];
					
					_dmg = max(ceil(dc_dmgMax[| _i] * global.critBonus),0);
					
					_p.txt[0] = string(_dmg);
				}
				
				scr_trace(string(_debug++) + ": " + string(_dmg));
				
				global.tempLst = ds_list_create();
				ds_list_add(global.tempLst,
					0,
					0,
					0,
					0,
					0,
					0
				);
				
				for(var _i2 = 0;_i2 < 6;_i2++){
					global.tempLst[| _i2] += sa_inflict[| _i2];
				}
				
				global.tempLst2 = ds_list_create();
				ds_list_add(global.tempLst2,
					0,
					0,
					0,
					0,
					0,
					0
				);
				
				for(var _i2 = 0;_i2 < 6;_i2++){
					global.tempLst2[| _i2] += sa_chance[| _i2];
				}
				
				scr_cEvent(EVENT_BATTLE_SAINFLICT,src,dc_tgt[| _i],id);
				
				for(var _i2 = 0;_i2 < 6;_i2++){
					if(global.tempLst[| _i2] > 0){
						scr_inflictAilment(src,dc_tgt[| _i],_i2,global.tempLst2[| _i2],global.tempLst[| _i2]);
					}
				}
				
				src.enCurr = min(src.enCurr + 30,src.enMax);
				
				var _overkill = (tgtEnemy && dc_tgt[| _i].hpCurr <= 0);
				
				scr_trace(string(_debug++) + ": " + string(_dmg));
				
				dc_tgt[| _i].hpCurr += tgtEnemy ? -_dmg : _dmg;
				dc_tgt[| _i].hpCurr = clamp(dc_tgt[| _i].hpCurr,0,dc_tgt[| _i].hpMax);
				
				scr_trace(string(_debug++) + ": " + string(_dmg));
				
				if(!_overkill && dc_tgt[| _i].hpCurr <= 0){
					scr_cEvent(EVENT_BATTLE_ENEMYKILLED,src,dc_tgt[| _i],id);
				}
				
				if(abort){
					abort = false;
					using = false;
					exit;
				}
				
				var _tgt = eSelf_hit ? src : dc_tgt[| _i];
				
				scr_act_createEffect(effect_hit,eChance_hit,_tgt,rare,stanceAct,special);
				scr_playSfx(se_hit);
				
				if(scr_createSpark(_pX,_pY,spark_hit,ele) != noone && tgtEnemy){
					dc_tgt[| _i].hurtShake = !_chip;
					
					if(dc_tgt[| _i].allyParty == global.grd_party_player && !_chip){
						with obj_handler_dungeon{
							ve_col = ve_tgtCol == c_black ? c_red : c_white;
						}
					}
				}
				
				if(tgtEnemy && src.allyParty == global.grd_party_player){
					var _dh = instance_find(obj_handler_dungeon,0);
					_dh.missionDmg += _dmg;
				}
			}else{
				_p.txt[0] = "miss";
				scr_cEvent(EVENT_BATTLE_MISS,src,dc_tgt[| _i],id);
			}
			
			var _recoil = recoil + ceil((src.ailment[CHAR_SA_BRN] > 0) * _dmg * .5 * _hit);
			
			if(_recoil > 0){
				src.hpCurr += -_recoil;
				src.hpCurr = max(src.hpCurr,1);
				
				_p = scr_createEffectTxt(src,string(_recoil));
			}
		}
		
		if(dc_tgt[| _i].allyParty == global.grd_party_enemy && random(1) < stun_chance && (_hit || !stun_onHit)){
			scr_stunMem(dc_tgt[| _i]);
		}
	}
}

hitLoopRemaining--;
using = false;

if(hitLoopRemaining > 0){
	alarm[0] = hitGap;
	using = true;
}else{
	for(var _i = 0;_i < ds_list_size(dc_tgt);_i++){
		var _tgt = eSelf_end ? src : dc_tgt[| _i];
		
		scr_act_createEffect(effect_end,eChance_end,_tgt,rare,stanceAct,special);
		scr_createSpark(_tgt.x,_tgt.y + -70,spark_end,ele);
		scr_playSfx(se_end);
	}
	
	if(object_index == obj_handler_act_raze_dBlow){
		recoil = 2;
		pwr = 0;
	}
}