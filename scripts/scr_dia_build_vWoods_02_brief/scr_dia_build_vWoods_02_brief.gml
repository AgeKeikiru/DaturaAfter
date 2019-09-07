ds_grid_destroy(global.grd_dia);

global.grd_dia = ds_grid_create(8,0);

var
SV_i = scr_dia_newStep(),
SV_map = scr_data_getMap(global.grd_missions,global.missionCurr);


global.grd_dia[# DIA_NAME,SV_i] = "Tear";
global.grd_dia[# DIA_TXT,SV_i] = "This is a special request from AG Venus.";
global.grd_dia[# DIA_SCR,SV_i] = scr_dia_build_vWoods_01_brief_img01;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "New adventurers must prove their worth before being officially registered with the Adventurer Guilds.";
global.grd_dia[# DIA_SCR,SV_i] = scr_dia_build_vWoods_01_brief_img02;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "This is often done by means of a low-risk mission, but when no such tasks are currently available, a standardized aptitude test is conducted to keep the process timely.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Should you accept, your job will be to escort the examinee through a path in the Venus Woods.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "You will assist them when dealing with excessively large groups of enemies, however remember they need the opportunity to display their combat abilities.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Experienced adventurers are chosen at random to proctor these examinations, so consider it an expression of recognition from AG Venus to offer you lot this chance. That said, do not feel obligated to accept.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "There is no shortage of candidates for proctor positions, and the reward - while given in addition to the Guild's favor - is subpar compared to what you can earn at your level.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "";
global.grd_dia[# DIA_TXT,SV_i] =
"Location: " + SV_map[? MSN_VAR_DESC_LOC] +
"\nTarget: " + SV_map[? MSN_VAR_DESC_TGT] +
"\nObjective: " + SV_map[? MSN_VAR_DESC_OBJ];

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_menu_briefConfirm;