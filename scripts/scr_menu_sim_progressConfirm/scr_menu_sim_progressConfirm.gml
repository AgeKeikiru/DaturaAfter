global.simFloor++; //temporary raise to display correct reward

var
SV_rew = string(CS_SIMREWARD),
SV_str =
    "Completion Bonus: " + SV_rew + "g" +
    "\n" +
    "\nProgress to next zone? Reward will NOT be collected if you progress and then end session from zone start point!",
SV_m = scr_menu_confirmWindow("message/confirm/..",SV_str,scr_menu_sim_progressConfirm_yes,scr_menu_sim_progressConfirm_no);

global.simFloor--;

SV_m.back_function = scr_menu_backNoRefresh;
SV_m.grd_txt[# 0,0] = "Next Zone";
SV_m.grd_txt[# 1,0] = "End Session";
SV_m.btn_w = 300;

SV_m.x += -SV_m.btn_w / 2;