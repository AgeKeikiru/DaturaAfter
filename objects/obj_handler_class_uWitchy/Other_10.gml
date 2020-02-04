/// @description custom events

switch(cEvent){
	case EVENT_CLASS_BASESTATADD:
	    event_inherited();
	
		if(scr_exists(src)){
		    src.hpMax += grd_skills[# 0,0] * grd_skillRate[# 0,0];
		    
		    src.mDef += grd_skills[# 0,1] * grd_skillRate[# 0,1];
		    src.fDef += grd_skills[# 0,1] * grd_skillRate[# 0,1];
		    src.sDef += grd_skills[# 0,1] * grd_skillRate[# 0,1];
		    
		    src.hpMax += grd_skills[# 0,2] * grd_skillRate[# 0,2];
		}
		
		break;
		
	default:
	    event_inherited();
	    break;
}