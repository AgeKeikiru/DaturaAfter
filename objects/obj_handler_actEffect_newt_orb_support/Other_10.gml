/// @description Insert description here
// You can write your code in this editor

switch(cEvent){
	#region //effect_hpRecMod
		case EVENT_EFFECT_HPRECMOD:
			event_inherited();
			
			var
			_src = cArgs[| 0];
			
			if(_src == src && ds_list_size(special) > 0){
				global.tempFloat += special[| 0];
			}
			
			break;
	#endregion
	
	default:
	    event_inherited();
}