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
		
	#region //class_skillRefresh
		case EVENT_CLASS_SKILLREFRESH:
			event_inherited();
			
			//hype meter
			var
			_ix = 0,
			_iy = 1;
			
			ds_list_clear(grd_skillAct[# _ix,_iy].special);
			ds_list_add(grd_skillAct[# _ix,_iy].special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
			
			break;
	#endregion
		
	default:
	    event_inherited();
	    break;
}