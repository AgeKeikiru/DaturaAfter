ds_grid_destroy(global.grd_dia);

global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep(CHAR_AILE,true);
global.grd_dia[# DIA_TXT,SV_i] = "There are some strong readings ahead, look out!";
global.grd_dia[# DIA_FOCUS_L,SV_i] = true;
global.grd_dia[# DIA_REFR_L,SV_i] = true;

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "It's part of the test, let them handle it.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Besides, we've got our own job to do.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_dungeon_endDia;