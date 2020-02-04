ds_grid_destroy(global.grd_dia);
global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep();

if(ds_exists(global.currentSocial,ds_type_map)){
    global.grd_dia[# DIA_NAME,SV_i] = global.currentSocial[? SOC_VAR_NAME];
}

global.grd_dia[# DIA_TXT,SV_i] = "Y'know, they call this game an XRMMO, but it's not really any different from Full Dive VR tech-wise.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "I'd wager the people who made it just wanted to get away from all the bad press Full Dive had around it.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "They called it \"Dive Syndrome\" - players were falling unconscious at random and unable to wake up for months, years I've heard in a few cases.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Oh! Don't you fret now, I said this uses the same tech, but that's only in a real basic sense.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Of course all the hardware is leaps and bounds ahead of anything we've seen before, and there's plenty of failsafes in place.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "I've been around the block a few times, and I wouldn't be playing this right now if I had an ounce of worry of Dive Syndrome rearing its ugly head again.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_home_endDia;

scr_unlockSocial(SOC_NACE);