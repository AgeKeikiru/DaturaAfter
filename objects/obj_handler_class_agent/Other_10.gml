/// @description custom events

switch(cEvent){
	#region //class_baseStatAdd
		case EVENT_CLASS_BASESTATADD:
		    event_inherited();
		
			if(scr_exists(src,asset_object)){
			    src.ele_fir += ss_level * ss_rate;
			    
			    src.fAtk += grd_skills[# 0,0] * grd_skillRate[# 0,0];
			    src.acc += grd_skills[# 0,1] * grd_skillRate[# 0,1];
			    src.fDef += grd_skills[# 0,2] * grd_skillRate[# 0,2];
			}
			
			break;
	#endregion
	
	#region //class_skillRefresh
		case EVENT_CLASS_SKILLREFRESH:
			event_inherited();
			
			//flash grenade
			var
			_ix = 1,
			_iy = 0,
			_act = grd_skillAct[# _ix,_iy];
			
			_act.pwr = grd_skills[# _ix,_iy] * stat_bombPwr_rate;
			_act.sa_inflict[| CHAR_SA_BLD] = 8;
			_act.sa_chance[| CHAR_SA_BLD] = grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy];
			
			//hide
			var
			_ix = 1,
			_iy = 1,
			_act = grd_skillAct[# _ix,_iy];
			
			ds_list_clear(_act.special);
			ds_list_add(_act.special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			//snare trap
			var
			_ix = 1,
			_iy = 2,
			_act = grd_skillAct[# _ix,_iy];
			
			ds_list_clear(_act.special);
			ds_list_add(_act.special,_act);
			ds_list_add(_act.special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			//nova bomb
			var
			_ix = 2,
			_iy = 0,
			_act = grd_skillAct[# _ix,_iy];
			
			_act.pwr = grd_skills[# _ix,_iy] * stat_bombPwr_rate;
			_act.sa_inflict[| CHAR_SA_PSN] = 8;
			_act.sa_chance[| CHAR_SA_PSN] = grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy];
			
			//analyze
			var
			_ix = 2,
			_iy = 1,
			_act = grd_skillAct[# _ix,_iy];
			
			ds_list_clear(_act.special);
			ds_list_add(_act.special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			//blast trap
			var
			_ix = 2,
			_iy = 2,
			_act = grd_skillAct[# _ix,_iy];
			
			ds_list_clear(_act.special);
			ds_list_add(_act.special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			//weak mark
			var
			_ix = 3,
			_iy = 1,
			_act = grd_skillAct[# _ix,_iy];
			
			ds_list_clear(_act.special);
			ds_list_add(_act.special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			ds_list_add(_act.special,_act.special[| 0] * wm_fMod);
			
			//capture
			var
			_ix = 3,
			_iy = 2,
			_act = grd_skillAct[# _ix,_iy];
			
			_act.acc = (stat_cap_base + (grd_skills[# _ix,_iy] * stat_cap_rate)) * 100;
			
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
				
				#region //flash grenade, nova bomb
					//"Power: !\nBlind Chance: @%"
					if(
						(_x == 1 && _y == 0) ||
						(_x == 2 && _y == 0)
					){
						global.tempStr = _str;
						
						_num[0] = grd_skills[# _x,_y] * stat_bombPwr_rate;
						_num[1] = (grd_skills[# _x,_y] + 1) * stat_bombPwr_rate;
						_substr = scr_class_generateSkillTTStat(_num[0],_num[1],false,!grd_skills[# _x,_y],8);
						global.tempStr = string_replace_all(global.tempStr,"!",_substr);
						
						_num[0] = grd_skills[# _x,_y] * grd_skillRate[# _x,_y];
						_num[1] = (grd_skills[# _x,_y] + 1) * grd_skillRate[# _x,_y];
						_substr = scr_class_generateSkillTTStat(_num[0],_num[1],true,!grd_skills[# _x,_y],8);
						global.tempStr = string_replace_all(global.tempStr,"@",_substr);
					}
				#endregion
				
				#region //snare strap, analyze
					//"Duration: !sec"
					if(
						(_x == 1 && _y == 2) ||
						(_x == 2 && _y == 1)
					){
						global.tempStr = _str;
						
						_num[0] = grd_skills[# _x,_y] * grd_skillRate[# _x,_y];
						_num[1] = (grd_skills[# _x,_y] + 1) * grd_skillRate[# _x,_y];
						_substr = scr_class_generateSkillTTStat(_num[0],_num[1],false,!grd_skills[# _x,_y],8,"sec");
						global.tempStr = string_replace_all(global.tempStr,"!",_substr);
					}
				#endregion
				
				#region //blast strap
					//"Burn Chance: !%"
					if(_x == 2 && _y == 2){
						global.tempStr = _str;
						
						_num[0] = grd_skills[# _x,_y] * grd_skillRate[# _x,_y];
						_num[1] = (grd_skills[# _x,_y] + 1) * grd_skillRate[# _x,_y];
						_substr = scr_class_generateSkillTTStat(_num[0],_num[1],true,!grd_skills[# _x,_y],8);
						global.tempStr = string_replace_all(global.tempStr,"!",_substr);
					}
				#endregion
				
				#region //weak mark
					//"F-DEF: !%\nM/S-DEF: @%"
					if(_x == 3 && _y == 1){
						global.tempStr = _str;
						
						_num[0] = grd_skills[# _x,_y] * grd_skillRate[# _x,_y];
						_num[1] = (grd_skills[# _x,_y] + 1) * grd_skillRate[# _x,_y];
						_substr = scr_class_generateSkillTTStat(_num[0] * wm_fMod,_num[1] * wm_fMod,true,!grd_skills[# _x,_y],8);
						global.tempStr = string_replace_all(global.tempStr,"!",_substr);
						
						_num[0] = grd_skills[# _x,_y] * grd_skillRate[# _x,_y];
						_num[1] = (grd_skills[# _x,_y] + 1) * grd_skillRate[# _x,_y];
						_substr = scr_class_generateSkillTTStat(_num[0],_num[1],true,!grd_skills[# _x,_y],8);
						global.tempStr = string_replace_all(global.tempStr,"@",_substr);
					}
				#endregion
				
				#region //capture
					//"Accuracy: !%"
					if(_x == 3 && _y == 2){
						global.tempStr = _str;
						
						_num[0] = stat_cap_base + (grd_skills[# _x,_y] * stat_cap_rate);
						_num[1] = stat_cap_base + ((grd_skills[# _x,_y] + 1) * stat_cap_rate);
						_substr = scr_class_generateSkillTTStat(_num[0],_num[1],true,!grd_skills[# _x,_y],8);
						global.tempStr = string_replace_all(global.tempStr,"!",_substr);
					}
				#endregion
			}
			
			event_inherited();
		
			break;
	#endregion
	
	#region //battle_critMod
		case EVENT_BATTLE_CRITMOD:
			var
			_src = cArgs[| 0],
			_tgt = cArgs[| 1],
			_act = cArgs[| 2];
			
			if(CS_SRCMAINCHECK && _src == src){
				//marksman
				var _boost = .005 * src.level;
				
				global.critBonus += _boost;
				
				scr_trace("[" + ms_name + "] crit dmg boost: +" + string(_boost * 100) + "%");
			}
		
			break;
	#endregion
	
	#region //agnt_fsCheck
		case EVENT_AGNT_FSCHECK:
			var
			_src = cArgs[| 0],
			_act = cArgs[| 1],
			_x = 3,
			_y = 0,
			_proc = grd_skills[# _x,_y] * grd_skillRate[# _x,_y];
			
			if(CS_SRCSTANCEIS obj_handler_actEffect_agnt_hide && _src != src && _src.allyParty == src.allyParty && _act.tgtEnemy && random(1) < _proc && fsCooldown <= 0){
				//fire support
				var _lst = ds_list_create();
				
				for(var _i = 0;_i < 8;_i++){
					var _o = src.act[_i];
					
					if(scr_exists(_o,asset_object) && _o.atkScale == CHAR_VAR_FATK && _o.object_index == obj_handler_act){
						ds_list_add(_lst,_o);
					}
				}
				
				if(!ds_list_empty(_lst)){
					ds_list_shuffle(_lst);
					
					with _lst[| 0]{
						scr_cEvent_id(id,EVENT_ACT_USE);
					}
					
					fsCooldown = 3 * room_speed;
				}
			}
		
			break;
	#endregion
		
	default:
	    event_inherited();
	    break;
}