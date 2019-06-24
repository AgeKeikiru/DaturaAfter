
switch(cEvent){
	#region //act_use
		case EVENT_ACT_USE:
			if(CS_SRCSTANCEIS obj_handler_actEffect_idol_hype){
				if(ds_list_size(special) > 0){
					special[| 0] = src;
				}
			
				event_inherited();
			}
			
			break;
	#endregion
	    
	default:
	    event_inherited();
	    break;
}