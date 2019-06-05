ds_grid_destroy(global.grd_dia);

global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Imo'lei";
global.grd_dia[# DIA_TXT,SV_i] = "...Huh? Wait a sec, we've pretty much checked all over now right? But we've only found like half of them.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Aile, you sure you didn't miss anything? It's gonna be a real pain in the ass if some of 'em got away.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Aile";
global.grd_dia[# DIA_TXT,SV_i] = "I'm double-checking now!";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Oh... u-um...";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Imo'lei";
global.grd_dia[# DIA_TXT,SV_i] = "Spit it out, we're listening.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Aile";
global.grd_dia[# DIA_TXT,SV_i] = "I-I think I found the rest...";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Imo'lei";
global.grd_dia[# DIA_TXT,SV_i] = "...";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Tch... ganging up on us now, huh?";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Fine, I was starting to get bored!";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_dungeon_endDia;
