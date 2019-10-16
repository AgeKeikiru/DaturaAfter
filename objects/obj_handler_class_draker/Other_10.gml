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
		
	default:
	    event_inherited();
	    break;
}