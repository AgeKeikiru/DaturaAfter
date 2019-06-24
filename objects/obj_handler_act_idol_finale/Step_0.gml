
event_inherited();

if(CS_SRCSTANCEIS obj_handler_actEffect_idol_hype){
	if(src.stance.charge < 5){
	    usable = false;
	}
}else{
    usable = false;
}