
if(ds_list_size(special) > 0){
	duration = special[| 0] * room_speed;
}

map_statMod[? CHAR_VAR_EVA] = -.5;

event_inherited();