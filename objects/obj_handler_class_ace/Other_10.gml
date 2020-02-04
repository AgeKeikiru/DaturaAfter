/// @description custom events

switch(cEvent){
	#region //class_baseStatAdd
    	case EVENT_CLASS_BASESTATADD:
    	    event_inherited();
    	
    		if(scr_exists(src)){
    		    src.enMax += ss_level * ss_rate;
    		    
    		    src.mAtk += grd_skills[# ACE_SK_MATK] * grd_skillRate[# ACE_SK_MATK];
    		    src.fAtk += grd_skills[# ACE_SK_FATK] * grd_skillRate[# ACE_SK_FATK];
    		    src.sAtk += grd_skills[# ACE_SK_SATK] * grd_skillRate[# ACE_SK_SATK];
    		}
    		
    		break;
	#endregion
		
	#region //class_skillRefresh
		case EVENT_CLASS_SKILLREFRESH:
			event_inherited();
			
			var _act = grd_skillAct[# ACE_SK_CFINISH];
			_act.pwr = grd_skills[# ACE_SK_CFINISH] * grd_skillRate[# ACE_SK_CFINISH];
			ds_list_clear(_act.special);
			ds_list_add(_act.special,en_charVar.mAtk);
			
			var _act = grd_skillAct[# ACE_SK_LOCK];
			ds_list_clear(_act.special);
			ds_list_add(_act.special,en_charVar.fAtk);
			
			var _act = grd_skillAct[# ACE_SK_DTOUCH];
			ds_list_clear(_act.special);
			ds_list_add(_act.special,en_charVar.sAtk);
			ds_list_add(_act.special,grd_skills[# ACE_SK_DTOUCH] * grd_skillRate[# ACE_SK_DTOUCH]);
			
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
				
				switch grd_skillName[# _x,_y]{
    				#region //hair trigger
    					//"PWR/ACC: !%"
    					case grd_skillName[# ACE_SK_HTRIG]:
    						global.tempStr = _str;
    						
    						_num[0] = stat_ht_base + (grd_skills[# _x,_y] * stat_ht_rate);
    						_num[1] = stat_ht_base + ((grd_skills[# _x,_y] + 1) * stat_ht_rate);
    						_substr = scr_class_generateSkillTTStat(_num[0],_num[1],true,!grd_skills[# _x,_y]);
    						global.tempStr = string_replace_all(global.tempStr,"!",_substr);
    					    
    					    break;
    				#endregion
				}
			}
			
			event_inherited();
		
			break;
	#endregion
		
	default:
	    event_inherited();
	    break;
}