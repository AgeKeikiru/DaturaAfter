ds_grid_destroy(global.grd_dia);

global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "Not bad. Probably wouldn't have made it without us, but you held your own out there.";
global.grd_dia[# DIA_FOCUS_L,SV_i] = true;
global.grd_dia[# DIA_REFR_L,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Welcome to the Guild.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Adventurer";
global.grd_dia[# DIA_TXT,SV_i] = "...";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "...Tch, would it kill you to react a little?";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep(CHAR_PAPRIKA,false);
global.grd_dia[# DIA_TXT,SV_i] = "Ehehe, you're starting to sound like your sis~";
global.grd_dia[# DIA_REFR_R,SV_i] = true;

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "Ugh, PLEASE don't say that.";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "Talking to this brick wall is depressing enough.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_dungeon_endDia;