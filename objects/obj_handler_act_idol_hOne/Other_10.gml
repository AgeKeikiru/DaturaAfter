
switch(cEvent){
	#region //act_use
		case EVENT_ACT_USE:
			if(scr_exists(src,asset_object) && scr_exists(src.stance,asset_object) && src.stance.object_index == obj_handler_actEffect_idol_hype){
				var _c = src.stance.charge;
				
				if(ds_list_size(special) > 0){
					special[| 0] = -4;
				}
			
				event_inherited();
				
				src.stance.charge += -4;
				src.stance.aggro = floor(src.stance.charge);
				
				scr_cEvent(src,EVENT_BATTLM_ICONREFRESH);
			}
			
			break;
	#endregion
	    
	default:
	    event_inherited();
	    break;
}