/// @description custom events

switch(cEvent){
	#region //class_baseStatAdd
		case EVENT_CLASS_BASESTATADD:
		    event_inherited();
		
			if(scr_exists(src,asset_object)){
				src.mDef += ss_level * ss_rate;
				
			    src.hpMax += grd_skills[# 0,0] * grd_skillRate[# 0,0];
			    
			    var
		    	_x = 0,
		    	_y = 1,
		    	_boost = grd_skills[# _x,_y] * grd_skillRate[# _x,_y];
		    	
			    src.ele_fir += _boost;
			    src.ele_ice += _boost;
			    src.ele_drk += _boost;
			    src.ele_lgt += _boost;
			    src.ele_nat += _boost;
			    src.ele_elc += _boost;
			}
			
			break;
	#endregion
		
	#region //class_skillRefresh
		case EVENT_CLASS_SKILLREFRESH:
			event_inherited();
			
			//firm rice
			var
			_ix = 0,
			_iy = 2;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,FOOD_HP);
			ds_list_add(grd_skillAct[# _ix,_iy].special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			//blast pepper
			_ix = 1;
			_iy = 0;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,FOOD_ATK);
			ds_list_add(grd_skillAct[# _ix,_iy].special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			//super flour
			_ix = 1;
			_iy = 1;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,FOOD_WIDE);
			ds_list_add(grd_skillAct[# _ix,_iy].special,stat_specialCd_base + (grd_skills[# _ix,_iy] * stat_specialCd_rate));
			grd_skillAct[# _ix,_iy].cdBase = stat_specialCd_base;
			grd_skillAct[# _ix,_iy].cdRate = -.1;
			scr_cEvent(grd_skillAct[# _ix,_iy],EVENT_ACT_REFRESHINFO);
			
			//winter green
			_ix = 1;
			_iy = 2;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,FOOD_DEF);
			ds_list_add(grd_skillAct[# _ix,_iy].special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			//focuspice
			_ix = 2;
			_iy = 0;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,FOOD_ACC);
			ds_list_add(grd_skillAct[# _ix,_iy].special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			//double gum
			_ix = 2;
			_iy = 1;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,FOOD_MULTI);
			ds_list_add(grd_skillAct[# _ix,_iy].special,stat_specialCd_base + (grd_skills[# _ix,_iy] * stat_specialCd_rate));
			grd_skillAct[# _ix,_iy].cdBase = stat_specialCd_base;
			grd_skillAct[# _ix,_iy].cdRate = -.1;
			scr_cEvent(grd_skillAct[# _ix,_iy],EVENT_ACT_REFRESHINFO);
			
			//citruswift
			_ix = 2;
			_iy = 2;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,FOOD_EVA);
			ds_list_add(grd_skillAct[# _ix,_iy].special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			//brightbroth
			_ix = 3;
			_iy = 0;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,FOOD_SPD);
			ds_list_add(grd_skillAct[# _ix,_iy].special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			//taste test
			_ix = 3;
			_iy = 1;
			
			grd_skillAct[# _ix,_iy].multi = stat_tt_base + (grd_skills[# _ix,_iy] * stat_tt_rate);
			
			//shadestock
			_ix = 3;
			_iy = 2;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,FOOD_EN);
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
				
				#region //tasteTest
					//"Effect: !%"
					if(_x == 3 && _y == 1){
						global.tempStr = _str;
						
						_num[0] = stat_tt_base + (grd_skills[# _x,_y] * stat_tt_rate);
						_num[1] = stat_tt_base + ((grd_skills[# _x,_y] + 1) * stat_tt_rate);
						_substr = scr_class_generateSkillTTStat(_num[0],_num[1],true,!grd_skills[# _x,_y]);
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