
if(CS_AUTOSTANCECHECK){
	var _lst = ds_list_create();
	
	ds_list_add(_lst,min(ceil(src.level / 6),5));
	
	scr_act_createEffect(obj_handler_actEffect_ange_angelite,1,src,0,true,_lst);
}