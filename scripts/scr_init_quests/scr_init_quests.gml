ds_grid_destroy(global.grd_quests);
global.grd_quests = ds_grid_create(2,1);

var SV_map;

SV_map = scr_data_quest_new(Q_TEST,1);
SV_map[? Q_VAR_NAME] = "A Quick Test";

SV_map[? Q_VAR_DESC] =
"Clearing a single mission should be enough to convince Ari to join your group." +
"\n\n" +
"Mission Clears: @0" +
"\n\n" +
"Reward: Player [Ari]";

SV_map[? Q_VAR_HANDLER] = obj_handler_quest_test;

ds_grid_resize(global.grd_quests,ds_grid_width(global.grd_quests),ds_grid_height(global.grd_quests) + -1);