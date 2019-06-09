/// @description Insert description here
// You can write your code in this editor

if(effect_start != noone && hitLoopRemaining == hitCount){
	var
	_tgt = eSelf_start ? src : dc_tgt,
	_eff = scr_act_createEffect(effect_start,_tgt,rare,stanceAct,special);
}

if(!nonAttack){
	repeat(hitSimul){
		var
		_aimCheck = (random(1) + dc_aim) * 100,
		_dmg = irandom_range(dc_dmgMin,dc_dmgMax),
		_pX = dc_tgt.x + random_range(-60,60),
		_pY = dc_tgt.y + -70 + random_range(-30,30),
		_p = scr_createEffectTxt(_pX,_pY,"");
		
		scr_trace("\naimCheck " + string(_aimCheck) + " > " + string(100 + -acc));
		
		if(
			(
				_aimCheck > 100 + -acc
				|| dc_tgt.ailment[CHAR_SA_PAR] > 0
				|| dc_tgt.ailment[CHAR_SA_SLW] > 0
			)
			&& !(src.ailment[CHAR_SA_BLD] > 0 && choose(true,false))
			&& !(src.ailment[CHAR_SA_SLC] > 0 && ele != "")
			&& !(tgtEnemy && dc_tgt.iFrames > 0)
		){
			_p.visible = pwr > 0;
			_p.y += -100;
			
			_p.txt[0] = string(_dmg);
			_p.txt_col[0] = tgtEnemy ? c_white : CC_HEALGREEN;
			
			if(pwr > 0){
				scr_cEvent(all,tgtEnemy ? EVENT_BATTLE_ENEMYHIT : EVENT_BATTLE_HEALED,src,dc_tgt,id);
			}
			
			src.enCurr = min(src.enCurr + 30,src.enMax);
			
			var _overkill = (tgtEnemy && dc_tgt.hpCurr <= 0);
			
			dc_tgt.hpCurr += tgtEnemy ? -_dmg : _dmg;
			dc_tgt.hpCurr = clamp(dc_tgt.hpCurr,0,dc_tgt.hpMax);
			
			if(!_overkill && dc_tgt.hpCurr <= 0){
				scr_cEvent(all,EVENT_BATTLE_ENEMYKILLED,src,dc_tgt);
			}
			
			if(sprite_exists(spark_hit)){
				_p = instance_create_depth(_pX,_pY,-999,obj_fpo_parent);
				_p.sprite_index = spark_hit;
				_p.image_angle = random(360);
				_p.alarm[0] = sprite_get_number(_p.sprite_index);
				
				dc_tgt.hurtShake = tgtEnemy;
				
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
		}
	}
}

hitLoopRemaining--;
using = false;

if(hitLoopRemaining > 0){
	alarm[0] = hitGap;
	using = true;
}