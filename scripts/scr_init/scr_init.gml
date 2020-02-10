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
	    "map_chars",
	    "map_bgCol",
	    "map_wiki"
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
	    "grd_controls",
	    "grd_newFormation"
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
	    "lst_simAreas",
	    "lst_listeners"
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
	
	for(var _i = 0;_i <= 5;_i++){
		global.map_flags[? FG_MP + string(_i)] = 0;
	}
	
	//character unlock status
	global.map_flags[? CHAR_IMOLEI] = true;
	global.map_flags[? CHAR_AILE] = true;
	global.map_flags[? CHAR_PAPRIKA] = true;
	//global.map_flags[? CHAR_BLAZE] = false;
	//global.map_flags[? CHAR_ARI] = false;
	//global.map_flags[? CHAR_JACK] = true;
	
	//bg colors, used for dialogue lighting
	global.map_bgCol[? bg_city] = make_color_hsv(0,0,255);
	global.map_bgCol[? bg_forest] = make_color_hsv(0,0,255);
	global.map_bgCol[? bg_lab] = make_color_hsv(150,20,255);
	global.map_bgCol[? bg_mission] = make_color_hsv(150,50,255);
	global.map_bgCol[? bg_shop] = make_color_hsv(30,30,255);
	global.map_bgCol[? bg_social] = make_color_hsv(0,0,255);
	global.map_bgCol[? bg_subway] = make_color_hsv(0,0,255);
	global.map_bgCol[? bg_tundra] = make_color_hsv(0,0,255);
	global.map_bgCol[? bg_underground] = make_color_hsv(0,0,255);
	
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
	scr_init_wiki();
	
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
	global.missionJson = -1;
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

	global.grd_controls = ds_grid_create(en_ic_key.JOY_ALT,4);
	
	global.grd_controls[# en_ic_key.up,0] = vk_up;
	//global.grd_controls[# en_ic_key.up,1] = vk_up;
	global.grd_controls[# en_ic_key.up,2] = "UP";
	global.grd_controls[# en_ic_key.up,3] = "Menu navigation; top act bar slot; target center enemy. (Must be unique)";
	
	global.grd_controls[# en_ic_key.right,0] = vk_right;
	//global.grd_controls[# en_ic_key.right,1] = vk_up;
	global.grd_controls[# en_ic_key.right,2] = "RIGHT";
	global.grd_controls[# en_ic_key.right,3] = "Menu navigation; top act bar slot; target center enemy. (Must be unique)";
	
	global.grd_controls[# en_ic_key.down,0] = vk_down;
	//global.grd_controls[# en_ic_key.down,1] = vk_up;
	global.grd_controls[# en_ic_key.down,2] = "DOWN";
	global.grd_controls[# en_ic_key.down,3] = "Menu navigation; bottom act bar slot; target center enemy. (Must be unique)";
	
	global.grd_controls[# en_ic_key.left,0] = vk_left;
	//global.grd_controls[# en_ic_key.left,1] = vk_up;
	global.grd_controls[# en_ic_key.left,2] = "LEFT";
	global.grd_controls[# en_ic_key.left,3] = "Menu navigation; left act bar slot; target center enemy. (Must be unique)";
	
	global.grd_controls[# en_ic_key.party1,0] = ord("Z");
	//global.grd_controls[# en_ic_key.party1,1] = vk_up;
	global.grd_controls[# en_ic_key.party1,2] = "PARTY:1";
	global.grd_controls[# en_ic_key.party1,3] = "Select party member 1. (Can overlap with MENU controls)";
	
	global.grd_controls[# en_ic_key.party2,0] = ord("X");
	//global.grd_controls[# en_ic_key.party2,1] = vk_up;
	global.grd_controls[# en_ic_key.party2,2] = "PARTY:2";
	global.grd_controls[# en_ic_key.party2,3] = "Select party member 2. (Can overlap with MENU controls)";
	
	global.grd_controls[# en_ic_key.party3,0] = ord("C");
	//global.grd_controls[# en_ic_key.party3,1] = vk_up;
	global.grd_controls[# en_ic_key.party3,2] = "PARTY:3";
	global.grd_controls[# en_ic_key.party3,3] = "Select party member 3. (Can overlap with MENU controls)";
	
	global.grd_controls[# en_ic_key.partyShift,0] = vk_shift;
	//global.grd_controls[# en_ic_key.partyShift,1] = vk_up;
	global.grd_controls[# en_ic_key.partyShift,2] = "PARTY:SHIFT";
	global.grd_controls[# en_ic_key.partyShift,3] = "Switch to Shift slots on act bar. (Can overlap with MENU controls)";
	
	global.grd_controls[# en_ic_key.partySwap,0] = vk_space;
	//global.grd_controls[# en_ic_key.partySwap,1] = vk_space;
	global.grd_controls[# en_ic_key.partySwap,2] = "PARTY:SWAP";
	global.grd_controls[# en_ic_key.partySwap,3] = "Switch Vanguard/Reserve members. (Can overlap with MENU controls)";
	
	global.grd_controls[# en_ic_key.menuAccept,0] = ord("Z");
	//global.grd_controls[# en_ic_key.menuAccept,1] = vk_up;
	global.grd_controls[# en_ic_key.menuAccept,2] = "MENU:ACCEPT";
	global.grd_controls[# en_ic_key.menuAccept,3] = "Confirm/accept. (Can overlap with PARTY controls)";
	
	global.grd_controls[# en_ic_key.menuBack,0] = ord("X");
	//global.grd_controls[# en_ic_key.menuBack,1] = vk_up;
	global.grd_controls[# en_ic_key.menuBack,2] = "MENU:BACK";
	global.grd_controls[# en_ic_key.menuBack,3] = "Cancel/return. (Can overlap with PARTY controls)";
	
	global.grd_controls[# en_ic_key.menuExtra,0] = ord("C");
	//global.grd_controls[# en_ic_key.menuExtra,1] = vk_up;
	global.grd_controls[# en_ic_key.menuExtra,2] = "MENU:EXTRA";
	global.grd_controls[# en_ic_key.menuExtra,3] = "Context menu controls; party menu. (Can overlap with PARTY controls)";
	
	global.grd_controls[# en_ic_key.menuPage,0] = vk_shift;
	//global.grd_controls[# en_ic_key.menuPage,1] = vk_up;
	global.grd_controls[# en_ic_key.menuPage,2] = "MENU:PAGE";
	global.grd_controls[# en_ic_key.menuPage,3] = "TBA. (Can overlap with PARTY controls)";
	
	global.grd_controls[# en_ic_key.pause,0] = vk_backspace;
	//global.grd_controls[# en_ic_key.pause,1] = vk_up;
	global.grd_controls[# en_ic_key.pause,2] = "PAUSE";
	global.grd_controls[# en_ic_key.pause,3] = "Pause during combat; party menu. (Must be unique)";
	
	global.sfc_temp = surface_create(1,1);
	global.sfc_map = noone;
	global.sfc_minimap = noone;
	global.sfc_glitch = noone;
	global.buff_temp = buffer_create(1,buffer_fixed,1);
	
	global.stk_menu = ds_stack_create();
	global.stk_menuDia = ds_stack_create();
	global.stk_menuAlert = ds_stack_create();
	global.stk_newQuests = ds_stack_create();

#endregion

#region //settings
	
	//game
	global.set_txtSpeed = 6;
	global.set_atbSpeed = 80;
	global.set_atbMod = 20;
	global.set_altDownTgt = false; //when true, down targets middle enemy instead of untargetting
	
	//audio
	global.set_volBgm = 50;
	global.set_volSfx = 50;
	
	//graphics
	global.set_winTrans = 98;
	global.set_mmSize = 30;
	global.set_mapZoom = false;
	global.set_shaders = true;
	global.set_lightEffect = 0.5;
	
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
		
		scr_cEvent_id(id,EVENT_CLASS_SKILLREFRESH);
	}
	
	scr_cEvent_id(id,EVENT_BATTLM_INIT);
	
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
	//global.set_volBgm = 0;
	global.heldGold = GCAP;
	global.map_flags[? FG_FREEPLAY] = true;
}

scr_loadSetting();