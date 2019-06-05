ds_grid_destroy(global.grd_dia);

global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Imo'lei";
global.grd_dia[# DIA_TXT,SV_i] = "Looks like this is the place.";
global.grd_dia[# DIA_SPR_L,SV_i] = spr_imo_neutral;
global.grd_dia[# DIA_FOCUS_L,SV_i] = true;
global.grd_dia[# DIA_REFR_L,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "About time too, I was about to fall asleep. Can we get a mission a little closer to home next time?";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Tear";
global.grd_dia[# DIA_TXT,SV_i] = "I'll file a request to have the smugglers send their next batch of invasive species directly to your doorstep. In the meantime, get started on tracking down those slimes.";
global.grd_dia[# DIA_FOCUS_L,SV_i] = false;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "The residue left behind by slimes - especially a foreign species such as this - should be fairly easy to notice. Just follow the trails, they couldn't have gotten far.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Aile";
global.grd_dia[# DIA_TXT,SV_i] = "Um... oh! Is this a trail?";
global.grd_dia[# DIA_SPR_R,SV_i] = spr_aile_neutral;
global.grd_dia[# DIA_FOCUS_R,SV_i] = true;
global.grd_dia[# DIA_REFR_R,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Paprika";
global.grd_dia[# DIA_TXT,SV_i] = "Aww yeah! We'll get this done lickity-split with your fancy scanners Aile!";
global.grd_dia[# DIA_SPR_R,SV_i] = noone; //TODO
global.grd_dia[# DIA_REFR_R,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Imo'lei";
global.grd_dia[# DIA_TXT,SV_i] = "Right, let's get this over with. I gotta hurry up and get some levels before the tournament...";
global.grd_dia[# DIA_FOCUS_L,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_dungeon_endDia;

with obj_handler_dungeon{
    missionTime = 0;
}