ds_grid_destroy(global.grd_dia);

global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Imo'lei";
global.grd_dia[# DIA_TXT,SV_i] = "...Huh? Wait a sec, we've pretty much checked all over now right? But we've only found like half of them.";
global.grd_dia[# DIA_SPR_L,SV_i] = spr_imo_neutral;
global.grd_dia[# DIA_SPR_R,SV_i] = spr_aile_neutral;
global.grd_dia[# DIA_FOCUS_L,SV_i] = true;
global.grd_dia[# DIA_REFR_L,SV_i] = true;
global.grd_dia[# DIA_REFR_R,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Aile, you sure you didn't miss anything? It's gonna be a real pain in the ass if some of 'em got away.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Aile";
global.grd_dia[# DIA_TXT,SV_i] = "I'm double-checking now!";
global.grd_dia[# DIA_FOCUS_L,SV_i] = false;
global.grd_dia[# DIA_FOCUS_R,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Oh... u-um...";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Imo'lei";
global.grd_dia[# DIA_TXT,SV_i] = "Spit it out, we're listening.";
global.grd_dia[# DIA_FOCUS_L,SV_i] = true;
global.grd_dia[# DIA_FOCUS_R,SV_i] = false;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Aile";
global.grd_dia[# DIA_TXT,SV_i] = "I-I think I found the rest...";
global.grd_dia[# DIA_FOCUS_L,SV_i] = false;
global.grd_dia[# DIA_FOCUS_R,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Imo'lei";
global.grd_dia[# DIA_TXT,SV_i] = "...";
global.grd_dia[# DIA_FOCUS_L,SV_i] = true;
global.grd_dia[# DIA_FOCUS_R,SV_i] = false;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Tch... ganging up on us now, huh?";
global.grd_dia[# DIA_SCR,SV_i] = scr_dia_build_nLoewi_01_cut03_bgm;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Fine, I was starting to get bored!";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_dungeon_endDia;
