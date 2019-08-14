ds_grid_destroy(global.grd_dia);

global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "I take it you're Scylla?";
global.grd_dia[# DIA_FOCUS_L,SV_i] = true;
global.grd_dia[# DIA_REFR_L,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Scylla";
global.grd_dia[# DIA_TXT,SV_i] = "Ah, the tenacious one with the shrill voice. So you actually made it.";
global.grd_dia[# DIA_SPR_R,SV_i] = spr_npc_scylla;
global.grd_dia[# DIA_REFR_R,SV_i] = true;
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "Gonna pretend I didn't hear that.";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "More importantly \"assistance not required\" my ass!";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Do you have any idea how many monsters we had to kill on the way here!?";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Scylla";
global.grd_dia[# DIA_TXT,SV_i] = "...Yes, I'd wager it's about as many as the ones following behind you.";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "Huh?";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Heh, perfect timing actually. Looks like I get to show you what civillians are capable of.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Scylla";
global.grd_dia[# DIA_TXT,SV_i] = "Do as you wish. I'll take care of any that slip past you.";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_dungeon_endDia;