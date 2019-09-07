global.missionCurr = MSN_SIM;

var
SV_map = scr_data_getMap(global.grd_missions,MSN_SIM),
SV_bg;

switch global.lst_simAreas[| global.simArea]{
    case SIM_TUNDRA: SV_bg = "tundra"; break;
    case SIM_TUNNELS: SV_bg = "subway"; break;
    default: SV_bg = "forest"; break;
}


SV_map[? MSN_VAR_BGM] = SV_bg;

with obj_handler_menuUI{
    scr_runTimeline(tl_menuUI_loadDungeon);
}