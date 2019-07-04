ds_grid_destroy(global.grd_dia);

global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Imo'lei";
global.grd_dia[# DIA_TXT,SV_i] = "Alright, that should be the last of 'em, right?";
global.grd_dia[# DIA_SPR_L,SV_i] = spr_imo_neutral;
global.grd_dia[# DIA_FOCUS_L,SV_i] = true;
global.grd_dia[# DIA_REFR_L,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Tear";
global.grd_dia[# DIA_TXT,SV_i] = "Mm, indeed. All targets confirmed routed.";
global.grd_dia[# DIA_FOCUS_L,SV_i] = false;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Aile";
global.grd_dia[# DIA_TXT,SV_i] = "We did it?";
global.grd_dia[# DIA_SPR_R,SV_i] = spr_aile_neutral;
global.grd_dia[# DIA_FOCUS_L,SV_i] = false;
global.grd_dia[# DIA_FOCUS_R,SV_i] = true;
global.grd_dia[# DIA_REFR_R,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Paprika";
global.grd_dia[# DIA_TXT,SV_i] = "We did it! We diiiiiiiiiid it!";
global.grd_dia[# DIA_SPR_R,SV_i] = spr_paprika_neutral;
global.grd_dia[# DIA_REFR_R,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Imo'lei";
global.grd_dia[# DIA_TXT,SV_i] = "Relax, would you? That was child's play, I was practically falling asleep over here.";
global.grd_dia[# DIA_FOCUS_L,SV_i] = true;
global.grd_dia[# DIA_FOCUS_R,SV_i] = false;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Tear";
global.grd_dia[# DIA_TXT,SV_i] = "She's right - requests will only get more difficult from here on out.";
global.grd_dia[# DIA_FOCUS_L,SV_i] = false;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "But still, for your first mission you all performed quite well. It looks like you'll make for fine adventurers after all.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Imo'lei";
global.grd_dia[# DIA_TXT,SV_i] = "Heh, damn right I will. Let's get outta here.";
global.grd_dia[# DIA_FOCUS_L,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "(Just \"quite well\" huh? Hmph...)";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_dungeon_endDia;
