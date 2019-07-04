ds_grid_destroy(global.grd_missions);
global.grd_missions = ds_grid_create(2,1);

var SV_map;

#region

	SV_map = scr_data_mission_new(MSN_DEBUG);
	SV_map[? MSN_VAR_INTRO_DIA] = noone;
	SV_map[? MSN_VAR_OUTRO_DIA] = noone;
	SV_map[? MSN_VAR_DESC_SCR] = scr_dia_build_nLoewi_01_brief;
	SV_map[? MSN_VAR_MAP_SPR] = spr_map_nLoewi_01;
	SV_map[? MSN_VAR_HANDLER] = obj_handler_mission_parent;
	/*
	debug mission for battle testing
	*/
	
	SV_map = scr_data_mission_new(MSN_NLOEWI_01);
	SV_map[? MSN_VAR_NAME] = "Eliminate Invasive Pest";
	SV_map[? MSN_VAR_CLIENT] = "AG Loewi";
	SV_map[? MSN_VAR_REWARD] = 2000;
	SV_map[? MSN_VAR_OPNAME] = "Sitting Duck";
	SV_map[? MSN_VAR_OPFOR] = "Wildlife";
	SV_map[? MSN_VAR_ESR] = "75%";
	SV_map[? MSN_VAR_DESC_LOC] = "North Loewi";
	SV_map[? MSN_VAR_DESC_TGT] = "Paraslime (x7)";
	SV_map[? MSN_VAR_DESC_OBJ] = "Eliminate all targets";
	SV_map[? MSN_VAR_INTRO_DIA] = scr_dia_build_nLoewi_01_cut01;
	SV_map[? MSN_VAR_OUTRO_DIA] = scr_dia_build_nLoewi_01_cut04;
	SV_map[? MSN_VAR_DESC_SCR] = scr_dia_build_nLoewi_01_brief;
	SV_map[? MSN_VAR_MAP_SPR] = spr_map_nLoewi_01;
	SV_map[? MSN_VAR_HANDLER] = obj_handler_mission_nLoewi_01;
	
	SV_map[? MSN_VAR_PAR_TIME_S] = ((2 * 60) + 40) * room_speed;
	SV_map[? MSN_VAR_PAR_TIME_C] = ((5 * 60) + 0) * room_speed;
	SV_map[? MSN_VAR_PAR_DMG_S] = 20000;
	SV_map[? MSN_VAR_PAR_DMG_C] = 5000;
	
	SV_map[? MSN_VAR_LOOT_GOLDMIN] = 10;
	SV_map[? MSN_VAR_LOOT_GOLDMAX] = 20;
	SV_map[? MSN_VAR_LOOT_RANKMIN] = 0;
	SV_map[? MSN_VAR_LOOT_RANKMAX] = 0;
	/*
	Alright you lot, proceed to Northern Loewi's railway hub. A foreign breed of Slime has been reported in the area, likely smuggled in from a neighboring region.
	With mutations to counter any possible natural predators, these augmented Slimes will destroy the ecosystem in a matter of days if left undealt with.
	The objective is simple: eliminate all mutated Slimes. The Adventurer's Guild thinks this is a good way to prove your worth, so try to make a good first impression out there.
	They may just be slimes, but anything can happen in the field. This request should pose little difficulty, as long as you keep your guard up.
	Good luck.

	--1 event tile in each corner area of map (triggers battle with 1 paraslime)
	--after the last tile is cleared, the party is ambushed (triggers battle with 3 paraslime)
	*/
	
	
	SV_map = scr_data_mission_new(MSN_NLOEWI_02);
	SV_map[? MSN_VAR_NAME] = "Railway Spy Hunt";
	SV_map[? MSN_VAR_CLIENT] = "AG Loewi";
	SV_map[? MSN_VAR_REWARD] = 2700;
	SV_map[? MSN_VAR_DESC_LOC] = "North Loewi";
	SV_map[? MSN_VAR_DESC_TGT] = "Spy (x8)";
	SV_map[? MSN_VAR_DESC_OBJ] = "Eliminate all targets within the time limit";
	SV_map[? MSN_VAR_INTRO_DIA] = scr_dia_build_nLoewi_01_cut01;
	SV_map[? MSN_VAR_DESC_SCR] = scr_dia_build_nLoewi_01_brief;
	SV_map[? MSN_VAR_MAP_SPR] = spr_map_nLoewi_01;
	SV_map[? MSN_VAR_HANDLER] = obj_handler_mission_nLoewi_01;
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
	
	
	SV_map = scr_data_mission_new(MSN_VWOODS_01);
	SV_map[? MSN_VAR_NAME] = "Defend the Town Center";
	SV_map[? MSN_VAR_CLIENT] = "AG Venus";
	SV_map[? MSN_VAR_REWARD] = 1800;
	SV_map[? MSN_VAR_DESC_LOC] = "Venus Woods";
	SV_map[? MSN_VAR_DESC_TGT] = "Bleeding Bullet (x8)";
	SV_map[? MSN_VAR_DESC_OBJ] = "Eliminate all targets within the time limit";
	SV_map[? MSN_VAR_INTRO_DIA] = scr_dia_build_nLoewi_01_cut01;
	SV_map[? MSN_VAR_DESC_SCR] = scr_dia_build_nLoewi_01_brief;
	SV_map[? MSN_VAR_MAP_SPR] = spr_map_nLoewi_01;
	SV_map[? MSN_VAR_HANDLER] = obj_handler_mission_nLoewi_01;
	/*
	defend the tree its culture important
	
	--1 event tile on the path to the clearing (triggers battle with 2 bleedingBullet)
	--an event tile on the left and right side of the clearing (each triggers battle with 2 bleedingBullet)
	--1 event tile directly in front of the tree (triggers battle with 3 candywing, 2 bleedingBullet)
	*/
	
	
	SV_map = scr_data_mission_new(MSN_VCANAL_01);
	SV_map[? MSN_VAR_NAME] = "Defend the Control Center";
	SV_map[? MSN_VAR_CLIENT] = "AG Venus";
	SV_map[? MSN_VAR_REWARD] = 3200;
	SV_map[? MSN_VAR_DESC_LOC] = "Venus Canal";
	SV_map[? MSN_VAR_DESC_TGT] = "Unknown";
	SV_map[? MSN_VAR_DESC_OBJ] = "Eliminate all targets";
	SV_map[? MSN_VAR_INTRO_DIA] = scr_dia_build_nLoewi_01_cut01;
	SV_map[? MSN_VAR_DESC_SCR] = scr_dia_build_nLoewi_01_brief;
	SV_map[? MSN_VAR_MAP_SPR] = spr_map_nLoewi_01;
	SV_map[? MSN_VAR_HANDLER] = obj_handler_mission_nLoewi_01;
	/*
	evil summoner wants to take over control room sending enemy force, be wary of the canal's poor visibility
	
	--after interacting with the event tile, the enemy force appears (triggers battle with 6 candywing, 3 slime, 3 paraslime)
	--low visibility affects map tile reveal radius and accuracy in battle
	*/
	
	
	SV_map = scr_data_mission_new(MSN_NABTUNDRA_01);
	SV_map[? MSN_VAR_NAME] = "Landbaron Griefing";
	SV_map[? MSN_VAR_CLIENT] = "Anonymous";
	SV_map[? MSN_VAR_REWARD] = 3800;
	SV_map[? MSN_VAR_DESC_LOC] = "Naiboros Tundra";
	SV_map[? MSN_VAR_DESC_TGT] = "User [Adelwing_X9]";
	SV_map[? MSN_VAR_DESC_OBJ] = "Deal sufficient damage to target and property";
	SV_map[? MSN_VAR_INTRO_DIA] = scr_dia_build_nLoewi_01_cut01;
	SV_map[? MSN_VAR_DESC_SCR] = scr_dia_build_nLoewi_01_brief;
	SV_map[? MSN_VAR_MAP_SPR] = spr_map_nLoewi_01;
	SV_map[? MSN_VAR_HANDLER] = obj_handler_mission_nLoewi_01;
	/*
	client complaining about landbaron, destroy their property and KO target
	
	--starting area has 3 bridges leading to different areas, bottom 2 are dead ends with treasure
	--9 event tiles spread over the top area, interact to destroy and loot
	--1 event tile at the end of the top area (triggers battle with target)
	*/

#endregion

ds_grid_resize(global.grd_missions,ds_grid_width(global.grd_missions),ds_grid_height(global.grd_missions) + -1);