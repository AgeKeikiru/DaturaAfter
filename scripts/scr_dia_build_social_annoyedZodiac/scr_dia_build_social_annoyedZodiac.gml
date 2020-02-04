ds_grid_destroy(global.grd_dia);
global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep();

if(ds_exists(global.currentSocial,ds_type_map)){
    global.grd_dia[# DIA_NAME,SV_i] = global.currentSocial[? SOC_VAR_NAME];
}

global.grd_dia[# DIA_TXT,SV_i] = "Ugh, I can't believe these money-hungry devs.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "I heard they're working on an entirely new DLC area - different enemies, new biome, the works.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Considering the lacking content at launch, it sounds like that area was cut to get this out the door early, just so they could sell it to us later and make a quick buck.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "If that turns out to be true, I'm gonna start a petition to have it changed to a free expansion.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_home_endDia;