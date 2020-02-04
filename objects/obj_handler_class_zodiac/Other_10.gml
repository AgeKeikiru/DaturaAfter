/// @description custom events

switch(cEvent){
	#region //class_baseStatAdd
    	case EVENT_CLASS_BASESTATADD:
    	    event_inherited();
    	
    		if(scr_exists(src)){
    		    src.misc += ss_level * ss_rate;
    		    
    		    src.sAtk += grd_skills[# ZODC_SK_SATK] * grd_skillRate[# ZODC_SK_SATK];
    		    src.sDef += grd_skills[# ZODC_SK_SDEF] * grd_skillRate[# ZODC_SK_SDEF];
    		    
    		    var
    	    	_boost = grd_skills[# ZODC_SK_ELE] * grd_skillRate[# ZODC_SK_ELE];
    	    	
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
			
			#region //expel
    			var _act = grd_skillAct[# ZODC_SK_EXPEL];
    			_act.pwr = grd_skills[# ZODC_SK_EXPEL] * grd_skillRate[# ZODC_SK_EXPEL];
			#endregion
			
			#region //empower
    			var _act = grd_skillAct[# ZODC_SK_EMPOWER];
    			ds_list_clear(_act.special);
    			
    			#macro ZODC_EMP_DURATION 0
    			ds_list_add(_act.special,grd_skills[# ZODC_SK_EMPOWER] * grd_skillRate[# ZODC_SK_EMPOWER]);
    			
    			#macro ZODC_EMP_ATK 1
    			ds_list_add(_act.special,0);
    			
    			#macro ZODC_EMP_DEF 2
    			ds_list_add(_act.special,0);
			#endregion
			
			#region //catastrophe
    			var _act = grd_skillAct[# ZODC_SK_CATA];
    			_act.pwr = grd_skills[# ZODC_SK_CATA] * grd_skillRate[# ZODC_SK_CATA];
			#endregion
			
			#region //siphon
    			var _act = grd_skillAct[# ZODC_SK_SIPHON];
    			_act.pwr = grd_skills[# ZODC_SK_SIPHON] * grd_skillRate[# ZODC_SK_SIPHON];
    			ds_list_clear(_act.special);
    			ds_list_add(_act.special,0);
			#endregion
			
			break;
	#endregion
		
	default:
	    event_inherited();
	    break;
}