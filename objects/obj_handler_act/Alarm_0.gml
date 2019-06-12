/// @description Insert description here
// You can write your code in this editor
if(effect_start != noone && hitLoopRemaining == hitCount){
	for(var _i = 0;_i < ds_list_size(dc_tgt);_i++){
		var
		_tgt = eSelf_start ? src : dc_tgt[| _i],
		_eff = scr_act_createEffect(effect_start,_tgt,rare,stanceAct,special);
	}
}

if(!nonAttack){
	for(var _i = 0;_i < ds_list_size(dc_tgt);_i++){
		repeat(hitSimul){
			var
			_aimCheck = (random(1) + dc_aim[| _i]) * 100,
			_dmg = irandom_range(dc_dmgMin[| _i],dc_dmgMax[| _i]),
			_pX = dc_tgt[| _i].x + random_range(-60,60),
			_pY = dc_tgt[| _i].y + -70 + random_range(-30,30),
			_p = scr_createEffectTxt(_pX,_pY,"");
			
			//special act behaviors
			switch(object_index){
				case obj_handler_act_ange_hRend:
					_dmg = round(min(dc_tgt[| _i].hpCurr / 2,special[| 0]));
				
					scr_trace("special case [Heaven's Rend]: dmg = half remaining hp");
					
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
					scr_cEvent(all,tgtEnemy ? EVENT_BATTLE_ENEMYHIT : EVENT_BATTLE_HEALED,src,dc_tgt[| _i],id);
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
				
				if(sprite_exists(spark_hit)){
					_p = instance_create_depth(_pX,_pY,-999,obj_fpo_parent);
					_p.sprite_index = spark_hit;
					_p.image_angle = random(360);
					_p.alarm[0] = sprite_get_number(_p.sprite_index);
					
					dc_tgt[| _i].hurtShake = tgtEnemy;
					
					switch(spark_hit){
						default:
							var _a = random_range(0,360);
						
							repeat(irandom_range(6,12)){
								_p = instance_create_depth(_pX + lengthdir_x(random_range(5,40),_a),_pY + lengthdir_y(random_range(5,40),_a),-999,obj_fpo_parent);
								_p.sprite_index = spr_spark_dot;
								_p.image_angle = _a;
								_p.image_xscale = random_range(.5,2);
								_p.image_yscale = _p.image_xscale;
								_p.alarm[1] = sprite_get_number(_p.sprite_index) + random_range(5,30);
								_p.alarm[0] = _p.alarm[1] + 10;
								
								_a += random_range(60,120);
							}
							
							break;
					}
				}
				
				if(tgtEnemy && src.allyParty == global.grd_party_player){
					var _dh = instance_find(obj_handler_dungeon,0);
					_dh.missionDmg += _dmg;
				}
			}else{
				_p.txt[0] = "miss";
				scr_cEvent(all,EVENT_BATTLE_MISS,src,dc_tgt[| _i],id);
			}
		}
	}
}

hitLoopRemaining--;
using = false;

if(hitLoopRemaining > 0){
	alarm[0] = hitGap;
	using = true;
}