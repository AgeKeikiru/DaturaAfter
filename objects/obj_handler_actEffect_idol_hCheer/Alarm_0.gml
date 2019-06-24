
if(ds_list_size(special) > 1){
	aggro = special[| 0];
	duration = room_speed * aggro * special[| 1];
}

event_inherited();