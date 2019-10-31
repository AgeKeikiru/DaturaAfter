/// @description Insert description here
// You can write your code in this editor

switch(cEvent){
	#region //battle_enemyHit
		case EVENT_BATTLE_ENEMYHIT:
		    event_inherited();
		
			var
			_src = cArgs[| 0],
			_tgt = cArgs[| 1];
			
			if(_tgt == src && ds_list_size(special) > 0){
				global.tempFloat += -special[| 0];
			}
			
			break;
	#endregion
	
	default:
	    event_inherited();
}