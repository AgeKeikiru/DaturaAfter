/// @description Insert description here

if(ds_list_size(special) > 2){
	map_statMod[? CHAR_VAR_MDEF] = special[| 0];
	map_statMod[? CHAR_VAR_FDEF] = special[| 0];
	map_statMod[? CHAR_VAR_SDEF] = special[| 0];
	
	map_statMod[? CHAR_VAR_SPD] = special[| 1];
	
	aggro = special[| 2];
}

event_inherited();