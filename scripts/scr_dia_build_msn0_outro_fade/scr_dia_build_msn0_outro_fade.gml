ds_stack_push(global.stk_menuDia,scr_dia_build_home_intro);

//init character party
while(ds_list_size(global.lst_inv_acts) > 0){
    instance_destroy(global.lst_inv_acts[| 0]);
    ds_list_delete(global.lst_inv_acts,0);
}

instance_destroy(obj_handler_class_parent);
instance_destroy(obj_handler_act);

scr_init_chars();

ds_list_clear(global.lst_inv_classes);
ds_list_add(global.lst_inv_classes,
	instance_create_depth(0,0,0,obj_handler_class_evoker),
	instance_create_depth(0,0,0,obj_handler_class_angel),
	instance_create_depth(0,0,0,obj_handler_class_chef),
	instance_create_depth(0,0,0,obj_handler_class_idol),
	instance_create_depth(0,0,0,obj_handler_class_razer),
	instance_create_depth(0,0,0,obj_handler_class_agent),
	instance_create_depth(0,0,0,obj_handler_class_sanctum),
	instance_create_depth(0,0,0,obj_handler_class_draker)
);

global.grd_party_player[# 0,0] = global.map_chars[? CHAR_IMOLEI];
global.grd_party_player[# 1,0] = global.map_chars[? CHAR_AILE];
global.grd_party_player[# 2,0] = global.map_chars[? CHAR_PAPRIKA];

with global.grd_party_player[# 0,0]{
    src[? CHAR_VAR_HB0] = scr_data_act_new(WTAG_TYPE_DGR,"",0,0);
	src[? CHAR_VAR_HB1] = scr_data_act_new(WTAG_TYPE_ASC_ARW,CHAR_VAR_ELE_ICE,0,0);
	src[? CHAR_VAR_CLS0] = global.lst_inv_classes[| 0];
	
	ds_list_add(global.lst_inv_acts,
		src[? CHAR_VAR_HB0],
		src[? CHAR_VAR_HB1]
	);
}

with global.grd_party_player[# 1,0]{
    src[? CHAR_VAR_HB0] = scr_data_act_new(WTAG_TYPE_HGN,"",0,0);
	src[? CHAR_VAR_HB1] = scr_data_act_new(WTAG_TYPE_SSC_HEAL,"",0,0);
	src[? CHAR_VAR_CLS0] = global.lst_inv_classes[| 1];
	
	ds_list_add(global.lst_inv_acts,
		src[? CHAR_VAR_HB0],
		src[? CHAR_VAR_HB1]
	);
}

with global.grd_party_player[# 2,0]{
    src[? CHAR_VAR_HB0] = scr_data_act_new(WTAG_TYPE_PAN,"",0,0);
	src[? CHAR_VAR_HB1] = scr_data_act_new(WTAG_TYPE_SHD_BRN,"",0,0);
	src[? CHAR_VAR_CLS0] = global.lst_inv_classes[| 2];
	
	ds_list_add(global.lst_inv_acts,
		src[? CHAR_VAR_HB0],
		src[? CHAR_VAR_HB1]
	);
}

scr_cEvent(EVENT_BATTLM_INIT);

scr_dungeon_endDia();
scr_menu_nextMenu();