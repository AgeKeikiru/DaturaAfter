
switch(cEvent){
	#region //act_use
		case EVENT_ACT_USE:
			event_inherited();
			
			if(scr_exists(src,asset_object) && scr_exists(src.stance,asset_object) && src.stance.object_index == obj_handler_actEffect_ange_angelite){
				src.stance.charge--;
			}
	#endregion
	    
	default:
	    event_inherited();
}