var SV_area = global.lst_simAreas[| global.simArea];

global.map_flags[? SIM_FG_STATUS + SV_area] = ++global.simFloor;

global.heldGold += CS_SIMREWARD;

scr_menu_sim_leaveConfirm_yes();