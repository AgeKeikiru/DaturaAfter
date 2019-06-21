/// @description Insert description here
// You can write your code in this editor

switch(cEvent){
	#region //act_use
		case EVENT_ACT_USE:
			event_inherited();
			
			global.tempObj = src;
			
			with obj_handler_act{
			    if(src == global.tempObj && !xAct){
			        cdCurr *= 3;
		    	    cdMax = cdCurr;
			    }
			}
			
			break;
	#endregion
	
	#region //battle_enemyHit
		case EVENT_BATTLE_ENEMYHIT:
		    event_inherited();
		
			var
			_src = cArgs[| 0],
			_tgt = cArgs[| 1];
			
			if(scr_exists(src,asset_object) && _tgt == src){
				cdCurr--;
				
				cdCurr = max(cdCurr,0);
			}
			
			break;
	#endregion
	
	default:
	    event_inherited();
	    break;
}