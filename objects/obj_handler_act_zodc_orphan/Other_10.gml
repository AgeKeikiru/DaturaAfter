/// @description Insert description here
// You can write your code in this editor

switch(cEvent){
	#region //act_use
		case EVENT_ACT_USE:
			used = true;
			
			event_inherited();
		
			break;
	#endregion
	
	default:
	    event_inherited();
	    break;
}