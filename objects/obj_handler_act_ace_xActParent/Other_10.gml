/// @description Insert description here
// You can write your code in this editor

switch(cEvent){
	#region //act_use
		case EVENT_ACT_USE:
			event_inherited();
			
			globalvar G_src;
			G_src = src;
			
			with obj_handler_act_ace_xActParent{
			    if(src == G_src){
			        cdCurr = cdMax;
			    }
			}
			
			break;
	#endregion
	
	default:
	    event_inherited();
	    break;
}