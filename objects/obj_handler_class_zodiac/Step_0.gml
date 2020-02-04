
if(CS_AUTOSTANCECHECK){
	var _lst = ds_list_create();
	
	scr_act_createEffect(obj_handler_actEffect_zodc_deck,1,src,0,true,_lst);
	
	ds_list_destroy(_lst);
}