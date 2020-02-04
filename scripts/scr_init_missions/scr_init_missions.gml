ds_grid_destroy(global.grd_missions);
global.grd_missions = ds_grid_create(2,1);

var SV_map;

#region //debug

	SV_map = scr_data_mission_new(MSN_DEBUG);
	SV_map[? MSN_VAR_INTRO_DIA] = noone;
	SV_map[? MSN_VAR_OUTRO_DIA] = noone;
	SV_map[? MSN_VAR_DESC_SCR] = scr_dia_build_nLoewi_01_brief;
	SV_map[? MSN_VAR_MAP_SPR] = spr_map_nLoewi_01;
	SV_map[? MSN_VAR_HANDLER] = obj_handler_mission_parent;
	/*
	debug mission for battle testing
	*/
	
#endregion

#region //sim
	
	SV_map = scr_data_mission_new(MSN_SIM);
	SV_map[? MSN_VAR_CLIENT] = "n/a";
	SV_map[? MSN_VAR_OPNAME] = "Benchmark";
	SV_map[? MSN_VAR_FAIL_DIA] = scr_dia_build_simFailed;
	SV_map[? MSN_VAR_HANDLER] = obj_handler_mission_sim;
	/*
	prologue
	*/
	
#endregion

#region //msn0
	
	SV_map = scr_data_mission_new(MSN_0);
	SV_map[? MSN_VAR_NAME] = "Fated Encounter";
	SV_map[? MSN_VAR_CLIENT] = "???";
	SV_map[? MSN_VAR_REWARD] = 0;
	SV_map[? MSN_VAR_OPNAME] = "Warm Welcome";
	SV_map[? MSN_VAR_OPFOR] = "???";
	SV_map[? MSN_VAR_ESR] = "0%";
	SV_map[? MSN_VAR_DESC_LOC] = "PI Space";
	SV_map[? MSN_VAR_DESC_TGT] = "???";
	SV_map[? MSN_VAR_DESC_OBJ] = "Eliminate all targets";
	SV_map[? MSN_VAR_INTRO_DIA] = scr_dia_build_msn0_intro;
	SV_map[? MSN_VAR_OUTRO_DIA] = scr_dia_build_msn0_outro;
	//SV_map[? MSN_VAR_DESC_SCR] = scr_dia_build_nLoewi_01_brief;
	SV_map[? MSN_VAR_MAP_SPR] = spr_map_nLoewi_01;
	SV_map[? MSN_VAR_HANDLER] = obj_handler_mission_msn0;
	SV_map[? MSN_VAR_BGM] = "rival";
	/*
	prologue
	*/
	
#endregion

#region //nLoewi

	SV_map = scr_data_mission_new(MSN_NLOEWI_01,"msn_nLoewi_01");
	scr_unlockMission(MSN_NLOEWI_01);
		
	#region //nLoewi_02
		
		SV_map = scr_data_mission_new(MSN_NLOEWI_02);
		SV_map[? MSN_VAR_NAME] = "Railway Spy Hunt";
		SV_map[? MSN_VAR_CLIENT] = "AG Loewi";
		SV_map[? MSN_VAR_REWARD] = 2700;
		SV_map[? MSN_VAR_OPNAME] = "Wild Weasel";
		SV_map[? MSN_VAR_OPFOR] = "Saboteurs";
		SV_map[? MSN_VAR_ESR] = "74%";
		SV_map[? MSN_VAR_DESC_LOC] = "North Loewi";
		SV_map[? MSN_VAR_DESC_TGT] = "Spy (x6)";
		SV_map[? MSN_VAR_DESC_OBJ] = "Eliminate all targets within the time limit";
		SV_map[? MSN_VAR_INTRO_DIA] = scr_dia_build_nLoewi_02_intro;
		SV_map[? MSN_VAR_OUTRO_DIA] = scr_dia_build_nLoewi_02_outro;
		SV_map[? MSN_VAR_DESC_SCR] = scr_dia_build_nLoewi_02_brief;
		SV_map[? MSN_VAR_MAP_SPR] = spr_map_nLoewi_02;
		SV_map[? MSN_VAR_HANDLER] = obj_handler_mission_nLoewi_02;
		SV_map[? MSN_VAR_BGM] = "subway";
		
		SV_map[? MSN_VAR_PAR_TIME_S] = ((3 * 60) + 0) * room_speed;
		SV_map[? MSN_VAR_PAR_TIME_C] = ((5 * 60) + 0) * room_speed;
		SV_map[? MSN_VAR_PAR_DMG_S] = 42000;
		SV_map[? MSN_VAR_PAR_DMG_C] = 25000;
		
		if(DEBUG){
			SV_map[? MSN_VAR_PAR_TIME_S] = room_speed * 10;
			SV_map[? MSN_VAR_PAR_TIME_C] = SV_map[? MSN_VAR_PAR_TIME_S];
		}
		
		SV_map[? MSN_VAR_LOOT_GOLDMIN] = 20;
		SV_map[? MSN_VAR_LOOT_GOLDMAX] = 50;
		SV_map[? MSN_VAR_LOOT_RANKMIN] = 0;
		SV_map[? MSN_VAR_LOOT_RANKMAX] = 2;
		/*
		Congratulations, Loewi's guild hall was impressed by your performance, and is asking for your help again.
		A small company of spies are reported to be on the next train out of North Loewi, and our client is requesting that you dispose of them.
		Details are sparse, but the client has made it clear that allowing the targets to reach their destination is not an option.
		It should be noted that you will have to manually identify each target, so do not waste any time in dealing with the spies once found.
		The Adventurer's Guild sees potential in you lot, but has their doubts entrusting a time-sensitive assignment to novices.
		Show them your previous success was no fluke.
	
		--4 train cars, each containing several event tiles, but only one in each car is the target (triggers battle with 2 genericNPC)
		--once the car's target is defeated, the entrence tile to the next car will spawn
		*/
	
	#endregion

#endregion

#region //cLoewi

	SV_map = scr_data_mission_new(MSN_CLOEWI_01,"msn_cLoewi_01");

#endregion

#region //vWoods

	#region //vWoods_01 (old zam)
		
		SV_map = scr_data_mission_new(MSN_VWOODS_01);
		SV_map[? MSN_VAR_NAME] = "Defend the Town Center";
		SV_map[? MSN_VAR_CLIENT] = "AG Venus";
		SV_map[? MSN_VAR_REWARD] = 1800;
		SV_map[? MSN_VAR_OPNAME] = "Full House";
		SV_map[? MSN_VAR_OPFOR] = "Wildlife";
		SV_map[? MSN_VAR_ESR] = "75%";
		SV_map[? MSN_VAR_DESC_LOC] = "Venus Woods";
		SV_map[? MSN_VAR_DESC_TGT] = "Bleeding Bullet (x8)";
		SV_map[? MSN_VAR_DESC_OBJ] = "Eliminate all targets";
		SV_map[? MSN_VAR_INTRO_DIA] = scr_dia_build_vWoods_01_cut01;
		SV_map[? MSN_VAR_OUTRO_DIA] = scr_dia_build_vWoods_01_cut03;
		SV_map[? MSN_VAR_DESC_SCR] = scr_dia_build_vWoods_01_brief;
		SV_map[? MSN_VAR_MAP_SPR] = spr_map_vWoods_01;
		SV_map[? MSN_VAR_HANDLER] = obj_handler_mission_vWoods_01;
		SV_map[? MSN_VAR_BGM] = "forest";
		
		SV_map[? MSN_VAR_PAR_TIME_S] = ((6 * 60) + 0) * room_speed;
		SV_map[? MSN_VAR_PAR_TIME_C] = ((10 * 60) + 0) * room_speed;
		SV_map[? MSN_VAR_PAR_DMG_S] = 45000;
		SV_map[? MSN_VAR_PAR_DMG_C] = 20000;
		
		SV_map[? MSN_VAR_LOOT_GOLDMIN] = 10;
		SV_map[? MSN_VAR_LOOT_GOLDMAX] = 20;
		SV_map[? MSN_VAR_LOOT_RANKMIN] = 0;
		SV_map[? MSN_VAR_LOOT_RANKMAX] = 0;
		/*
		A village near the outskirts of Venus City have issued a distress signal.
		Reports claim mysterious flowers have begun to bloom around their mature Awrig tree near the center of their village and any botanists sent to investigate fail to return.
		That Awrig is one of the last of its kind, and an integral cultural touchstone for Venus City - saving it will be sure to endow you lot in the Venus Guild Hall's good graces.
		That said, there's no time to waste, no one knows what effects those plants will have on the village, or how long until the situation takes a turn for the worst.
		Proceed immediately to the distress signal's location and guard the Awrig tree. Good luck.
		
		--1 event tile on the path to the clearing (triggers battle with 2 bleedingBullet)
		--an event tile on the left and right side of the clearing (each triggers battle with 2 bleedingBullet)
		--1 event tile directly in front of the tree (triggers battle with 3 candywing, 2 bleedingBullet)
		*/
	
	#endregion
	
	scr_data_mission_new(MSN_VWOODS_02,"msn_vWoods_02");
	scr_data_mission_new(MSN_VWOODS_03,"msn_vWoods_03");

#endregion

#region //vCanal

	#region //vCanal_01 (old gal)
		
		SV_map = scr_data_mission_new(MSN_VCANAL_01);
		SV_map[? MSN_VAR_NAME] = "Defend the Control Center";
		SV_map[? MSN_VAR_CLIENT] = "Layered";
		SV_map[? MSN_VAR_REWARD] = 3200;
		SV_map[? MSN_VAR_OPNAME] = "Flicker";
		SV_map[? MSN_VAR_OPFOR] = "Unknown";
		SV_map[? MSN_VAR_ESR] = "50%";
		SV_map[? MSN_VAR_DESC_LOC] = "Venus Canal";
		SV_map[? MSN_VAR_DESC_TGT] = "Layered Forces";
		SV_map[? MSN_VAR_DESC_OBJ] = "Rendezvous with target";
		SV_map[? MSN_VAR_INTRO_DIA] = scr_dia_build_vCanal_01_intro;
		SV_map[? MSN_VAR_OUTRO_DIA] = scr_dia_build_vCanal_01_outro;
		SV_map[? MSN_VAR_DESC_SCR] = scr_dia_build_vCanal_01_brief;
		SV_map[? MSN_VAR_MAP_SPR] = spr_map_vCanal_01;
		SV_map[? MSN_VAR_HANDLER] = obj_handler_mission_vCanal_01;
		SV_map[? MSN_VAR_BGM] = "subway";
		
		SV_map[? MSN_VAR_PAR_TIME_S] = ((6 * 60) + 0) * room_speed;
		SV_map[? MSN_VAR_PAR_TIME_C] = ((10 * 60) + 0) * room_speed;
		SV_map[? MSN_VAR_PAR_DMG_S] = 45000;
		SV_map[? MSN_VAR_PAR_DMG_C] = 20000;
		
		SV_map[? MSN_VAR_LOOT_GOLDMIN] = 10;
		SV_map[? MSN_VAR_LOOT_GOLDMAX] = 30;
		SV_map[? MSN_VAR_LOOT_RANKMIN] = 0;
		SV_map[? MSN_VAR_LOOT_RANKMAX] = 0;
		
		
		/*
		evil summoner wants to take over control room sending enemy force, be wary of the canal's poor visibility
		
		--after interacting with the event tile, the enemy force appears (triggers battle with 6 candywing, 3 slime, 3 paraslime)
		--low visibility affects map tile reveal radius and accuracy in battle
		*/
	
	#endregion
	
	#region //vCanal_02
		
		SV_map = scr_data_mission_new(MSN_VCANAL_02);
		SV_map[? MSN_VAR_NAME] = "Control Center Test Exercise";
		SV_map[? MSN_VAR_CLIENT] = "AG Venus";
		SV_map[? MSN_VAR_REWARD] = 3200;
		SV_map[? MSN_VAR_OPNAME] = "Pop Quiz";
		SV_map[? MSN_VAR_OPFOR] = "Defense System";
		SV_map[? MSN_VAR_ESR] = "60%";
		SV_map[? MSN_VAR_DESC_LOC] = "Venus Canal";
		SV_map[? MSN_VAR_DESC_TGT] = "N/A";
		SV_map[? MSN_VAR_DESC_OBJ] = "Reach control center";
		SV_map[? MSN_VAR_INTRO_DIA] = scr_dia_build_vCanal_02_intro;
		SV_map[? MSN_VAR_OUTRO_DIA] = scr_dia_build_vCanal_02_outro;
		SV_map[? MSN_VAR_FAIL_DIA] = scr_dia_build_vCanal_02_outro;
		SV_map[? MSN_VAR_DESC_SCR] = scr_dia_build_vCanal_02_brief;
		SV_map[? MSN_VAR_MAP_SPR] = spr_map_vCanal_01;
		SV_map[? MSN_VAR_HANDLER] = obj_handler_mission_vCanal_02;
		SV_map[? MSN_VAR_BGM] = "subway";
		
		SV_map[? MSN_VAR_PAR_TIME_S] = ((6 * 60) + 0) * room_speed;
		SV_map[? MSN_VAR_PAR_TIME_C] = ((10 * 60) + 0) * room_speed;
		SV_map[? MSN_VAR_PAR_DMG_S] = 45000;
		SV_map[? MSN_VAR_PAR_DMG_C] = 20000;
		
		SV_map[? MSN_VAR_LOOT_GOLDMIN] = 20;
		SV_map[? MSN_VAR_LOOT_GOLDMAX] = 50;
		SV_map[? MSN_VAR_LOOT_RANKMIN] = 0;
		SV_map[? MSN_VAR_LOOT_RANKMAX] = 3;
		
		
		/*
		evil summoner wants to take over control room sending enemy force, be wary of the canal's poor visibility
		
		--after interacting with the event tile, the enemy force appears (triggers battle with 6 candywing, 3 slime, 3 paraslime)
		--low visibility affects map tile reveal radius and accuracy in battle
		*/
	
	#endregion
	
	scr_data_mission_new(MSN_VCANAL_03,"msn_vCanal_03");

#endregion

#region //nTundra

	#region //nabTundra_01 (horwick)
		
		SV_map = scr_data_mission_new(MSN_NABTUNDRA_01);
		SV_map[? MSN_VAR_NAME] = "Destroy Lost Cargo";
		SV_map[? MSN_VAR_CLIENT] = "Leosocial";
		SV_map[? MSN_VAR_REWARD] = 3900;
		SV_map[? MSN_VAR_OPNAME] = "Meteorite";
		SV_map[? MSN_VAR_OPFOR] = "Wildlife";
		SV_map[? MSN_VAR_ESR] = "60%";
		SV_map[? MSN_VAR_DESC_LOC] = "Naiboros Tundra";
		SV_map[? MSN_VAR_DESC_TGT] = "Cargo Crate (x5)";
		SV_map[? MSN_VAR_DESC_OBJ] = "Destroy all targets";
		SV_map[? MSN_VAR_INTRO_DIA] = scr_dia_build_nTundra_01_intro;
		SV_map[? MSN_VAR_OUTRO_DIA] = scr_dia_build_nTundra_01_outro;
		SV_map[? MSN_VAR_DESC_SCR] = scr_dia_build_nTundra_01_brief;
		SV_map[? MSN_VAR_MAP_SPR] = spr_map_nTundra_01;
		SV_map[? MSN_VAR_HANDLER] = obj_handler_mission_nTundra_01;
		SV_map[? MSN_VAR_BGM] = "tundra";
		
		SV_map[? MSN_VAR_PAR_TIME_S] = ((5 * 60) + 20) * room_speed;
		SV_map[? MSN_VAR_PAR_TIME_C] = ((7 * 60) + 0) * room_speed;
		SV_map[? MSN_VAR_PAR_DMG_S] = 40000;
		SV_map[? MSN_VAR_PAR_DMG_C] = 20000;
		
		SV_map[? MSN_VAR_LOOT_GOLDMIN] = 10;
		SV_map[? MSN_VAR_LOOT_GOLDMAX] = 30;
		SV_map[? MSN_VAR_LOOT_RANKMIN] = 0;
		SV_map[? MSN_VAR_LOOT_RANKMAX] = 0;
		
		/*
		enemies: wolfeants, frostslimes, mines, cargo drops
		*/
	
	#endregion
	
	scr_data_mission_new(MSN_NABTUNDRA_02,"msn_nTundra_02");

#endregion

#region //zDesert
	
	scr_data_mission_new(MSN_ZDESERT_01,"msn_zDesert_01");

#endregion

#region //demoBoss
	
	SV_map = scr_data_mission_new(MSN_DEMOBOSS);
	SV_map[? MSN_VAR_NAME] = "Special Arena Appearance";
	SV_map[? MSN_VAR_CLIENT] = "AG International";
	SV_map[? MSN_VAR_REWARD] = 999999;
	SV_map[? MSN_VAR_OPNAME] = "Old Avalon";
	SV_map[? MSN_VAR_OPFOR] = "PvP";
	SV_map[? MSN_VAR_ESR] = "74%";
	SV_map[? MSN_VAR_DESC_LOC] = "AG-I Arena";
	SV_map[? MSN_VAR_DESC_TGT] = "PvP";
	SV_map[? MSN_VAR_DESC_OBJ] = "Eliminate all targets";
	SV_map[? MSN_VAR_INTRO_DIA] = scr_dia_build_demoBoss_intro;
	SV_map[? MSN_VAR_OUTRO_DIA] = scr_dia_build_demoBoss_outro;
	SV_map[? MSN_VAR_FAIL_DIA] = scr_dia_build_demoBoss_failed;
	SV_map[? MSN_VAR_DESC_SCR] = scr_dia_build_demoBoss_brief;
	SV_map[? MSN_VAR_MAP_SPR] = spr_map_nLoewi_01;
	SV_map[? MSN_VAR_HANDLER] = obj_handler_mission_demoBoss;
	SV_map[? MSN_VAR_BGM] = "rival";
	
	SV_map[? MSN_VAR_PAR_TIME_S] = ((4 * 60) + 30) * room_speed;
	SV_map[? MSN_VAR_PAR_TIME_C] = ((6 * 60) + 0) * room_speed;
	SV_map[? MSN_VAR_PAR_DMG_S] = 40000;
	SV_map[? MSN_VAR_PAR_DMG_C] = 20000;
	SV_map[? MSN_VAR_PAR_EXPL_S] = 1;
	SV_map[? MSN_VAR_PAR_EXPL_C] = 1;
	
	SV_map[? MSN_VAR_LOOT_GOLDMIN] = 10;
	SV_map[? MSN_VAR_LOOT_GOLDMAX] = 20;
	SV_map[? MSN_VAR_LOOT_RANKMIN] = 0;
	SV_map[? MSN_VAR_LOOT_RANKMAX] = 0;

#endregion

ds_grid_resize(global.grd_missions,ds_grid_width(global.grd_missions),ds_grid_height(global.grd_missions) + -1);