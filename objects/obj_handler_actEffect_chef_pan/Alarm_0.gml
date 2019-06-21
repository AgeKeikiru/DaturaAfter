
while(ds_list_size(special) > 1){
	switch(special[| 0]){
		case FOOD_ATK:
			map_statMod[? CHAR_VAR_MATK] += special[| 1];
			map_statMod[? CHAR_VAR_FATK] += special[| 1];
			map_statMod[? CHAR_VAR_SATK] += special[| 1];
			
			break;
			
		case FOOD_DEF:
			map_statMod[? CHAR_VAR_MDEF] += special[| 1];
			map_statMod[? CHAR_VAR_FDEF] += special[| 1];
			map_statMod[? CHAR_VAR_SDEF] += special[| 1];
			
			break;
			
		case FOOD_ACC:
			map_statMod[? CHAR_VAR_ACC] += special[| 1] / 2;
			
			break;
			
		case FOOD_EVA:
			map_statMod[? CHAR_VAR_EVA] += special[| 1] / 2;
			
			break;
			
		case FOOD_SPD:
			map_statMod[? CHAR_VAR_SPD] += special[| 1];
			
			break;
			
		case FOOD_EN:
			enRecover += special[| 1];
			
			break;
	}
	
	ds_list_delete(special,0);
	ds_list_delete(special,0);
}

event_inherited();