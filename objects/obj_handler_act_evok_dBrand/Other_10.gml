/// @description Insert description here
// You can write your code in this editor

switch(cEvent){
	#region //battle_enemyHit
		case EVENT_BATTLE_ENEMYHIT:
		    event_inherited();
		
			var
			_src = cArgs[| 0],
			_tgt = cArgs[| 1];
			
			if(scr_exists(src,asset_object) && scr_exists(src.stance,asset_object) && _src == src && src.stance.object_index == obj_handler_actEffect_evok_mDstr){
				cdCurr--;
				
				cdCurr = max(cdCurr,0);
			}
			
			break;
	#endregion
	
	default:
	    event_inherited();
	    break;
}