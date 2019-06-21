
event_inherited();

if(ds_list_size(special) > 0 && scr_exists(src,asset_object)){
	src.hpCurr += -special[| 0] / room_speed;
	
	if(src.hpCurr / src.hpMax < .2){
		instance_destroy();
	}
}