ds_grid_destroy(global.grd_dia);

global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep(CHAR_BLAZE,false);
global.grd_dia[# DIA_TXT,SV_i] = "Eh?";
global.grd_dia[# DIA_REFR_R,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "No way, you actually beat me?";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Tell Kei whatever you used to beat me 'cuz it must be broken.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Oh well, I'll make sure you get that reward money so you can play around with maxed out chips.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Have fun!";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_dungeon_endDia;