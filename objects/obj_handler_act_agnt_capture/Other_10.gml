/// @description Insert description here
// You can write your code in this editor

switch(cEvent){
	#region //battle_enemyKilled
		case EVENT_BATTLE_ENEMYKILLED:
		    event_inherited();
		
			var
			_src = cArgs[| 0],
			_tgt = cArgs[| 1],
			_act = cArgs[| 2];
			
			if(_act == id){
				repeat(10){
					scr_getLootRandom();
				}
			}
			
			break;
	#endregion
	
	default:
	    event_inherited();
	    break;
}