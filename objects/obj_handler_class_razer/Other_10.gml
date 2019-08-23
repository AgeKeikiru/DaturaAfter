/// @description custom events

switch(cEvent){
	#region //class_baseStatAdd
		case EVENT_CLASS_BASESTATADD:
		    event_inherited();
		
			if(src != undefined && instance_exists(src)){
				src.hpMax += ss_level * ss_rate;
				
				src.spd += grd_skills[# 0,0] * grd_skillRate[# 0,0];
				
				src.mAtk += grd_skills[# 0,1] * grd_skillRate[# 0,1];
				src.fAtk += grd_skills[# 0,1] * grd_skillRate[# 0,1];
				src.sAtk += grd_skills[# 0,1] * grd_skillRate[# 0,1];
				
				src.mAtk += grd_skills[# 1,1] * grd_skillRate[# 1,1];
			}
			
			break;
	#endregion
	
	#region //battle_atkMod
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
	
	#region //class_skillRefresh
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
				
				#region //kneecap
					//"Effect Chance: !%"
					if(_x == 1 && _y == 0){
						global.tempStr = _str;
						
						_num[0] = stat_kc_base + (grd_skills[# _x,_y] * stat_kc_rate);
						_num[1] = stat_kc_base + ((grd_skills[# _x,_y] + 1) * stat_kc_rate);
						_substr = scr_class_generateSkillTTStat(_num[0],_num[1],true,!grd_skills[# _x,_y]);
						global.tempStr = string_replace_all(global.tempStr,"!",_substr);
					}
				#endregion
				
				#region //sBlow
					//"Power: !"
					if(_x == 1 && _y == 2){
						global.tempStr = _str;
						
						_num[0] = stat_sb_base + (grd_skills[# _x,_y] * stat_sb_rate);
						_num[1] = stat_sb_base + ((grd_skills[# _x,_y] + 1) * stat_sb_rate);
						_substr = scr_class_generateSkillTTStat(_num[0],_num[1],false,!grd_skills[# _x,_y]);
						global.tempStr = string_replace_all(global.tempStr,"!",_substr);
					}
				#endregion
				
				#region //dBlow
					//"Conversion Rate: !%"
					if(_x == 2 && _y == 2){
						global.tempStr = _str;
						
						_num[0] = stat_db_base + (grd_skills[# _x,_y] * stat_db_rate);
						_num[1] = stat_db_base + ((grd_skills[# _x,_y] + 1) * stat_db_rate);
						_substr = scr_class_generateSkillTTStat(_num[0],_num[1],true,!grd_skills[# _x,_y]);
						global.tempStr = string_replace_all(global.tempStr,"!",_substr);
					}
				#endregion
				
				#region //aEdge
					//"Recoil: !"
					if(_x == 3 && _y == 0){
						global.tempStr = _str;
						
						_num[0] = stat_ae_base + (grd_skills[# _x,_y] * stat_ae_rate);
						_num[1] = stat_ae_base + ((grd_skills[# _x,_y] + 1) * stat_ae_rate);
						_substr = scr_class_generateSkillTTStat(_num[0],_num[1],false,!grd_skills[# _x,_y]);
						global.tempStr = string_replace_all(global.tempStr,"!",_substr);
					}
				#endregion
				
				#region //bLust
					//"Drain Rate: !/sec\nMax Boost: @%"
					if(_x == 3 && _y == 1){
						global.tempStr = _str;
						
						_num[0] = stat_bl_base + (grd_skills[# _x,_y] * stat_bl_rate);
						_num[1] = stat_bl_base + ((grd_skills[# _x,_y] + 1) * stat_bl_rate);
						_substr = scr_class_generateSkillTTStat(_num[0],_num[1],false,!grd_skills[# _x,_y],10,"/sec");
						global.tempStr = string_replace_all(global.tempStr,"!",_substr);
						
						_num[0] = grd_skills[# _x,_y] * grd_skillRate[# _x,_y];
						_num[1] = (grd_skills[# _x,_y] + 1) * grd_skillRate[# _x,_y];
						_substr = scr_class_generateSkillTTStat(_num[0],_num[1],true,!grd_skills[# _x,_y],12);
						global.tempStr = string_replace_all(global.tempStr,"@",_substr);
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