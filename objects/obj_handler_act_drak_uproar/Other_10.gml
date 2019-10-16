/// @description Insert description here
// You can write your code in this editor

switch(cEvent){
	#region //act_use
		case EVENT_ACT_USE:
			effect_end = (CS_SRCSTANCEIS obj_handler_actEffect_drak_install) ? obj_handler_actEffect_drak_uproar : noone;
			
			event_inherited();
			
			break;
	#endregion
	    
	default:
	    event_inherited();
}