
switch(cEvent){
	#region //act_use
		case EVENT_ACT_USE:
			if(scr_exists(src,asset_object) && scr_exists(src.stance,asset_object) && src.stance.object_index == obj_handler_actEffect_idol_hype){
				var _c = src.stance.charge;
				
				if(ds_list_size(special) > 0){
					special[| 0] = floor(_c);
				}
			
				event_inherited();
				
				src.stance.charge = 0;
				src.stance.aggro = 0;
				
				scr_cEvent_id(src,EVENT_BATTLM_ICONREFRESH);
			}
			
			break;
	#endregion
	    
	default:
	    event_inherited();
	    break;
}