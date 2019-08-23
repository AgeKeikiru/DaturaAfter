
if(CS_AUTOSTANCECHECK){
	var _lst = ds_list_create();
	
	ds_list_add(_lst,min(src.level * 0.00001,0.0005));
	ds_list_add(_lst,grd_skills[# 1,1] * grd_skillRate[# 1,1]);
	ds_list_add(_lst,grd_skills[# 2,1] * grd_skillRate[# 2,1]);
	ds_list_add(_lst,stat_gf_base + (grd_skills[# 3,1] * stat_gf_rate));
	ds_list_add(_lst,grd_skills[# 0,1] * grd_skillRate[# 0,1]);
	
	scr_act_createEffect(obj_handler_actEffect_idol_hype,1,src,0,true,_lst);
}