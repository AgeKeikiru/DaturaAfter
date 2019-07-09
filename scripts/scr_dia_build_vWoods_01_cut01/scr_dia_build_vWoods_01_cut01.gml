ds_grid_destroy(global.grd_dia);

global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Tear";
global.grd_dia[# DIA_TXT,SV_i] = "Arriving at mission area. The Awrig tree is just up ahead, in the clearing to the west.";
global.grd_dia[# DIA_SPR_L,SV_i] = spr_imo_neutral;
global.grd_dia[# DIA_REFR_L,SV_i] = true;
global.grd_dia[# DIA_SPR_R,SV_i] = spr_paprika_neutral;
global.grd_dia[# DIA_REFR_R,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Paprika";
global.grd_dia[# DIA_TXT,SV_i] = "Don't worry Awrig tree! Your knights in shining armor are here to rescue you!";
global.grd_dia[# DIA_FOCUS_R,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Imo'lei";
global.grd_dia[# DIA_TXT,SV_i] = "What's all the fuss over some dumb tree anyways? Have they not noticed the trees, y'know, *everywhere?*";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Paprika";
global.grd_dia[# DIA_TXT,SV_i] = "How could you say such a thing!";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Didn't you hear what Ms. Tear said? This is one of the last Awrig trees, they grow to the size of... Egg-diesel?";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Aile";
global.grd_dia[# DIA_TXT,SV_i] = "Yggdrasil?";
global.grd_dia[# DIA_SPR_L,SV_i] = spr_aile_neutral;
global.grd_dia[# DIA_REFR_L,SV_i] = true;
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Paprika";
global.grd_dia[# DIA_TXT,SV_i] = "Yeah that!";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Imo'lei";
global.grd_dia[# DIA_TXT,SV_i] = "Whatever, let's just hurry up and get paid.";
global.grd_dia[# DIA_SPR_L,SV_i] = spr_imo_neutral;
global.grd_dia[# DIA_REFR_L,SV_i] = true;
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_dungeon_endDia;

with obj_handler_dungeon{
    missionTime = 0;
}