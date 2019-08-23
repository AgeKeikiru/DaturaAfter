///@arg questID

var
SV_id = argument0,
SV_map = scr_data_getMap(global.grd_quests,SV_id);

if(!global.map_flags[? FG_TUT_QUEST]){
    global.map_flags[? FG_TUT_QUEST] = true;
    ds_stack_push(global.stk_menuAlert,scr_alert_questTut);
}

for(var SV_i = 0;SV_i < ds_list_size(SV_map[? Q_VAR_GOALS]);SV_i++){
    global.map_flags[? SV_id + string(SV_i)] = 0;
}

global.map_flags[? Q_FG_STATUS + SV_id] = 1;

instance_create_depth(0,0,0,SV_map[? Q_VAR_HANDLER]);

ds_stack_push(global.stk_newQuests,SV_map);
ds_stack_push(global.stk_menuAlert,scr_alert_newQuest);