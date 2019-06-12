/// @description custom events

switch(cEvent){
	#region //class_baseStatAdd
		case EVENT_CLASS_BASESTATADD:
		    event_inherited();
		
			if(scr_exists(src,asset_object)){
			    src.ele_lgt += grd_skills[# 0,0] * grd_skillRate[# 0,0];
			    src.mDef += grd_skills[# 0,1] * grd_skillRate[# 0,1];
			    src.fDef += grd_skills[# 0,1] * grd_skillRate[# 0,1];
			    src.sDef += grd_skills[# 0,1] * grd_skillRate[# 0,1];
			}
			
			break;
	#endregion
	
	#region //ange_angeliteGainMod
		case EVENT_ANGE_ANGELITEGAINMOD:
			var
			_src = cArgs[| 0],
			_tri = cArgs[| 1],
			_lgt = cArgs[| 2];
			
			if(scr_exists(src,asset_object) && _src == src){
				if(_tri){
					var
					_x = 2,
					_y = 1;
					
					global.tempFloat += grd_skills[# _x,_y] * grd_skillRate[# _x,_y];
					scr_trace("[" + grd_skillName[# _x,_y] + "] angelite gain boost: " + string((grd_skills[# _x,_y] * grd_skillRate[# _x,_y]) * 100) + "%");
				}
				
				if(_lgt){
					var
					_x = 3,
					_y = 1;
					
					global.tempFloat += grd_skills[# _x,_y] * grd_skillRate[# _x,_y];
					scr_trace("[" + grd_skillName[# _x,_y] + "] angelite gain boost: " + string((grd_skills[# _x,_y] * grd_skillRate[# _x,_y]) * 100) + "%");
				}
			}
			
			break;
	#endregion
	
	#region //battle_atkMod
		case EVENT_BATTLE_ATKMOD:
			var
			_src = cArgs[| 0],
			_tgt = cArgs[| 1],
			_act = cArgs[| 2];
			
			if(scr_exists(src,asset_object) && _src == src){
				//light love
				if(_act.ele == CHAR_VAR_ELE_LGT){
					var
					_x = 0,
					_y = 2,
					_boost = grd_skills[# _x,_y] * grd_skillRate[# _x,_y];
					
					scr_trace("[" + grd_skillName[# _x,_y] + "] atk boost: +" + string(_boost * 100) + "%");
					
					global.tempFloat += _boost;
				}
			}
		
			break;
	#endregion
	
	#region //battle_saInflict
		case EVENT_BATTLE_SAINFLICT:
			var
			_src = cArgs[| 0],
			_tgt = cArgs[| 1],
			_act = cArgs[| 2];
		
			if(scr_exists(src,asset_object) && _src == src && _act.tgtEnemy){
				global.tempLst[| CHAR_SA_BLD] = 3;
				global.tempLst2[| CHAR_SA_BLD] = src.level * .005;
				
				scr_trace("[Blinding Light] blind chance: " + string(global.tempLst2[| CHAR_SA_BLD] * 100) + "%");
			}
			
			break;
	#endregion
	
	#region
		case EVENT_CLASS_SKILLREFRESH:
			event_inherited();
			
			//angelic step
			var
			_ix = 1,
			_iy = 0;
			
			grd_skillAct[# _ix,_iy].cdAdd = stat_t2_base + (grd_skills[# _ix,_iy] * stat_t2_rate);
			
			//angelite
			_ix = 1;
			_iy = 1;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			//angelic dash
			_ix = 1;
			_iy = 2;
			
			grd_skillAct[# _ix,_iy].cdAdd = grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy];
			
			//angelic blessing
			_ix = 2;
			_iy = 0;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy] * room_speed);
			
			//angelic smite
			_ix = 2;
			_iy = 2;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy] * room_speed);
			
			//desynch
			_ix = 3;
			_iy = 0;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,(stat_desynch_base + (grd_skills[# _ix,_iy] * stat_desynch_rate)) / room_speed);
			
			//heaven's rend
			_ix = 3;
			_iy = 2;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			break;
	#endregion
		
	default:
	    event_inherited();
	    break;
}