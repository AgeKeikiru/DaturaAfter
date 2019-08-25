/// @description Insert description here

if(ds_list_size(special) > 1){
	var _key = special[| 0];
	
	map_statMod[? _key] = 99;
	
	duration = room_speed * special[| 1];
}

event_inherited();