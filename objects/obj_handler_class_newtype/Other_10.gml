/// @description custom events

switch(cEvent){
	#region //class_baseStatAdd
		case EVENT_CLASS_BASESTATADD:
		    event_inherited();
		
			if(scr_exists(src,asset_object)){
			    src.fAtk += grd_skills[# 0,0] * grd_skillRate[# 0,0];
			    src.ele_elc += grd_skills[# 0,1] * grd_skillRate[# 0,1];
			    src.fDef += grd_skills[# 0,2] * grd_skillRate[# 0,2];
			}
			
			break;
	#endregion
	
	#region //class_skillRefresh
		case EVENT_CLASS_SKILLREFRESH:
			event_inherited();
			
			for(var _iy = 0;_iy < 3;_iy++){
				var
				_ix = 1,
				_act = grd_skillAct[# _ix,_iy];
				
				ds_list_clear(_act.special);
				ds_list_add(_act.special,grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy]);
				ds_list_add(_act.special,grd_skills[# 2,0] * grd_skillRate[# 2,0]);
			}
			
			break;
	#endregion
		
	default:
	    event_inherited();
	    break;
}