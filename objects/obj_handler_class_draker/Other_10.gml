/// @description custom events

switch(cEvent){
	#region //class_baseStatAdd
		case EVENT_CLASS_BASESTATADD:
		    event_inherited();
		
			if(scr_exists(src,asset_object)){
				src.sDef += ss_level * ss_rate;
				
				src.mAtk += grd_skills[# 0,0] * grd_skillRate[# 0,0];
				src.enMax += grd_skills[# 0,1] * grd_skillRate[# 0,1];
				src.sAtk += grd_skills[# 0,2] * grd_skillRate[# 0,2];
			}
			
			break;
	#endregion
	
	#region //class_skillRefresh
		case EVENT_CLASS_SKILLREFRESH:
			event_inherited();
			
			//draco claw
			var
			_ix = 1,
			_iy = 0;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			//draco install
			var
			_ix = 1,
			_iy = 1;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,(stat_di_base + (grd_skills[# _ix,_iy] * stat_di_rate)) * room_speed);
			ds_list_add(grd_skillAct[# _ix,_iy].special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			//draco burst
			var
			_ix = 2,
			_iy = 0,
			_act = grd_skillAct[# _ix,_iy];
			
			_act.pwr = grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy];
			_act.sa_inflict[| CHAR_SA_BLD] = 8;
			_act.sa_chance[| CHAR_SA_BLD] = 0.2;
			
			//draco finish
			var
			_ix = 3,
			_iy = 0,
			_act = grd_skillAct[# _ix,_iy];
			
			ds_list_clear(_act.special);
			ds_list_add(_act.special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			break;
	#endregion
	
	#region //effect_enRecMod
		case EVENT_EFFECT_ENRECMOD:
			event_inherited();
			
			var
			_src = cArgs[| 0],
			_ix = 1,
			_iy = 2;
			
			if((CS_SRCSTANCEIS obj_handler_actEffect_drak_install) && _src == src){
				global.tempFloat += grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy];
			}
			
			break;
	#endregion
	
	#region //effect_hpRecMod
		case EVENT_EFFECT_HPRECMOD:
			event_inherited();
			
			var
			_src = cArgs[| 0],
			_ix = 2,
			_iy = 2;
			
			if((CS_SRCSTANCEIS obj_handler_actEffect_drak_install) && _src == src){
				global.tempFloat += grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy];
			}
			
			break;
	#endregion
	
	#region //battle_enemyDebuffed
		case EVENT_BATTLE_ENEMYDEBUFFED:
			event_inherited();
			
			var
			_src = cArgs[| 0],
			_tgt = cArgs[| 1],
			_ix = 3,
			_iy = 2;
			
			if((CS_SRCSTANCEIS obj_handler_actEffect_drak_install) && _tgt == src){
				global.tempFloat += -grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy];
			}
			
			break;
	#endregion
	
	#region //battle_enemyHit
		case EVENT_BATTLE_ENEMYHIT:
		    event_inherited();
		
			var
			_src = cArgs[| 0],
			_tgt = cArgs[| 1];
			
			if((CS_SRCSTANCEIS obj_handler_actEffect_drak_install) && _src == src){
				with src.stance{
					var _rec = (src.level * 0.001) * durMax;
					
					duration = min(duration + _rec,durMax);
				}
			}
			
			break;
	#endregion
	
	#region //class_fetchToolTip
		case EVENT_CLASS_FETCHTOOLTIP:
			var
			_x = cArgs[| 0],
			_y = cArgs[| 1],
			_str = "",
			_act = noone,
			_substr = "",
			_num = [0,0];
			
			if(_x >= 0){
				_str = grd_skillName[# _x,_y] + " Lv." + string(grd_skills[# _x,_y] + 1) + "\n\n" + grd_skillTooltip[# _x,_y];
				_act = grd_skillAct[# _x,_y];
				
				#region //draco install
					//"Duration: !sec\nAggro: @"
					if(
						(_x == 1 && _y == 1)
					){
						global.tempStr = _str;
						
						_num[0] = stat_di_base + (grd_skills[# _x,_y] * stat_di_rate);
						_num[1] = stat_di_base + ((grd_skills[# _x,_y] + 1) * stat_di_rate);
						_substr = scr_class_generateSkillTTStat(_num[0],_num[1],false,!grd_skills[# _x,_y],10,"sec");
						global.tempStr = string_replace_all(global.tempStr,"!",_substr);
						
						_num[0] = grd_skills[# _x,_y] * grd_skillRate[# _x,_y];
						_num[1] = (grd_skills[# _x,_y] + 1) * grd_skillRate[# _x,_y];
						_substr = scr_class_generateSkillTTStat(_num[0],_num[1],false,!grd_skills[# _x,_y],10);
						global.tempStr = string_replace_all(global.tempStr,"@",_substr);
					}
				#endregion
				
				#region //drake regen
					//"Recovery: !/sec"
					if(
						(_x == 2 && _y == 2)
					){
						global.tempStr = _str;
						
						_num[0] = grd_skills[# _x,_y] * grd_skillRate[# _x,_y];
						_num[1] = (grd_skills[# _x,_y] + 1) * grd_skillRate[# _x,_y];
						_substr = scr_class_generateSkillTTStat(_num[0],_num[1],false,!grd_skills[# _x,_y],0,"sec");
						global.tempStr = string_replace_all(global.tempStr,"!",_substr);
					}
				#endregion
			}
			
			event_inherited();
		
			break;
	#endregion
		
	default:
	    event_inherited();
	    break;
}