/// @description Insert description here
// You can write your code in this editor

switch(cEvent){
	#region //battle_miss
		case EVENT_BATTLE_MISS:
		    event_inherited();
		    
		    var
		    _src = cArgs[| 0],
		    _tgt = cArgs[| 1],
		    _act = cArgs[| 2];
		    
		    if(scr_exists(src,asset_object) && _tgt == src && _act.tgtEnemy && duration < 0){
		        duration = room_speed * 2;
		        map_statMod[? CHAR_VAR_EVA] = .5;
		        
		        scr_createEffectTxt(src,"EVA++");
		        scr_cEvent(src,EVENT_BATTLM_ICONREFRESH);
		    }
		    
		    break;
	#endregion
	    
	default:
	    event_inherited();
}