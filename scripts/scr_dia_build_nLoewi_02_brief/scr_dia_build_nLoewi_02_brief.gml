ds_grid_destroy(global.grd_dia);

global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Tear";
global.grd_dia[# DIA_TXT,SV_i] = "Congratulations, Loewi's guild hall was impressed by your performance, and is asking for your help again.";
global.grd_dia[# DIA_SCR,SV_i] = scr_dia_build_nLoewi_01_brief_img01;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "A small company of spies are reported to be on the next train out of North Loewi, and our client is requesting that you dispose of them.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Details are sparse, but the client has made it clear that allowing the targets to reach their destination is not an option.";
global.grd_dia[# DIA_SCR,SV_i] = scr_dia_build_nLoewi_02_brief_img02;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "It should be noted that you will have to manually identify each target, so do not waste any time in dealing with the spies once found.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "The Adventurer's Guild sees potential in you lot, but has their doubts entrusting a time-sensitive assignment to novices.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Show them your previous success was no fluke.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "";
global.grd_dia[# DIA_TXT,SV_i] = "Location: North Loewi\nTarget: Spies (x6)\nObjective: Eliminate all targets before time runs out";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_menu_briefConfirm;