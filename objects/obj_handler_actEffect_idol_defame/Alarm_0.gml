
if(ds_list_size(special) > 0){
	aggro = special[| 0];
}

if(CS_SRCSTANCEIS obj_handler_actEffect_idol_hype){
	with src.stance{
		charge = min(charge + 3,6);
		decayDelay = room_speed * 3;
		aggro = floor(charge);
	}
}

event_inherited();