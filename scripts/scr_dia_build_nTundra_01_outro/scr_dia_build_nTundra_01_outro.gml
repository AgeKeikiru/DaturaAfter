ds_grid_destroy(global.grd_dia);

global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_NAME,SV_i] = "Tear";
global.grd_dia[# DIA_TXT,SV_i] = "Excellent, that should be the last batch of cargo.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "And, while you lot were busy I was working on remotely disabling those mines so you can exfil in peace.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Consider it an extra reward for a job well done.";

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "Took you long enough, would've been a hell of a lot more helpful while we were dealing with the wolfeants.";
global.grd_dia[# DIA_FOCUS_L,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Tear";
global.grd_dia[# DIA_TXT,SV_i] = "Must you be such an ungrateful child? If you want the mines reactivated that badly I would be more than happy to oblige.";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "Alright, alright, sorry!";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "You've got a temper, y'know that?";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Everyone";
global.grd_dia[# DIA_TXT,SV_i] = "You're one to talk...";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_dungeon_endDia;