ds_grid_destroy(global.grd_dia);

global.grd_dia = ds_grid_create(8,0);

var
SV_i = scr_dia_newStep(),
SV_map = scr_data_getMap(global.grd_missions,global.missionCurr);


global.grd_dia[# DIA_NAME,SV_i] = "Tear";
global.grd_dia[# DIA_TXT,SV_i] = "A Leosocial transport ship has been shot down, scattering its cargo over a mountain range in the Naiboros Tundra.";
global.grd_dia[# DIA_SCR,SV_i] = scr_dia_build_vWoods_01_brief_img01;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "The company has decided that it would be more cost effective to send a new shipment rather than recover what has been lost due to the precarious location of the crash.";
global.grd_dia[# DIA_SCR,SV_i] = scr_dia_build_vWoods_01_brief_img02;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "However, they have stated that the cargo contains alchemy supplies that could cause serious issues if tampered with by the wildlife or locals.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "While the cargo containers are deemed ultimately harmless if destroyed, they also automatically deploy floating mines when a crash is detected as an anti-theft measure.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "In addition, Wolfeants are known to roam the area - these beasts have hides that are much more resilient than what you may have faced before.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Wide-range attacks and healing capability are highly reccomended for this mission, be sure to equip yourselves appropriately.\nGood luck.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "";
global.grd_dia[# DIA_TXT,SV_i] =
"Location: " + SV_map[? MSN_VAR_DESC_LOC] +
"\nTarget: " + SV_map[? MSN_VAR_DESC_TGT] +
"\nObjective: " + SV_map[? MSN_VAR_DESC_OBJ];

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_menu_briefConfirm;