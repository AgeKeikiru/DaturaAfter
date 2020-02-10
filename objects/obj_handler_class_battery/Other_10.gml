/// @description custom events

switch(cEvent){
	#region //class_baseStatAdd
    	case EVENT_CLASS_BASESTATADD:
    	    event_inherited();
    	
    		if(scr_exists(src)){
    		    //src.misc += ss_level * ss_rate;
    		    
    		    //src.sAtk += grd_skills[# ZODC_SK_SATK] * grd_skillRate[# ZODC_SK_SATK];
    		    //src.sDef += grd_skills[# ZODC_SK_SDEF] * grd_skillRate[# ZODC_SK_SDEF];
    		    
    		    var
    	    	_boost = grd_skills[# ZODC_SK_ELE] * grd_skillRate[# ZODC_SK_ELE];
    	    	
    		    //src.ele_fir += _boost;
    		    //src.ele_ice += _boost;
    		    //src.ele_drk += _boost;
    		    //src.ele_lgt += _boost;
    		    //src.ele_nat += _boost;
    		    //src.ele_elc += _boost;
    		}
    		
    		break;
	#endregion
	
	#region //class_skillRefresh
		case EVENT_CLASS_SKILLREFRESH:
			event_inherited();
			
			#region //expel
    			//var _act = grd_skillAct[# ZODC_SK_EXPEL];
    			//_act.pwr = grd_skills[# ZODC_SK_EXPEL] * grd_skillRate[# ZODC_SK_EXPEL];
			#endregion
			
			break;
	#endregion
		
	default:
	    event_inherited();
	    break;
}