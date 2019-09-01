/// @description Insert description here

if(ds_list_size(special) > 0){
	var
	_atk = special[| 0],
	_boost = .2;
	
	map_statMod[? (_atk ? CHAR_VAR_MATK : CHAR_VAR_MDEF)] = _boost;
	map_statMod[? (_atk ? CHAR_VAR_FATK : CHAR_VAR_FDEF)] = _boost;
	map_statMod[? (_atk ? CHAR_VAR_SATK : CHAR_VAR_SDEF)] = _boost;
	
	effectTxt = _atk ? "ATK++" : "DEF++";
}

event_inherited();