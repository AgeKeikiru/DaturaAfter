/// @description Insert description here
// You can write your code in this editor

switch(cEvent){
    #region //battle_atkMod
        case EVENT_BATTLE_ATKMOD:
            event_inherited();
            
            var
            _src = cArgs[| 0],
            _tgt = cArgs[| 1],
            _act = cArgs[| 2];
            
            if(_act == id && scr_exists(_tgt,asset_object) && scr_isDebuffed(_tgt) && ds_list_size(special) > 0){
                global.tempFloat += special[| 0];
                
                scr_trace("[" + name + "] dmg bonus: " + string(special[| 0] * 100) + "%");
            }
        
            break;
    #endregion
	    
	default:
	    event_inherited();
}