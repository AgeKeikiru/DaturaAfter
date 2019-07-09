ds_grid_destroy(global.grd_dia);

global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep(CHAR_PAPRIKA,true);
global.grd_dia[# DIA_TXT,SV_i] = "Excuse me ma'am, are you a spy?";
global.grd_dia[# DIA_FOCUS_L,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Passenger";
global.grd_dia[# DIA_TXT,SV_i] = "...No?";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep(CHAR_PAPRIKA,true);
global.grd_dia[# DIA_TXT,SV_i] = "This one's clean, captain.";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "Are you fuckin- step aside, would you.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "You expect us to believe that!?";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Passenger";
global.grd_dia[# DIA_TXT,SV_i] = "I-I don't know what you're talking about, honest!";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "*sigh* You don't exactly look suspicious I guess, but we're keeping our eyes on you.";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_dungeon_endDia;