ds_grid_destroy(global.grd_dia);

global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "Yeesh, almost didn't make it...";
global.grd_dia[# DIA_FOCUS_L,SV_i] = true;
global.grd_dia[# DIA_REFR_L,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Announcer";
global.grd_dia[# DIA_TXT,SV_i] = "-NOW DEPARTING FROM LOEWI NORTH STATION-";
global.grd_dia[# DIA_FOCUS_L,SV_i] = false;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "-ATTENTION: THIS LINE WILL BE PASSING THROUGH A MIGRATION ZONE-\n-BE WARY OF WILDLIFE THAT MAY PASS THROUGH TRAIN CARS-";

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "Hah? What the hell kinda train is this!? They can't just shut these windows to stop wild animals from hopping in these cars!?";
global.grd_dia[# DIA_FOCUS_L,SV_i] = true;

SV_i = scr_dia_newStep(CHAR_AILE,false);
global.grd_dia[# DIA_TXT,SV_i] = "Babel XR's engine is known to have clipping issues when dealing with high-speed collisions.";
global.grd_dia[# DIA_REFR_R,SV_i] = true;
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "If they can't fix it, maybe this is an in-game explanation for it?";

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "Who came up with that shitty idea?";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Wait we're wasting time! The train's gonna reach the next station in a matter of minutes, move it!";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_dungeon_endDia;