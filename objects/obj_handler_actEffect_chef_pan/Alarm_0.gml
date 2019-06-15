
for(var _i = 0;_i < ds_list_size(special) + -1;_i += 2){
	switch(special[| _i]){
		case FOOD_ATK:
			map_statMod[? CHAR_VAR_MATK] += special[| _i + 1];
			map_statMod[? CHAR_VAR_FATK] += special[| _i + 1];
			map_statMod[? CHAR_VAR_SATK] += special[| _i + 1];
			
			break;
			
		case FOOD_DEF:
			map_statMod[? CHAR_VAR_MDEF] += special[| _i + 1];
			map_statMod[? CHAR_VAR_FDEF] += special[| _i + 1];
			map_statMod[? CHAR_VAR_SDEF] += special[| _i + 1];
			
			break;
			
		case FOOD_ACC:
			map_statMod[? CHAR_VAR_ACC] += special[| _i + 1] / 2;
			
			break;
			
		case FOOD_EVA:
			map_statMod[? CHAR_VAR_EVA] += special[| _i + 1] / 2;
			
			break;
			
		case FOOD_SPD:
			map_statMod[? CHAR_VAR_SPD] += special[| _i + 1];
			
			break;
			
		case FOOD_EN:
			enRecover += special[| _i + 1];
			
			break;
	}
}

event_inherited();