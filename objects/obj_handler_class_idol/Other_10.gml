/// @description custom events

switch(cEvent){
	#region //class_baseStatAdd
		case EVENT_CLASS_BASESTATADD:
		    event_inherited();
		
			if(scr_exists(src,asset_object)){
			    src.eva += grd_skills[# 0,0] * grd_skillRate[# 0,0];
			    src.misc += grd_skills[# 0,2] * grd_skillRate[# 0,2];
			}
			
			break;
	#endregion
		
	#region //class_skillRefresh
		case EVENT_CLASS_SKILLREFRESH:
			event_inherited();
			
			//hype meter
			var
			_ix = 0,
			_iy = 1;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			//hyper pickup
			_ix = 1;
			_iy = 0;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,stat_pup_base + (grd_skills[# _ix,_iy] * stat_pup_rate));
			
			//hype boost teamwork (affects hype meter)
			_ix = 1;
			_iy = 1;
			
			ds_list_add(grd_skillAct[# 0,1].special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			//hyper peptalk
			_ix = 1;
			_iy = 2;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,0);
			ds_list_add(grd_skillAct[# _ix,_iy].special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			//hyper cheer
			_ix = 2;
			_iy = 0;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,0);
			ds_list_add(grd_skillAct[# _ix,_iy].special,stat_cheer_base + (grd_skills[# _ix,_iy] * stat_cheer_rate));
			
			//hype boost adrenaline (affects hype meter)
			_ix = 2;
			_iy = 1;
			
			ds_list_add(grd_skillAct[# 0,1].special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			//hyper one more
			_ix = 2;
			_iy = 2;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,0);
			grd_skillAct[# _ix,_iy].pwr = grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy];
			
			//live defamation
			_ix = 3;
			_iy = 0;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			//grand finale (affects hype meter)
			_ix = 3;
			_iy = 1;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,grd_skillAct[# _ix,_iy].id);
			
			ds_list_add(grd_skillAct[# 0,1].special,stat_gf_base + (grd_skills[# _ix,_iy] * stat_gf_rate));
			
			//taunting strike
			_ix = 3;
			_iy = 2;
			
			grd_skillAct[# _ix,_iy].acc = stat_ts_base + (grd_skills[# _ix,_iy] * stat_ts_rate);
			
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
				
				#region //hPup
					//"Duration: !sec"
					if(_x == 1 && _y == 0){
						global.tempStr = _str;
						
						_num[0] = stat_pup_base + (grd_skills[# _x,_y] * stat_pup_rate);
						_num[1] = stat_pup_base + ((grd_skills[# _x,_y] + 1) * stat_pup_rate);
						_substr = scr_class_generateSkillTTStat(_num[0],_num[1],false,!grd_skills[# _x,_y],0,"sec");
						global.tempStr = string_replace_all(global.tempStr,"!",_substr);
					}
				#endregion
				
				#region //hCheer
					//"Duration: !sec"
					if(_x == 2 && _y == 0){
						global.tempStr = _str;
						
						_num[0] = stat_cheer_base + (grd_skills[# _x,_y] * stat_cheer_rate);
						_num[1] = stat_cheer_base + ((grd_skills[# _x,_y] + 1) * stat_cheer_rate);
						_substr = scr_class_generateSkillTTStat(_num[0],_num[1],false,!grd_skills[# _x,_y],0,"sec");
						global.tempStr = string_replace_all(global.tempStr,"!",_substr);
					}
				#endregion
				
				#region //hgf
					//"Drain Rate: !/sec"
					if(_x == 3 && _y == 1){
						global.tempStr = _str;
						
						_num[0] = stat_gf_base + (grd_skills[# _x,_y] * stat_gf_rate);
						_num[1] = stat_gf_base + ((grd_skills[# _x,_y] + 1) * stat_gf_rate);
						_substr = scr_class_generateSkillTTStat(_num[0],_num[1],false,!grd_skills[# _x,_y],0,"/sec");
						global.tempStr = string_replace_all(global.tempStr,"!",_substr);
					}
				#endregion
				
				#region //tStrike
					//"Accuracy: !"
					if(_x == 3 && _y == 2){
						global.tempStr = _str;
						
						_num[0] = stat_ts_base + (grd_skills[# _x,_y] * stat_ts_rate);
						_num[1] = stat_ts_base + ((grd_skills[# _x,_y] + 1) * stat_ts_rate);
						_substr = scr_class_generateSkillTTStat(_num[0],_num[1],false,!grd_skills[# _x,_y]);
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