
if(ds_list_size(special) > 2){
	aggro = special[| 0];
	
	map_statMod[? CHAR_VAR_MDEF] = special[| 1];
	map_statMod[? CHAR_VAR_FDEF] = special[| 1];
	map_statMod[? CHAR_VAR_SDEF] = special[| 1];
	
	map_statMod[? CHAR_VAR_MATK] = special[| 2];
	map_statMod[? CHAR_VAR_FATK] = special[| 2];
	map_statMod[? CHAR_VAR_SATK] = special[| 2];
}

event_inherited();