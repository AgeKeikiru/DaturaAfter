
event_inherited();

if(CS_SRCSTANCEIS obj_handler_actEffect_zodc_deck){
	if(ds_list_empty(src.stance.lst_deckReload)){
	    usable = false;
	}
}else{
    usable = false;
}