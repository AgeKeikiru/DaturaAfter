ds_grid_destroy(global.grd_dia);

global.grd_dia = ds_grid_create(8,0);

var
SV_i = scr_dia_newStep(),
SV_map = scr_data_getMap(global.grd_missions,global.missionCurr);


global.grd_dia[# DIA_NAME,SV_i] = "Tear";
global.grd_dia[# DIA_TXT,SV_i] = "AG Venus has received word of your performance in the underground canal from Layered, and is requesting that you lot venture through those tunnels again.";
global.grd_dia[# DIA_SCR,SV_i] = scr_dia_build_vCanal_01_brief_img01;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Following the last incident there, Layered performed an investigation of the attack, and warned that the source of the monsters was not found and that another attack could be imminent.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "To prepare for the worst, the canal has been renovated and automatic defense measures have been installed throughout - primarily drones and turrets.";
global.grd_dia[# DIA_SCR,SV_i] = scr_dia_build_vCanal_02_brief_img02;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Your role in this preparation is to test the installed defenses. Given you were able to repel the invasion, being able to best your group serves as a satisfactory benchmark for the defenses' combat ability.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Since you are only familiar with a small portion of the canal, your goal is to take the same path from the northwest entrance to the control center.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "The installations are designed to be easily replaceable, so feel free to destroy anything in your path.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "To ensure that you do not pull any punches, AG Venus has stated that you will only be paid if you complete this task.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "This should be a simple task for you, however note that the renovation has not improved the lighting. Fight carefully, and good luck.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "";
global.grd_dia[# DIA_TXT,SV_i] =
"Location: " + SV_map[? MSN_VAR_DESC_LOC] +
"\nTarget: " + SV_map[? MSN_VAR_DESC_TGT] +
"\nObjective: " + SV_map[? MSN_VAR_DESC_OBJ];

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_menu_briefConfirm;