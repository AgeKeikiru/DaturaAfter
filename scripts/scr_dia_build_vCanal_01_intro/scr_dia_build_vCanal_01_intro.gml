ds_grid_destroy(global.grd_dia);

global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_NAME,SV_i] = "Tear";
global.grd_dia[# DIA_TXT,SV_i] = "Alright, I'm patching you through to your target now...";
global.grd_dia[# DIA_FOCUS_L,SV_i] = false;
global.grd_dia[# DIA_REFR_L,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "";
global.grd_dia[# DIA_TXT,SV_i] = "...";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "???";
global.grd_dia[# DIA_TXT,SV_i] = "...Incoming transmission? Another group of volunteers?";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Honestly, HQ's incessant worrying is going to get civillians killed at this rate, what are they thinking...";

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "Hah? Excuse you, these \"civillians\" are here to save your asses!";
global.grd_dia[# DIA_FOCUS_L,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "???";
global.grd_dia[# DIA_TXT,SV_i] = "*Sigh*... This is Squadron Leader Scylla Gauritter of Layered - whoever you are, I promise you that your assistance is appreciated but not required.";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Scylla";
global.grd_dia[# DIA_TXT,SV_i] = "It would be in your best interest to turn back while you still know where the exit is.";

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "Sorry lady, I don't take orders from knights. If our help is so appreciated, I want your gratitude in person.";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Scylla";
global.grd_dia[# DIA_TXT,SV_i] = "Hmph, I don't have time to discuss this further.";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "We're south-east of your position, but do NOT rush; I will not be held responsible for such preventable losses.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "";
global.grd_dia[# DIA_TXT,SV_i] = "*Click*";

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "Preventable- hey!";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep(CHAR_PAPRIKA,false);
global.grd_dia[# DIA_TXT,SV_i] = "She cut her off? Oh boy...";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "...We're moving.";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_dungeon_endDia;