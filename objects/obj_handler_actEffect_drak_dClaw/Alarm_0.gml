
if(ds_list_size(special) > 0){
	map_statMod[? CHAR_VAR_MDEF] = special[| 0];
	map_statMod[? CHAR_VAR_FDEF] = special[| 0];
	map_statMod[? CHAR_VAR_SDEF] = special[| 0];
}

event_inherited();