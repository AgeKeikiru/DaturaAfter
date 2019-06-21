
event_inherited();

if(ds_list_size(special) > 0){
	map_statMod[? CHAR_VAR_EVA] += 1 / (room_speed * 10);
	map_statMod[? CHAR_VAR_EVA] = min(map_statMod[? CHAR_VAR_EVA],special[| 0]);
}