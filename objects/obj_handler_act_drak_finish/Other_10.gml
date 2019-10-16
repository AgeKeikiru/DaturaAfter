/// @description custom events

switch(cEvent){
	#region //act_use
		case EVENT_ACT_USE:
		    event_inherited();
		
			if(CS_SRCSTANCEIS obj_handler_actEffect_drak_install){
				instance_destroy(src.stance);
			}
			
			break;
	#endregion
	
	#region //battle_atkMod
		case EVENT_BATTLE_ATKMOD:
		    event_inherited();
		
			if(ds_list_size(special) > 0){
				global.tempFloat += max((src.sAtk / 100) * special[| 0],0);
			}
			
			break;
	#endregion
		
	default:
	    event_inherited();
	    break;
}