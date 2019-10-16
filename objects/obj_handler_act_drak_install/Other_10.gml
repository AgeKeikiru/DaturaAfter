/// @description Insert description here
// You can write your code in this editor

switch(cEvent){
	#region //act_use
		case EVENT_ACT_USE:
		    event_inherited();
		
			global.tempObj = src;
			
			with obj_handler_class_draker{
			    if(src == global.tempObj){
			        reinstall = false;
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
			
			if(scr_exists(src,asset_object) && _src == src){
				cdCurr--;
				
				cdCurr = max(cdCurr,0);
			}
			
			global.tempInt = src;
			global.tempObj = id;
			
			with obj_handler_actEffect_drak_install{
			    if(src == global.tempInt){
			        global.tempObj.cdCurr = global.tempObj.cdMax;
			    }
			}
			
			break;
	#endregion
	
	default:
	    event_inherited();
	    break;
}