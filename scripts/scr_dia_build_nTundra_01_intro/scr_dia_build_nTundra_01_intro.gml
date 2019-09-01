ds_grid_destroy(global.grd_dia);

global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "Damnit, the snow is halfway up my legs! Are we seriously supposed to hike through this?";
global.grd_dia[# DIA_FOCUS_L,SV_i] = true;
global.grd_dia[# DIA_REFR_L,SV_i] = true;

SV_i = scr_dia_newStep(CHAR_AILE,false);
global.grd_dia[# DIA_TXT,SV_i] = "Difficult Terrain...";
global.grd_dia[# DIA_REFR_R,SV_i] = true;
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Our evasion will be reduced, but enemies too, heavier weapons will be more reliable.";

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "That's nice and all, but how are we supposed to find the wreckage while snowblind? We don't exactly have a great view or landmarks to not get lost.";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Tear";
global.grd_dia[# DIA_TXT,SV_i] = "I'm detecting bits of wreckage at high altitudes, check the hilltops.";
global.grd_dia[# DIA_FOCUS_L,SV_i] = false;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Use the bridges to stay high up, going down into the valley is how you actually get lost.";

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "Cross some bridges littered with wolves and mines, just how I wanted to spend my day.";
global.grd_dia[# DIA_FOCUS_L,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Tear";
global.grd_dia[# DIA_TXT,SV_i] = "You want your pay or not?";
global.grd_dia[# DIA_FOCUS_L,SV_i] = false;

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "Yeah yeah we'll get it done, lemme gripe a little will ya?";
global.grd_dia[# DIA_FOCUS_L,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_dungeon_endDia;