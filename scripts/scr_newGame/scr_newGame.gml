scr_init();

global.missionCurr = MSN_0;

with obj_handler_menuUI{
    scr_runTimeline(tl_menuUI_loadDungeon);
}