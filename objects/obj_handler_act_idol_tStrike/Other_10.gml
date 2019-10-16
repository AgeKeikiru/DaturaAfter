
switch(cEvent){
	#region //class_baseStatAdd
    	case EVENT_BATTLE_ENEMYHIT:
    	    event_inherited();
    	
    		var
    		_src = cArgs[| 0],
    		_tgt = cArgs[| 1],
    		_act = cArgs[| 2];
    		
    		if(_act == id && _src == src && CS_SRCSTANCEIS obj_handler_actEffect_idol_hype){
    		    with src.stance{
    		        charge = min(charge + 3,6);
            		decayDelay = room_speed * 3;
            		aggro = floor(charge);
    		    }
    		    
    		    scr_cEvent_id(src,EVENT_BATTLM_ICONREFRESH);
    		}
    		
    		break;
	#endregion
		
	default:
	    event_inherited();
	    break;
}