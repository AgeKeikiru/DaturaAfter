var
SV_m = ds_stack_top(global.stk_menu),
SV_map = SV_m.grd_equipSrc[# SV_m.menu_x,SV_m.menu_y],
SV_id = SV_map[? Q_VAR_ID],
SV_obj = SV_map[? Q_VAR_HANDLER];

global.map_flags[? Q_FG_STATUS + SV_id] = 3;
scr_refreshQuestList();

with obj_handler_menuUI{
    questDesc = "";
}

scr_cEvent_id(SV_obj,EVENT_QUEST_REWARD);
instance_destroy(SV_obj);