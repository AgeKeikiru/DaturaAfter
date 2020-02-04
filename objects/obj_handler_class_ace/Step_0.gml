
if(CS_AUTOSTANCECHECK){
	var _lst = ds_list_create();
	
	//weapon master specials macro
	#macro ACE_WM_LEVEL 0
	ds_list_add(_lst,src.level * 0.005);
	
	#macro ACE_WM_SDANCE 1
	ds_list_add(_lst,grd_skills[# ACE_SK_SDANCE] * grd_skillRate[# ACE_SK_SDANCE]);
	
	#macro ACE_WM_STRATOS 2
	ds_list_add(_lst,grd_skills[# ACE_SK_STRATOS] * grd_skillRate[# ACE_SK_STRATOS]);
	
	#macro ACE_WM_MDRAW 3
	ds_list_add(_lst,grd_skills[# ACE_SK_MDRAW] * grd_skillRate[# ACE_SK_MDRAW]);
	
	#macro ACE_WM_RIPO 4
	ds_list_add(_lst,grd_skills[# ACE_SK_RIPO] * grd_skillRate[# ACE_SK_RIPO]);
	
	#macro ACE_WM_HTRIG 5
	ds_list_add(_lst,(grd_skills[# ACE_SK_HTRIG] * stat_ht_rate) + stat_ht_base);
	
	#macro ACE_WM_FWORK 6
	ds_list_add(_lst,grd_skills[# ACE_SK_FWORK] * grd_skillRate[# ACE_SK_FWORK]);
	
	scr_act_createEffect(obj_handler_actEffect_ace_wm,1,src,0,true,_lst);
	
	ds_list_destroy(_lst);
}