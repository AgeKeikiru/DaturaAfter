/// @description Insert description here
// You can write your code in this editor

switch(cEvent){
	#region //battle_atkMod
		case EVENT_BATTLE_ATKMOD:
		    var
		    _src = cArgs[| 0],
		    _tgt = cArgs[| 1],
		    _act = cArgs[| 2];
		    
		    if(map_statMod[? _act.atkScale] != 0 && scr_exists(src,asset_object) && _src == src){
		        global.tempFloat += map_statMod[? _act.atkScale];
		        scr_trace("[" + name + "] atk boost: " + string(map_statMod[? _act.atkScale] * 100) + "%");
		    }
		
		    break;
	#endregion
	    
	#region //battle_defMod
		case EVENT_BATTLE_DEFMOD:
		    var
		    _src = cArgs[| 0],
		    _tgt = cArgs[| 1],
		    _act = cArgs[| 2];
		    
		    if(map_statMod[? _act.defScale] != 0 && scr_exists(src,asset_object) && _tgt == src){
		        global.tempFloat += -map_statMod[? _act.defScale];
		        scr_trace("[" + name + "] def boost: " + string(map_statMod[? _act.defScale] * 100) + "%");
		    }
		
		    break;
	#endregion
	    
	#region //battle_accMod
		case EVENT_BATTLE_ACCMOD:
		    var
		    _src = cArgs[| 0],
		    _tgt = cArgs[| 1],
		    _act = cArgs[| 2];
		    
		    if(map_statMod[? CHAR_VAR_ACC] != 0 && scr_exists(src,asset_object) && _src == src){
		        global.tempFloat += map_statMod[? CHAR_VAR_ACC];
		        scr_trace("[" + name + "] acc boost: " + string(map_statMod[? CHAR_VAR_ACC] * 100) + "%");
		    }
		
		    break;
	#endregion
	    
	#region //battle_evaMod
		case EVENT_BATTLE_EVAMOD:
		    var
		    _src = cArgs[| 0],
		    _tgt = cArgs[| 1],
		    _act = cArgs[| 2];
		    
		    if(map_statMod[? CHAR_VAR_EVA] != 0 && scr_exists(src,asset_object) && _tgt == src){
		        global.tempFloat += -map_statMod[? CHAR_VAR_EVA];
		        scr_trace("[" + name + "] eva boost: " + string(map_statMod[? CHAR_VAR_EVA] * 100) + "%");
		    }
		
		    break;
	#endregion
	    
	#region //battle_spdMod
		case EVENT_BATTLE_SPDMOD:
		    var
		    _src = cArgs[| 0];
		    
		    if(map_statMod[? CHAR_VAR_SPD] != 0 && scr_exists(src,asset_object) && _src == src){
		        global.tempFloat += map_statMod[? CHAR_VAR_SPD] * 10;
		    }
		
		    break;
	#endregion
	
	#region //battle_enemyKilled
		case EVENT_BATTLE_ENEMYKILLED:
			var
		    _src = cArgs[| 0],
		    _tgt = cArgs[| 1];
		    
		    if(scr_exists(src,asset_object) && _tgt == src){
		    	instance_destroy();
		    }
			
			break;
	#endregion
	
	#region //effect_enRecMod
		case EVENT_EFFECT_ENRECMOD:
			var _src = cArgs[| 0];
			
			if(scr_exists(src,asset_object) && _src == src){
				global.tempFloat += enRecover;
			}
			
			break;
	#endregion
}