/// @description Insert description here
// You can write your code in this editor

switch(cEvent){
	#region //
		case EVENT_BATTLE_ATKMOD:
			var
			_src = cArgs[| 0],
			_tgt = cArgs[| 1];
			
			if(scr_exists(_tgt,asset_object)){
				map_statMod[? CHAR_VAR_MATK] = _tgt.src[? CHAR_VAR_MDEF] / 100;
				map_statMod[? CHAR_VAR_FATK] = _tgt.src[? CHAR_VAR_FDEF] / 100;
				map_statMod[? CHAR_VAR_SATK] = _tgt.src[? CHAR_VAR_SDEF] / 100;
				
				event_inherited();
				
				map_statMod[? CHAR_VAR_MATK] = .01;
				map_statMod[? CHAR_VAR_FATK] = .01;
				map_statMod[? CHAR_VAR_SATK] = .01;
			}
			
			break;
	#endregion
	
	default:
		event_inherited();
		break;
}