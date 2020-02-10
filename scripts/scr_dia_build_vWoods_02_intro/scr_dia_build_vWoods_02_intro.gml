ds_grid_destroy(global.grd_dia);

global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "Let's get this over with. You're here to show your abilities.";
global.grd_dia[# DIA_FOCUS_L,SV_i] = true;
global.grd_dia[# DIA_REFR_L,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Adventurer";
global.grd_dia[# DIA_TXT,SV_i] = "...";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "All you have to do is get to the clearing at the end of this path, and take out anything in your way.";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Do that, and you'll be registered as an Adventurer in the Guild.";

SV_i = scr_dia_newStep(CHAR_PAPRIKA,true);
global.grd_dia[# DIA_TXT,SV_i] = "If you fail... well, you won't get registered I guess.";

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "We're here to make sure you don't get caught off guard, but if you pull something you fight it, got it?";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Adventurer";
global.grd_dia[# DIA_TXT,SV_i] = "...";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "*Sigh* Whatever, let's see what you've got.";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_dungeon_endDia;