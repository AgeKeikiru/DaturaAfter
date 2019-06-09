/// @description Insert description here

if(ds_list_size(special) > 2){
	map_statMod[? CHAR_VAR_ACC] = special[| 0];
	
	map_statMod[? CHAR_VAR_EVA] = special[| 1];
	
	aggro = special[| 2];
}

event_inherited();