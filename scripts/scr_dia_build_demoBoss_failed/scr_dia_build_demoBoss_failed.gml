ds_grid_destroy(global.grd_dia);

global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep(CHAR_BLAZE,false);
global.grd_dia[# DIA_TXT,SV_i] = "Aww, too bad~";
global.grd_dia[# DIA_FOCUS_R,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Hey, if you think it's too hard, let Kei know what your loadout was.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "You should just barely be able to beat me if your team is all lv30, so if that's not enough I might be a little OP.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Anyways, better luck next time!";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_dungeon_endDia;