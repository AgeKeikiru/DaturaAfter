///@arg missionID
///@arg *missionGoals

var
SV_r = ds_map_create(),
SV_id = argument[0];

//general
SV_r[? Q_VAR_ID] = SV_id;
SV_r[? Q_VAR_NAME] = "???";
SV_r[? Q_VAR_DESC] = "Looks like something is amiss.";
SV_r[? Q_VAR_HANDLER] = noone;
SV_r[? Q_VAR_GOALS] = ds_list_create();

for(var SV_i = 1;SV_i < argument_count;SV_i++){
    global.map_flags[? SV_id + string(SV_i + -1)] = 0;
    ds_list_add(SV_r[? Q_VAR_GOALS],argument[SV_i]);
}

global.map_flags[? Q_FG_STATUS + SV_id] = DEBUG;

var SV_h = ds_grid_height(global.grd_quests);
ds_grid_resize(global.grd_quests,2,SV_h + 1);
global.grd_quests[# 0,SV_h + -1] = SV_id;
global.grd_quests[# 1,SV_h + -1] = SV_r;

return SV_r;