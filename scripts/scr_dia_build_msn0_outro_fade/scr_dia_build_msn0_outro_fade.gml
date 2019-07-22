ds_stack_push(global.stk_menuDia,scr_dia_build_home_intro);
global.map_flags[? FG_PROLOGUE] = false;

//init character party
while(ds_list_size(global.lst_inv_acts) > 0){
    instance_destroy(global.lst_inv_acts[| 0]);
    ds_list_delete(global.lst_inv_acts,0);
}

ds_list_clear(global.lst_inv_classes);

instance_destroy(obj_handler_class_parent);
instance_destroy(obj_handler_act);

scr_init_chars();

global.grd_party_player[# 1,0] = instance_create_depth(0,0,0,obj_dungeon_battleMember);
global.grd_party_player[# 2,0] = instance_create_depth(0,0,0,obj_dungeon_battleMember);

with global.grd_party_player[# 0,0]{
    src = scr_data_getMap(global.grd_chars,CHAR_IMOLEI);
    src[? CHAR_VAR_HB0] = scr_data_act_new(WTAG_TYPE_DGR,"",0,0);
	src[? CHAR_VAR_HB1] = scr_data_act_new(WTAG_TYPE_ASC_ARW,CHAR_VAR_ELE_ICE,0,0);
	src[? CHAR_VAR_CLS0] = instance_create_depth(0,0,0,obj_handler_class_evoker);
	
	ds_list_add(global.lst_inv_acts,
		src[? CHAR_VAR_HB0],
		src[? CHAR_VAR_HB1]
	);
	
	ds_list_add(global.lst_inv_classes,
		src[? CHAR_VAR_CLS0]
	);
}

with global.grd_party_player[# 1,0]{
    src = scr_data_getMap(global.grd_chars,CHAR_AILE);
    src[? CHAR_VAR_HB0] = scr_data_act_new(WTAG_TYPE_HGN,"",0,0);
	src[? CHAR_VAR_HB1] = scr_data_act_new(WTAG_TYPE_SSC_HEAL,"",0,0);
	src[? CHAR_VAR_CLS0] = instance_create_depth(0,0,0,obj_handler_class_angel);
	
	ds_list_add(global.lst_inv_acts,
		src[? CHAR_VAR_HB0],
		src[? CHAR_VAR_HB1]
	);
	
	ds_list_add(global.lst_inv_classes,
		src[? CHAR_VAR_CLS0]
	);
}

with global.grd_party_player[# 2,0]{
    src = scr_data_getMap(global.grd_chars,CHAR_PAPRIKA);
    src[? CHAR_VAR_HB0] = scr_data_act_new(WTAG_TYPE_PAN,"",0,0);
	src[? CHAR_VAR_HB1] = scr_data_act_new(WTAG_TYPE_SHD_BRN,"",0,0);
	src[? CHAR_VAR_CLS0] = instance_create_depth(0,0,0,obj_handler_class_chef);
	
	ds_list_add(global.lst_inv_acts,
		src[? CHAR_VAR_HB0],
		src[? CHAR_VAR_HB1]
	);
	
	ds_list_add(global.lst_inv_classes,
		src[? CHAR_VAR_CLS0]
	);
}

scr_cEvent(obj_dungeon_battleMember,EVENT_BATTLM_INIT);

scr_dungeon_endDia();
scr_menu_nextMenu();