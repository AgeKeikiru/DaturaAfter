/// @description Insert description here
// You can write your code in this editor
if(hitLoopRemaining == hitCount){
	for(var _i = 0;_i < ds_list_size(dc_tgt);_i++){
		var _tgt = eSelf_start ? src : dc_tgt[| _i];
		
		scr_act_createEffect(effect_start,eChance_start,_tgt,rare,stanceAct,special);
		scr_createSpark(_tgt.x,_tgt.y + -70,spark_start,ele);
	}
}

if(!nonAttack){
	for(var _i = 0;_i < ds_list_size(dc_tgt);_i++){
		repeat(hitSimul){
			var
			_aimCheck = (random(1) + dc_aim[| _i]) * 100,
			_dmg = irandom_range(dc_dmgMin[| _i],dc_dmgMax[| _i]),
			_p = scr_createEffectTxt(dc_tgt[| _i],""),
			_pX = _p.x,
			_pY = _p.y;
			
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
			
			scr_trace("\naimCheck " + string(_aimCheck) + " > " + string(100 + -acc));
			
			if(
				(
					_aimCheck > 100 + -acc
					|| dc_tgt[| _i].ailment[CHAR_SA_PAR] > 0
					|| dc_tgt[| _i].ailment[CHAR_SA_SLW] > 0
				)
				&& !(src.ailment[CHAR_SA_BLD] > 0 && choose(true,false))
				&& !(src.ailment[CHAR_SA_SLC] > 0 && ele != "")
				&& !(tgtEnemy && dc_tgt[| _i].iFrames > 0)
			){
				_p.visible = pwr > 0;
				_p.y += -100;
				
				_p.txt[0] = string(_dmg);
				_p.txt_col[0] = tgtEnemy ? c_white : CC_HEALGREEN;
				
				if(pwr > 0){
					scr_cEvent(all,tgtEnemy ? EVENT_BATTLE_ENEMYHIT : EVENT_BATTLE_HEALED,src,dc_tgt[| _i],id,_dmg);
				}
				
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
				
				scr_cEvent(all,EVENT_BATTLE_SAINFLICT,src,dc_tgt[| _i],id);
				
				for(var _i2 = 0;_i2 < 6;_i2++){
					if(global.tempLst[| _i2] > 0){
						scr_inflictAilment(src,dc_tgt[| _i],_i2,global.tempLst2[| _i2],global.tempLst[| _i2]);
					}
				}
				
				src.enCurr = min(src.enCurr + 30,src.enMax);
				
				var _overkill = (tgtEnemy && dc_tgt[| _i].hpCurr <= 0);
				
				dc_tgt[| _i].hpCurr += tgtEnemy ? -_dmg : _dmg;
				dc_tgt[| _i].hpCurr = clamp(dc_tgt[| _i].hpCurr,0,dc_tgt[| _i].hpMax);
				
				if(!_overkill && dc_tgt[| _i].hpCurr <= 0){
					scr_cEvent(all,EVENT_BATTLE_ENEMYKILLED,src,dc_tgt[| _i]);
				}
				
				var _tgt = eSelf_hit ? src : dc_tgt[| _i];
				
				scr_act_createEffect(effect_hit,eChance_hit,_tgt,rare,stanceAct,special);
				
				if(scr_createSpark(_pX,_pY,spark_hit,ele) != noone){
					dc_tgt[| _i].hurtShake = tgtEnemy;
				}
				
				if(tgtEnemy && src.allyParty == global.grd_party_player){
					var _dh = instance_find(obj_handler_dungeon,0);
					_dh.missionDmg += _dmg;
				}
			}else{
				_p.txt[0] = "miss";
				scr_cEvent(all,EVENT_BATTLE_MISS,src,dc_tgt[| _i],id);
			}
			
			if(recoil > 0){
				src.hpCurr += -recoil;
				src.hpCurr = max(src.hpCurr,1);
				
				_p = scr_createEffectTxt(src,"");
				_p.txt[0] = string(recoil);
			}
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
	}
	
	if(object_index == obj_handler_act_raze_dBlow){
		recoil = 2;
		pwr = 0;
	}
}