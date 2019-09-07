scr_trace("scr_init called");

global.manualDebug = false;

#region //sys handling

	randomize();
	audio_stop_all();
	
	var _arr;
	
	_arr = [
	    obj_handler_act,
	    obj_handler_actEffect,
	    obj_handler_class_parent,
	    obj_handler_mission_parent,
	    obj_handler_armor,
	    obj_dungeon_battleMember,
	    obj_handler_quest_parent
	];
	
	for(var _i = 0;_i < array_length_1d(_arr);_i++){
	    instance_destroy(_arr[_i]);
	}
	
	for(var _i = 0;_i < 8;_i++){
		global.arr_itemSet[_i] = "";
	}
	
	_arr = [
	    "map_item_held",
	    "map_item_name",
	    "map_item_desc",
	    "map_item_price",
	    "map_mat_held",
	    "map_mat_name",
	    "map_mat_desc",
	    "map_flags",
	    "map_chars"
	];
	
	for(var _i = 0;_i < array_length_1d(_arr);_i++){
	    if(variable_global_exists(_arr[_i])){
	        ds_map_destroy(variable_global_get(_arr[_i]));
	    }
	    
	    variable_global_set(_arr[_i],ds_map_create());
	}
	
	_arr = [
	    "grd_dia",
	    "grd_chars",
	    "grd_missions",
	    "grd_socials",
	    "grd_quests",
	    "grd_party_player",
	    "grd_party_enemy",
	    "grd_dMap_terrain",
	    "grd_dMap_visible",
	    "grd_controls"
	];
	
	for(var _i = 0;_i < array_length_1d(_arr);_i++){
	    if(variable_global_exists(_arr[_i])){
	        ds_grid_destroy(variable_global_get(_arr[_i]));
	    }
	    
	    variable_global_set(_arr[_i],ds_grid_create(1,1));
	}
	
	_arr = [
	    "lst_activePartySlots",
	    "lst_missionIndex",
	    "lst_missionLoot_table",
	    "lst_missionLoot_queue",
	    "lst_newFormation",
	    "lst_inv_acts",
	    "lst_inv_arms",
	    "lst_inv_classes",
	    "lst_shop_acts",
	    "lst_shop_arms",
	    "lst_shop_items",
	    "lst_shop_classes",
	    "lst_bgmFadeOut",
	    "lst_bgmStream",
	    "lst_sfx",
	    "lst_simAreas"
	];
	
	for(var _i = 0;_i < array_length_1d(_arr);_i++){
	    if(variable_global_exists(_arr[_i])){
	        ds_list_destroy(variable_global_get(_arr[_i]));
	    }
	    
	    variable_global_set(_arr[_i],ds_list_create());
	}
	
	global.map_flags[? FG_SHOPPROGRESS] = 0;
	global.map_flags[? FG_PROLOGUE] = true;
	global.map_flags[? FG_FREEPLAY] = false;
	global.map_flags[? FG_TUT_QUEST] = false;
	global.map_flags[? FG_TUT_FORMATION] = false;
	global.map_flags[? FG_TUT_SIM] = false;
	
	//mission phases
	global.map_flags[? FG_MSNCLEARS] = 0;
	global.map_flags[? FG_MSNPHASE] = 0;
	global.map_flags[? FG_MP1] = 0;
	
	//character unlock status
	global.map_flags[? CHAR_IMOLEI] = true;
	global.map_flags[? CHAR_AILE] = true;
	global.map_flags[? CHAR_PAPRIKA] = true;
	global.map_flags[? CHAR_BLAZE] = false;
	global.map_flags[? CHAR_ARI] = false;
	
	//sim area status
	var SV_arr = [
		SIM_FOREST,
		SIM_TUNDRA,
		SIM_TUNNELS
	];
	
	for(var SV_i = 0;SV_i < array_length_1d(SV_arr);SV_i++){
		var SV_key = SIM_FG_STATUS + SV_arr[SV_i];
		
		global.map_flags[? SV_key] = -1;
	}
	
	scr_init_items();
	scr_init_mats();
	scr_init_chars();
	scr_init_missions();
	scr_init_socials();
	scr_init_quests();
	
	global.currentSocial = noone;
	
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
	global.dMap_pgmCoords = [0,0,1,1];
	global.dMap_xPosTgt = global.dMap_xPos;
	global.dMap_yPosTgt = global.dMap_yPos;
	
	global.missionCurr = "";
	global.simFloor = 0;
	global.simArea = 0;
	
	global.playerControl = true;
	global.cid = 0; //class id, used for default custom class names
	global.autoScrollDelay = 0;
	
	//inventory
	global.heldGold = 1000;
	
	//shop inventory
	scr_refreshShopList();
	
	//sound
	global.bgmTrack = [noone,noone,noone];
	global.bgmTrack_curr = 0;
	
	instance_destroy(obj_handler_audio);
	instance_create_depth(0,0,0,obj_handler_audio);

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
	global.sfc_map = noone;
	global.sfc_minimap = noone;
	global.buff_temp = buffer_create(1,buffer_fixed,1);
	
	global.stk_menu = ds_stack_create();
	global.stk_menuDia = ds_stack_create();
	global.stk_menuAlert = ds_stack_create();
	global.stk_newQuests = ds_stack_create();

#endregion

#region //settings
	
	global.set_txtSpeed = 6;
	global.set_winTrans = 98;
	global.set_volBgm = 50;
	global.set_volSfx = 50;
	global.set_atbSpeed = 80;
	global.set_atbMod = 20;
	global.set_mmSize = 30;
	global.set_mapZoom = false;
	
#endregion

var _temp;

_temp = global.map_chars[? CHAR_BLAZE];

ds_list_add(global.lst_inv_classes,
	instance_create_depth(0,0,0,obj_handler_class_evoker)
);

with _temp{
    src[? CHAR_VAR_HB0] = scr_data_act_new(WTAG_TYPE_CSC,CHAR_VAR_ELE_ICE,0,10);
    src[? CHAR_VAR_HB1] = scr_data_act_new(WTAG_TYPE_SHD_BRN,"");
    src[? CHAR_VAR_HB2] = scr_data_act_new(WTAG_TYPE_CSC,CHAR_VAR_ELE_DRK,0,10);
    src[? CHAR_VAR_HB3] = scr_data_act_new(WTAG_TYPE_SSC_HEAL,"",0,10);
	src[? CHAR_VAR_HB4] = scr_data_act_new(WTAG_TYPE_ASC_RAY,CHAR_VAR_ELE_DRK,0,10);
	src[? CHAR_VAR_HB5] = scr_data_act_new(WTAG_TYPE_ASC_ARW,CHAR_VAR_ELE_ICE,0,10);
	src[? CHAR_VAR_HB6] = scr_data_act_new(WTAG_TYPE_HGN,CHAR_VAR_ELE_ICE,0,10);
	src[? CHAR_VAR_HB7] = scr_data_act_new(WTAG_TYPE_SHG,"",0,10);
	src[? CHAR_VAR_CLS0] = global.lst_inv_classes[| 0];
	
	with src[? CHAR_VAR_CLS0]{
		ds_grid_set_region(grd_skills,0,0,3,2,10);
		
		scr_cEvent(id,EVENT_CLASS_SKILLREFRESH);
	}
	
	scr_cEvent(id,EVENT_BATTLM_INIT);
	
	ds_list_add(global.lst_inv_acts,
		src[? CHAR_VAR_HB0],
		src[? CHAR_VAR_HB1],
		src[? CHAR_VAR_HB2],
		src[? CHAR_VAR_HB3],
		src[? CHAR_VAR_HB4],
		src[? CHAR_VAR_HB5],
		src[? CHAR_VAR_HB6],
		src[? CHAR_VAR_HB7]
	);
}

global.grd_party_player[# 0,0] = _temp;

scr_menuUI_clearPsElements();

//testing
if(DEBUG){
	global.set_volBgm = 0;
	global.heldGold = GCAP;
	global.map_flags[? FG_FREEPLAY] = true;
}