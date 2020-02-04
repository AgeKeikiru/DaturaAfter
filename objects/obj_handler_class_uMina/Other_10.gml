/// @description custom events

switch(cEvent){
	case EVENT_CLASS_BASESTATADD:
	    event_inherited();
	
		if(scr_exists(src)){
		    src.acc += grd_skills[# 0,0] * grd_skillRate[# 0,0];
		    src.misc += grd_skills[# 0,1] * grd_skillRate[# 0,1];
		    src.eva += grd_skills[# 0,2] * grd_skillRate[# 0,2];
		}
		
		break;
		
	default:
	    event_inherited();
	    break;
}