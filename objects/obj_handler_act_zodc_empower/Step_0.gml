
event_inherited();

if((CS_SRCSTANCEIS obj_handler_actEffect_zodc_deck) && !ds_list_empty(src.stance.lst_deck)){
	if(ds_list_find_index(src.stance.lst_deck,arr_check[0]) == -1 || ds_list_find_index(src.stance.lst_deck,arr_check[1]) == -1){
	    usable = false;
	}
}else{
    usable = false;
}