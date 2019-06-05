/// @description Destroy panels on death

for(var _i = 0;_i < ds_list_size(lst_panels);_i++){
	scr_cEvent(lst_panels[| _i],EVENT_FPO_FADEKILL);
	instance_destroy(tb_obj_r);
	instance_destroy(tb_obj_l);
}