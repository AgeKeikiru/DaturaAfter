/// @description custom events

switch(cEvent){
	#region //class_baseStatAdd
		case EVENT_CLASS_BASESTATADD:
		    event_inherited();
		
			if(scr_exists(src,asset_object)){
				src.hpMax += ss_level * ss_rate;
				
			    src.mDef += grd_skills[# 0,0] * grd_skillRate[# 0,0];
			    
			    src.mDef += grd_skills[# 0,1] * grd_skillRate[# 0,1];
			    src.fDef += grd_skills[# 0,1] * grd_skillRate[# 0,1];
			    src.sDef += grd_skills[# 0,1] * grd_skillRate[# 0,1];
			    
			    src.ele_fir += grd_skills[# 0,2] * grd_skillRate[# 0,2];
			    src.ele_ice += grd_skills[# 0,2] * grd_skillRate[# 0,2];
			    src.ele_lgt += grd_skills[# 0,2] * grd_skillRate[# 0,2];
			    src.ele_drk += grd_skills[# 0,2] * grd_skillRate[# 0,2];
			    src.ele_elc += grd_skills[# 0,2] * grd_skillRate[# 0,2];
			    src.ele_nat += grd_skills[# 0,2] * grd_skillRate[# 0,2];
			}
			
			break;
	#endregion
	
	#region //class_skillRefresh
		case EVENT_CLASS_SKILLREFRESH:
			event_inherited();
			
			//bulwark
			var
			_ix = 1,
			_iy = 1,
			_act = grd_skillAct[# _ix,_iy];
			
			ds_list_clear(_act.special);
			ds_list_add(_act.special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			ds_list_add(_act.special,grd_skills[# _ix,_iy] * stat_bwDef);
			ds_list_add(_act.special,stat_bwAtk_base + (grd_skills[# _ix,_iy] * stat_bwAtk_rate));
			
			//veil off
			var
			_ix = 2,
			_iy = 2,
			_act = grd_skillAct[# _ix,_iy];
			
			ds_list_clear(_act.special);
			ds_list_add(_act.special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			//ngtM
			var
			_ix = 3,
			_iy = 0,
			_act = grd_skillAct[# _ix,_iy];
			
			ds_list_clear(_act.special);
			ds_list_add(_act.special,CHAR_VAR_MDEF);
			ds_list_add(_act.special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			//ngtF
			var
			_ix = 3,
			_iy = 1,
			_act = grd_skillAct[# _ix,_iy];
			
			ds_list_clear(_act.special);
			ds_list_add(_act.special,CHAR_VAR_FDEF);
			ds_list_add(_act.special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			//ngtS
			var
			_ix = 3,
			_iy = 2,
			_act = grd_skillAct[# _ix,_iy];
			
			ds_list_clear(_act.special);
			ds_list_add(_act.special,CHAR_VAR_SDEF);
			ds_list_add(_act.special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
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
				
				#region //bulwark
					//"Aggro: !\nM/F/S-DEF: @%\nM/F/S-ATK: #%"
					if(_x == 1 && _y == 1){
						global.tempStr = _str;
						
						_num[0] = grd_skills[# _x,_y] * grd_skillRate[# _x,_y];
						_num[1] = (grd_skills[# _x,_y] + 1) * grd_skillRate[# _x,_y];
						_substr = scr_class_generateSkillTTStat(_num[0],_num[1],false,!grd_skills[# _x,_y],8);
						global.tempStr = string_replace_all(global.tempStr,"!",_substr);
						
						_num[0] = grd_skills[# _x,_y] * stat_bwDef;
						_num[1] = (grd_skills[# _x,_y] + 1) * stat_bwDef;
						_substr = scr_class_generateSkillTTStat(_num[0],_num[1],true,!grd_skills[# _x,_y],8);
						global.tempStr = string_replace_all(global.tempStr,"@",_substr);
						
						_num[0] = stat_bwAtk_base + (grd_skills[# _x,_y] * stat_bwAtk_rate);
						_num[1] = stat_bwAtk_base + ((grd_skills[# _x,_y] + 1) * stat_bwAtk_rate);
						_substr = scr_class_generateSkillTTStat(_num[0],_num[1],true,!grd_skills[# _x,_y],8);
						global.tempStr = string_replace_all(global.tempStr,"#",_substr);
					}
				#endregion
				
				#region //ngt
					//"Duration: !sec"
					if(_x == 3){
						global.tempStr = _str;
						
						_num[0] = grd_skills[# _x,_y] * grd_skillRate[# _x,_y];
						_num[1] = (grd_skills[# _x,_y] + 1) * grd_skillRate[# _x,_y];
						_substr = scr_class_generateSkillTTStat(_num[0],_num[1],false,!grd_skills[# _x,_y],8,"sec");
						global.tempStr = string_replace_all(global.tempStr,"!",_substr);
					}
				#endregion
			}
			
			event_inherited();
		
			break;
	#endregion
	
	#region //battle_enemyHit
		case EVENT_BATTLE_ENEMYHIT:
			var
			_src = cArgs[| 0],
			_tgt = cArgs[| 1],
			_act = cArgs[| 2];
			
			if(CS_SRCSTANCEIS obj_handler_actEffect_snct_bulwark && _tgt == src && _act.tgtEnemy){
				var
				_x = 1,
				_y = 0,
				_boost = grd_skills[# _x,_y] * grd_skillRate[# _x,_y] * 100;
				
				for(var _i = 0;_i < 8;_i++){
					var _o = src.act[_i];
					
					if(scr_exists(_o,asset_object)){
						_o.cdCurr = max(_o.cdCurr + -_boost,0);
					}
				}
			}
			
			event_inherited();
			
			break;
	#endregion
	
	#region //battle_enemyDebuffed
		case EVENT_BATTLE_ENEMYDEBUFFED:
			var
			_src = cArgs[| 0],
			_tgt = cArgs[| 1],
			_act = cArgs[| 2];
			
			if(CS_SRCSTANCEIS obj_handler_actEffect_snct_bulwark && _tgt == src){
				global.tempFloat += grd_skills[# _x,_y] * grd_skillRate[# _x,_y];
			}
			
			event_inherited();
			
			break;
	#endregion
	
	#region //snct_saveCheck
		case EVENT_SNCT_SAVECHECK:
			var
			_dmg = cArgs[| 0],
			_act = cArgs[| 1],
			_x = 2,
			_y = 1,
			_proc = !DEBUG ? (grd_skills[# _x,_y] * grd_skillRate[# _x,_y]) : 1;
			
			if(CS_SRCSTANCEIS obj_handler_actEffect_snct_bulwark && global.tempInt != src && _act.tgtEnemy && _dmg >= global.tempInt.hpCurr && random(1) < _proc){
				scr_createEffectTxt(global.tempInt,"PROTECT");
				
				global.tempInt = src;
			}
			
			event_inherited();
			
			break;
	#endregion
		
	default:
	    event_inherited();
	    break;
}