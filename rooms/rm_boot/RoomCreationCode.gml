
room_speed = 60;
window_set_size(1280,720);
window_center();

scr_init();

#region //testing

	global.set_volBgm = 0;
	
	audio_stop_all();
	//ds_list_add(global.lst_bgmStream,audio_create_stream("bgm_home.ogg"));
	//ds_list_add(global.lst_bgmStream,audio_create_stream("bgm_mission.ogg"));
	
	//scr_playBgm(global.lst_bgmStream[| 0],0);
	//scr_playBgm(global.lst_bgmStream[| 1],1);
	//audio_sound_gain(global.bgmTrack[1],0,0);
	
	global.heldGold = 20000;

	ds_list_add(global.lst_inv_classes,
		instance_create_depth(0,0,0,obj_handler_class_evoker),
		instance_create_depth(0,0,0,obj_handler_class_angel),
		instance_create_depth(0,0,0,obj_handler_class_chef),
		instance_create_depth(0,0,0,obj_handler_class_razer),
		instance_create_depth(0,0,0,obj_handler_class_idol)
	);
	
	with global.lst_inv_classes[| 3]{
		grd_skills[# 1,0] = 1;
		
		scr_cEvent(id,EVENT_CLASS_SKILLREFRESH);
	}
	
	//party slot 1
	var _temp = instance_create_depth(640 + -380,650,0,obj_dungeon_battleMember);
	_temp.src = scr_data_getMap(global.grd_chars,CHAR_IMOLEI);
	_temp.src[? CHAR_VAR_HB0] = scr_data_act_new(WTAG_TYPE_SWD);
	_temp.src[? CHAR_VAR_HB1] = scr_data_act_new(WTAG_TYPE_ASC_ARW,CHAR_VAR_ELE_ICE);
	//_temp.src[? CHAR_VAR_HB2] = instance_find(obj_handler_act_idol_hype,0);
	//_temp.src[? CHAR_VAR_HB3] = instance_find(obj_handler_act_idol_hPickup,0);
	//_temp.src[? CHAR_VAR_HB4] = instance_find(obj_handler_act_chef_food,1);
	//_temp.src[? CHAR_VAR_HB5] = instance_find(obj_handler_act_chef_food,2);
	//_temp.src[? CHAR_VAR_HB6] = instance_find(obj_handler_act_chef_food,5);
	//_temp.src[? CHAR_VAR_HB7] = instance_find(obj_handler_act_chef_tasteTest,0);
	_temp.src[? CHAR_VAR_CLS0] = global.lst_inv_classes[| 0];
	_temp.src[? CHAR_VAR_CLS0].src = _temp;
	global.grd_party_player[# 0,0] = _temp;
	
	with _temp.src[? CHAR_VAR_CLS0]{
		//ds_grid_set_region(grd_skills,0,0,3,2,2);
		
		grd_skills[# 0,0] = 3;
		grd_skills[# 1,0] = 5;
		
		scr_cEvent(id,EVENT_CLASS_SKILLREFRESH);
	}
	
	scr_cEvent(_temp,EVENT_BATTLM_INIT);
	
	ds_list_add(global.lst_inv_acts,
		_temp.src[? CHAR_VAR_HB0],
		_temp.src[? CHAR_VAR_HB1]
	);

	//party slot 2
	if(true){
		_temp = instance_create_depth(640,650,0,obj_dungeon_battleMember);
		_temp.src = scr_data_getMap(global.grd_chars,CHAR_AILE);
		_temp.src[? CHAR_VAR_HB0] = scr_data_act_new(WTAG_TYPE_HGN,CHAR_VAR_ELE_ELC);
		_temp.src[? CHAR_VAR_HB1] = scr_data_act_new(WTAG_TYPE_SSC_HEAL);
		//_temp.src[? CHAR_VAR_HB2] = instance_find(obj_handler_act_idol_hype,0);
		//_temp.src[? CHAR_VAR_HB3] = instance_find(obj_handler_act_idol_hPickup,0);
		//_temp.src[? CHAR_VAR_HB4] = instance_find(obj_handler_act_ange_aSmite,0);
		//_temp.src[? CHAR_VAR_HB5] = instance_find(obj_handler_act_chef_food,2);
		//_temp.src[? CHAR_VAR_HB6] = instance_find(obj_handler_act_chef_food,5);
		//_temp.src[? CHAR_VAR_HB7] = instance_find(obj_handler_act_chef_tasteTest,0);
		_temp.src[? CHAR_VAR_CLS0] = global.lst_inv_classes[| 1];
		_temp.src[? CHAR_VAR_CLS0].src = _temp;
		global.grd_party_player[# 1,0] = _temp;
		
		with _temp.src[? CHAR_VAR_CLS0]{
			//ds_grid_set_region(grd_skills,0,0,3,2,2);
			
			grd_skills[# 0,0] = 3;
			
			scr_cEvent(id,EVENT_CLASS_SKILLREFRESH);
		}
		
		scr_cEvent(_temp,EVENT_BATTLM_INIT);
		
		ds_list_add(global.lst_inv_acts,
			_temp.src[? CHAR_VAR_HB0],
			_temp.src[? CHAR_VAR_HB1]
		);
	}
	
	//party slot 3
	if(true){
		_temp = instance_create_depth(640 + 380,650,0,obj_dungeon_battleMember);
		_temp.src = scr_data_getMap(global.grd_chars,CHAR_PAPRIKA);
		_temp.src[? CHAR_VAR_HB0] = scr_data_act_new(WTAG_TYPE_PAN);
		_temp.src[? CHAR_VAR_HB1] = scr_data_act_new(WTAG_TYPE_SHD_FLS);
		//_temp.src[? CHAR_VAR_HB2] = instance_find(obj_handler_act_chef_messKit,0);
		//_temp.src[? CHAR_VAR_HB3] = instance_find(obj_handler_act_chef_food,0);
		//_temp.src[? CHAR_VAR_HB4] = instance_find(obj_handler_act_chef_food,1);
		//_temp.src[? CHAR_VAR_HB5] = instance_find(obj_handler_act_chef_food,2);
		//_temp.src[? CHAR_VAR_HB6] = instance_find(obj_handler_act_chef_food,5);
		//_temp.src[? CHAR_VAR_HB7] = instance_find(obj_handler_act_chef_food,3);
		_temp.src[? CHAR_VAR_CLS0] = global.lst_inv_classes[| 2];
		_temp.src[? CHAR_VAR_CLS0].src = _temp;
		global.grd_party_player[# 2,0] = _temp;
		
		with _temp.src[? CHAR_VAR_CLS0]{
			//ds_grid_set_region(grd_skills,0,0,3,2,2);
			
			grd_skills[# 0,0] = 3;
			
			scr_cEvent(id,EVENT_CLASS_SKILLREFRESH);
		}
		
		scr_cEvent(_temp,EVENT_BATTLM_INIT);
		
		ds_list_add(global.lst_inv_acts,
			_temp.src[? CHAR_VAR_HB0],
			_temp.src[? CHAR_VAR_HB1]
		);
	}
	
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

if(true){
	room_goto(rm_home);
}else{
	room_goto(rm_dungeon);
	scr_roomSetup();
	global.missionCurr = MSN_NLOEWI_01;
	
	//global.set_atbSpeed = .5;
	//global.set_atbMod = 0;
	
	instance_create_depth(0,0,0,obj_handler_dungeon);
	//instance_create_depth(0,0,0,obj_handler_menuUI);
	
	with obj_handler_menuUI{
		title = false;
	}
	
	//global.grd_party_player[# 1,0].ailment[CHAR_SA_SLW] = 9999;
	//global.grd_party_player[# 1,0].ailment[CHAR_SA_SLC] = 9999;
	//global.grd_party_player[# 1,0].ailment[CHAR_SA_BRN] = 9999;
	//global.grd_party_player[# 1,0].ailment[CHAR_SA_BLD] = 9999;
	//global.grd_party_player[# 1,0].ailment[CHAR_SA_PSN] = 9999;
	//global.grd_party_player[# 1,0].ailment[CHAR_SA_PAR] = 9999;
	
	scr_cEvent(obj_dungeon_battleMember,EVENT_BATTLM_ICONREFRESH);
	
	with obj_handler_dungeon{
		grd_mobPool[# 0,DH_MOB_ID1] = noone;
		grd_mobPool[# 0,DH_MOB_ID3] = noone;
		
	    grd_mobPool[# 0,DH_MOB_ID1] = CHAR_NPC_EVOKER;
	    grd_mobPool[# 0,DH_MOB_ID2] = CHAR_NPC_EVOKER;
	    //grd_mobPool[# 0,DH_MOB_ID3] = CHAR_SLIME;
	    
	    grd_mobPool[# 0,DH_MOB_PMIN] = 0;
		grd_mobPool[# 0,DH_MOB_PMAX] = 0;
		
		grd_mobPool[# 0,DH_MOB_LV1] = 0;
		grd_mobPool[# 0,DH_MOB_LV2] = 3;
		grd_mobPool[# 0,DH_MOB_LV3] = 0;
	}
	
	//ds_list_add(global.lst_missionLoot_queue,"test","test2","test3");
	
	//global.grd_party_player[# 0,0].iFrames = room_speed * 10;
	
	//scr_cEvent(obj_handler_dungeon,EVENT_DND_ENCOUNTER_FIXED);
}
/**/