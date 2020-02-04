/// @description Insert description here

if(ds_list_size(special) > 0){
	map_statMod[? CHAR_VAR_MATK] = special[| 0];
	map_statMod[? CHAR_VAR_FATK] = special[| 0];
	map_statMod[? CHAR_VAR_SATK] = special[| 0];
}

event_inherited();