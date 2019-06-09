/// @description Insert description here

map_statMod[? CHAR_VAR_MATK] = .01;
map_statMod[? CHAR_VAR_FATK] = .01;
map_statMod[? CHAR_VAR_SATK] = .01;

if(ds_list_size(special) > 0){
	duration = room_speed * special[| 0];
}

event_inherited();