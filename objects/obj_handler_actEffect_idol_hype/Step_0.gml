
event_inherited();

var
_prev = floor(charge);

if(scr_exists(src,asset_object) && ds_list_size(special) > 3){
	global.tempObj = src
	global.tempBool = false;
	global.tempFloat = charge;

	with obj_handler_actEffect_idol_finale{
		if(ds_list_size(special) > 0 && special[| 0] == global.tempObj && global.tempFloat > 0){
			global.tempBool = true;
			duration = 2;
		}
	}
	
	finaleMode = global.tempBool;
	
	if(finaleMode){
		charge = max(charge + -scr_timeMod(special[| 3] / room_speed),0);
		decayDelay = 1;
	}else if((src.hpCurr / src.hpMax) < special[| 2]){
		charge = min(charge + scr_timeMod(.05 / room_speed),6);
		decayDelay = 1;
	}else if(decayDelay > 0){
		decayDelay += -scr_timeMod(1);
	}else{
		charge = max(charge + -scr_timeMod(.05 / room_speed),0);
	}
	
	if(floor(charge) != _prev){
		aggro = floor(charge);
		scr_cEvent_id(src,EVENT_BATTLM_ICONREFRESH);
	}
}