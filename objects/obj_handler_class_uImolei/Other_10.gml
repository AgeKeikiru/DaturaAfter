/// @description custom events

switch(cEvent){
	case EVENT_CLASS_BASESTATADD:
	    event_inherited();
	
		if(src != undefined && instance_exists(src)){
		    src.mAtk += grd_skills[# 0,0] * grd_skillRate[# 0,0];
		    src.sAtk += grd_skills[# 0,1] * grd_skillRate[# 0,1];
		    src.spd += grd_skills[# 0,2] * grd_skillRate[# 0,2];
		}
		
		break;
		
	default:
	    event_inherited();
	    break;
}