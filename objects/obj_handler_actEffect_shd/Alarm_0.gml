/// @description Insert description here

if(ds_list_size(special) > 1){
	duration = special[| 1] * room_speed;
}

event_inherited();