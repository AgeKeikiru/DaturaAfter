
event_inherited();

if(scr_exists(src,asset_object) && scr_exists(src.stance,asset_object) && src.stance.object_index == obj_handler_actEffect_idol_hype){
	if(src.stance.charge < 2){
	    usable = false;
	}
}else{
    usable = false;
}