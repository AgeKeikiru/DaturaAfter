ds_grid_destroy(global.grd_dia);

global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep(CHAR_PAPRIKA,true);
global.grd_dia[# DIA_TXT,SV_i] = "Hmmmm... welp, no spies heeeere!";
global.grd_dia[# DIA_FOCUS_L,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Oh noooo! My flash drive full of company secrets! I sure hope nobody tries to steal this valuable information!";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Obvious Spy";
global.grd_dia[# DIA_TXT,SV_i] = "Fufufu... you fool! Your secrets are as good as mine!";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "Are you serious, did that seriously just work?";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_dungeon_endDia;