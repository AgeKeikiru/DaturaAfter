
if(scr_exists(src,asset_object) && ds_list_size(special) > 3){
	hpMax = src.hpMax * (0.5 + special[| 2]);
	
	hp = hpMax;
	
	aggro = special[| 3];
}

event_inherited();