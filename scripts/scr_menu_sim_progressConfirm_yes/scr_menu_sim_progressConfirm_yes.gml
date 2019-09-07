var SV_area = global.lst_simAreas[| global.simArea];

global.map_flags[? SIM_FG_STATUS + SV_area] = ++global.simFloor;

with obj_handler_menuUI{
    scr_runTimeline(tl_menuUI_loadDungeon);
}