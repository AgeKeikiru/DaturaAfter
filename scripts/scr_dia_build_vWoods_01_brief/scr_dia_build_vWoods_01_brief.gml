ds_grid_destroy(global.grd_dia);

global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Tear";
global.grd_dia[# DIA_TXT,SV_i] = "A village near the outskirts of Venus City have issued a distress signal.";
global.grd_dia[# DIA_SCR,SV_i] = scr_dia_build_vWoods_01_brief_img01;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Reports claim mysterious flowers have begun to bloom around their mature Awrig tree near the center of their village and any botanists sent to investigate fail to return.";
global.grd_dia[# DIA_SCR,SV_i] = scr_dia_build_vWoods_01_brief_img02;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "That Awrig is one of the last of its kind, and an integral cultural touchstone for Venus City - saving it will be sure to endow you lot in AG Venus' good graces.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "That said, there's no time to waste, no one knows what effects those plants will have on the village, or how long until the situation takes a turn for the worst.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Proceed immediately to the distress signal's location and guard the Awrig tree.\nGood luck.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "";
global.grd_dia[# DIA_TXT,SV_i] = "Location: Venus Woods\nTarget: Bleeding Bullet (x8)\nObjective: Eliminate all targets";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_menu_briefConfirm;