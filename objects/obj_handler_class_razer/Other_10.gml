/// @description custom events

switch(cEvent){
	#region //class_baseStatAdd
		case EVENT_CLASS_BASESTATADD:
		    event_inherited();
		
			if(src != undefined && instance_exists(src)){
				src.spd += grd_skills[# 0,0] * grd_skillRate[# 0,0];
				
				src.mAtk += grd_skills[# 0,1] * grd_skillRate[# 0,1];
				src.fAtk += grd_skills[# 0,1] * grd_skillRate[# 0,1];
				src.sAtk += grd_skills[# 0,1] * grd_skillRate[# 0,1];
				
				src.mAtk += grd_skills[# 1,1] * grd_skillRate[# 1,1];
			}
			
			break;
	#endregion
	
	#region //
		case EVENT_BATTLE_ATKMOD:
			var
			_src = cArgs[| 0],
			_tgt = cArgs[| 1],
			_act = cArgs[| 2];
			
			if(scr_exists(src,asset_object) && _src == src && _act.tgtEnemy){
				if(_act.ele != ""){
					var
					_x = 0,
					_y = 2,
					_boost = grd_skills[# _x,_y] * grd_skillRate[# _x,_y];
					
					global.tempFloat += _boost;
					
					scr_trace("[" + grd_skillName[# _x,_y] + "] dmg boost: " + string(_boost * 100) + "%");
				}
				
				if(src.src[? CHAR_VAR_CLS0] == id && (src.hpCurr / src.hpMax) < .3 + (src.level * .005)){
					var _boost = .2;
					
					global.tempFloat += _boost;
					
					scr_trace("[Vengeance] dmg boost: " + string(_boost * 100) + "%");
				}
			}
			
			break;
	#endregion
	
	#region
		case EVENT_CLASS_SKILLREFRESH:
			event_inherited();
			
			//kneecap
			var
			_ix = 1,
			_iy = 0;
			
			grd_skillAct[# _ix,_iy].eChance_hit = stat_kc_base + (grd_skills[# _ix,_iy] * stat_kc_rate);
			
			//stressor blow
			_ix = 1;
			_iy = 2;
			
			grd_skillAct[# _ix,_iy].pwr = stat_sb_base + (grd_skills[# _ix,_iy] * stat_sb_rate);
			
			//reaper edge
			_ix = 2;
			_iy = 0;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			//adapt dodge
			_ix = 2;
			_iy = 1;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			//dire blow
			_ix = 2;
			_iy = 2;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,stat_db_base + (grd_skills[# _ix,_iy] * stat_db_rate));
			
			//accelerator edge
			_ix = 3;
			_iy = 0;
			
			grd_skillAct[# _ix,_iy].recoil = stat_ae_base + (grd_skills[# _ix,_iy] * stat_ae_rate);
			
			//bloodlust
			_ix = 3;
			_iy = 1;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,stat_bl_base + (grd_skills[# _ix,_iy] * stat_bl_rate));
			ds_list_add(grd_skillAct[# _ix,_iy].special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			//recompense cross
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