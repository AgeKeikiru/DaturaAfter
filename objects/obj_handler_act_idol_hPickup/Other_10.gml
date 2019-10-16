
switch(cEvent){
	#region //act_use
		case EVENT_ACT_USE:
			event_inherited();
			
			if(scr_exists(src,asset_object) && scr_exists(src.stance,asset_object) && src.stance.object_index == obj_handler_actEffect_idol_hype){
				src.stance.charge += -2;
				src.stance.aggro = floor(src.stance.charge);
			}
			
			scr_cEvent_id(src,EVENT_BATTLM_ICONREFRESH);
			
			break;
	#endregion
	    
	default:
	    event_inherited();
	    break;
}