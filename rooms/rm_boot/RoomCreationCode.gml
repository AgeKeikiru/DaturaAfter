
room_speed = 60;

#region //sys handling

	window_set_size(1280,720);
	window_center();
	randomize();
	
	for(var _i = 0;_i < 8;_i++){
		global.arr_itemSet[_i] = "";
	}
	
	global.map_item_held = ds_map_create();
	global.map_item_name = ds_map_create();
	global.map_item_desc = ds_map_create();
	global.map_item_price = ds_map_create();
	scr_init_items();
	
	global.grd_dia = ds_grid_create(0,1);
	
	global.grd_chars = ds_grid_create(1,1);
	scr_init_chars();
	
	global.grd_missions = ds_grid_create(1,1);
	scr_init_missions();
	
	global.grd_party_player = ds_grid_create(3,2);
	ds_grid_set_region(global.grd_party_player,0,0,2,1,noone);
	
	global.grd_party_enemy = ds_grid_create(3,2);
	ds_grid_set_region(global.grd_party_enemy,0,0,2,1,noone);
	
	global.grd_dMap_terrain = ds_grid_create(6,5);
	ds_grid_set_region(global.grd_dMap_terrain,0,0,5,4,DMAP_TER_FLOOR);
	global.grd_dMap_terrain[# 4,2] = noone;
	global.grd_dMap_visible = ds_grid_create(6,5);
	global.dMap_xPos = 1;
	global.dMap_yPos = 0;
	global.dMap_xPosTgt = global.dMap_xPos;
	global.dMap_yPosTgt = global.dMap_yPos;
	
	global.lst_activePartySlots = ds_list_create();
	
	global.lst_missionIndex = ds_list_create();
	global.missionCurr = "";
	
	global.playerControl = true;
	global.cid = 0; //class id, used for default custom class names
	
	//inventory
	global.lst_inv_acts = ds_list_create();
	global.lst_inv_arms = ds_list_create();
	global.lst_inv_classes = ds_list_create();
	
	global.heldGold = 0;
	
	//shop inventory
	global.lst_shop_acts = ds_list_create();
	global.lst_shop_arms = ds_list_create();
	global.lst_shop_items = ds_list_create();
	scr_refreshShopList();

#endregion

#region //controls

	global.grd_controls = ds_grid_create(14,1);
	
	global.grd_controls[# IC_KEY_UP,0] = vk_up;
	global.grd_controls[# IC_KEY_RIGHT,0] = vk_right;
	global.grd_controls[# IC_KEY_DOWN,0] = vk_down;
	global.grd_controls[# IC_KEY_LEFT,0] = vk_left;
	
	global.grd_controls[# IC_KEY_PARTY1,0] = ord("Z");
	global.grd_controls[# IC_KEY_PARTY2,0] = ord("X");
	global.grd_controls[# IC_KEY_PARTY3,0] = ord("C");
	global.grd_controls[# IC_KEY_PARTYSHIFT,0] = vk_shift;
	global.grd_controls[# IC_KEY_PARTYITEM,0] = vk_space;
	
	global.grd_controls[# IC_KEY_MENUACCEPT,0] = ord("Z");
	global.grd_controls[# IC_KEY_MENUBACK,0] = ord("X");
	global.grd_controls[# IC_KEY_MENUEXTRA,0] = ord("C");
	global.grd_controls[# IC_KEY_MENUPAGE,0] = vk_shift;
	global.grd_controls[# IC_KEY_PAUSE,0] = vk_backspace;
	
	global.sfc_temp = surface_create(1,1);
	global.buff_temp = buffer_create(1,buffer_fixed,1);
	
	global.stk_menu = ds_stack_create();

#endregion

#region //settings
	
	global.set_txtSpeed = 2;
	
#endregion

#region //flags

	global.map_flags = ds_map_create();
	global.map_flags[? FG_SHOPPROGRESS] = 0;

#endregion

#region //testing

	ds_list_add(global.lst_inv_classes,
		instance_create_depth(0,0,0,obj_handler_class_evoker),
		instance_create_depth(0,0,0,obj_handler_class_angel),
		instance_create_depth(0,0,0,obj_handler_class_chef),
		instance_create_depth(0,0,0,obj_handler_class_razer),
		instance_create_depth(0,0,0,obj_handler_class_idol)
	);
	
	//party slot 1
	var _temp = instance_create_depth(640 + -380,650,0,obj_dungeon_battleMember);
	_temp.src = scr_data_getMap(global.grd_chars,CHAR_IMOLEI);
	_temp.src[? CHAR_VAR_HB0] = scr_data_act_new(WTAG_TYPE_SSC_CURE);
	_temp.src[? CHAR_VAR_HB1] = scr_data_act_new(WTAG_TYPE_SHG,CHAR_VAR_ELE_ICE);
	//_temp.src[? CHAR_VAR_HB2] = instance_find(obj_handler_act_idol_hype,0);
	//_temp.src[? CHAR_VAR_HB3] = instance_find(obj_handler_act_idol_hPickup,0);
	//_temp.src[? CHAR_VAR_HB4] = instance_find(obj_handler_act_chef_food,1);
	//_temp.src[? CHAR_VAR_HB5] = instance_find(obj_handler_act_chef_food,2);
	//_temp.src[? CHAR_VAR_HB6] = instance_find(obj_handler_act_chef_food,5);
	//_temp.src[? CHAR_VAR_HB7] = instance_find(obj_handler_act_chef_tasteTest,0);
	_temp.src[? CHAR_VAR_CLS0] = instance_find(obj_handler_class_evoker,0);
	_temp.src[? CHAR_VAR_CLS0].src = _temp;
	global.grd_party_player[# 0,0] = _temp;
	
	with _temp.src[? CHAR_VAR_CLS0]{
		//ds_grid_set_region(grd_skills,0,0,3,2,5);
		
		//grd_skills[# 0,1] = 1;
		//grd_skills[# 2,1] = 5;
		
		scr_cEvent(id,EVENT_CLASS_SKILLREFRESH);
	}
	
	scr_cEvent(_temp,EVENT_BATTLM_INIT);
	
	ds_list_add(global.lst_inv_acts,
		_temp.src[? CHAR_VAR_HB0],
		_temp.src[? CHAR_VAR_HB1]
	);

	//party slot 2
	_temp = instance_create_depth(640,650,0,obj_dungeon_battleMember);
	_temp.src = scr_data_getMap(global.grd_chars,CHAR_AILE);
	_temp.src[? CHAR_VAR_HB0] = scr_data_act_new(WTAG_TYPE_LMG,CHAR_VAR_ELE_ELC);
	_temp.src[? CHAR_VAR_HB1] = scr_data_act_new(WTAG_TYPE_RPG);
	_temp.src[? CHAR_VAR_HB2] = instance_find(obj_handler_act_idol_hype,0);
	_temp.src[? CHAR_VAR_HB3] = instance_find(obj_handler_act_idol_hPickup,0);
	//_temp.src[? CHAR_VAR_HB4] = instance_find(obj_handler_act_ange_aSmite,0);
	//_temp.src[? CHAR_VAR_HB5] = instance_find(obj_handler_act_chef_food,2);
	//_temp.src[? CHAR_VAR_HB6] = instance_find(obj_handler_act_chef_food,5);
	//_temp.src[? CHAR_VAR_HB7] = instance_find(obj_handler_act_chef_tasteTest,0);
	_temp.src[? CHAR_VAR_CLS0] = instance_find(obj_handler_class_idol,0);
	_temp.src[? CHAR_VAR_CLS0].src = _temp;
	global.grd_party_player[# 1,0] = _temp;
	
	with _temp.src[? CHAR_VAR_CLS0]{
		ds_grid_set_region(grd_skills,0,0,3,2,5);
		
		//grd_skills[# 0,1] = 5;
		
		scr_cEvent(id,EVENT_CLASS_SKILLREFRESH);
	}
	
	scr_cEvent(_temp,EVENT_BATTLM_INIT);
	
	ds_list_add(global.lst_inv_acts,
		_temp.src[? CHAR_VAR_HB0],
		_temp.src[? CHAR_VAR_HB1]
	);
	
	//party slot 3
	_temp = instance_create_depth(640 + 380,650,0,obj_dungeon_battleMember);
	_temp.src = scr_data_getMap(global.grd_chars,CHAR_PAPRIKA);
	_temp.src[? CHAR_VAR_HB0] = scr_data_act_new(WTAG_TYPE_SSC_RAISE);
	_temp.src[? CHAR_VAR_HB1] = scr_data_act_new(WTAG_TYPE_CSC);
	//_temp.src[? CHAR_VAR_HB2] = instance_find(obj_handler_act_chef_messKit,0);
	//_temp.src[? CHAR_VAR_HB3] = instance_find(obj_handler_act_chef_food,0);
	//_temp.src[? CHAR_VAR_HB4] = instance_find(obj_handler_act_chef_food,1);
	//_temp.src[? CHAR_VAR_HB5] = instance_find(obj_handler_act_chef_food,2);
	//_temp.src[? CHAR_VAR_HB6] = instance_find(obj_handler_act_chef_food,5);
	//_temp.src[? CHAR_VAR_HB7] = instance_find(obj_handler_act_chef_food,3);
	//_temp.src[? CHAR_VAR_CLS0] = instance_find(obj_handler_class_chef,0);
	//_temp.src[? CHAR_VAR_CLS0].src = _temp;
	global.grd_party_player[# 2,0] = _temp;
	
	with _temp.src[? CHAR_VAR_CLS0]{
		ds_grid_set_region(grd_skills,0,0,3,2,5);
		
		//grd_skills[# 0,1] = 5;
		
		scr_cEvent(id,EVENT_CLASS_SKILLREFRESH);
	}
	
	scr_cEvent(_temp,EVENT_BATTLM_INIT);
	
	ds_list_add(global.lst_inv_acts,
		_temp.src[? CHAR_VAR_HB0],
		_temp.src[? CHAR_VAR_HB1]
	);
	
	ds_list_add(global.lst_inv_acts,
		scr_data_act_new(WTAG_TYPE_AXE,"",0,2),
		scr_data_act_new(WTAG_TYPE_SMG,CHAR_VAR_ELE_LGT)
	);
	
	ds_list_add(global.lst_inv_arms,
		scr_data_armor_new(CHAR_VAR_MATK,0,3),
		scr_data_armor_new(CHAR_VAR_HP)
	);
	
	global.map_item_held[? ITEM_HEAL1] = 5;
	global.map_item_held[? ITEM_CURE1] = 2;
	global.map_item_held[? ITEM_IMM_ELC] = 2;

#endregion

//room_goto(rm_home);


room_goto(rm_dungeon);
scr_roomSetup();
global.missionCurr = MSN_DEBUG;

instance_create_depth(0,0,0,obj_handler_dungeon);

//global.grd_party_player[# 1,0].ailment[CHAR_SA_SLW] = 9999;
//global.grd_party_player[# 1,0].ailment[CHAR_SA_SLC] = 9999;
//global.grd_party_player[# 1,0].ailment[CHAR_SA_BRN] = 9999;
//global.grd_party_player[# 1,0].ailment[CHAR_SA_BLD] = 9999;
//global.grd_party_player[# 1,0].ailment[CHAR_SA_PSN] = 9999;
//global.grd_party_player[# 1,0].ailment[CHAR_SA_PAR] = 9999;

scr_cEvent(global.grd_party_player[# 0,0],EVENT_BATTLM_ICONREFRESH);
scr_cEvent(global.grd_party_player[# 1,0],EVENT_BATTLM_ICONREFRESH);

with obj_handler_dungeon{
	grd_mobPool[# 0,0] = noone;
	grd_mobPool[# 0,2] = noone;
	
    grd_mobPool[# 0,0] = CHAR_SLIME;
    grd_mobPool[# 0,1] = CHAR_SLIME;
    grd_mobPool[# 0,2] = CHAR_SLIME;
}

//global.grd_party_player[# 0,0].iFrames = room_speed * 10;

scr_cEvent(obj_handler_dungeon,EVENT_DND_ENCOUNTER_FIXED);
/**/