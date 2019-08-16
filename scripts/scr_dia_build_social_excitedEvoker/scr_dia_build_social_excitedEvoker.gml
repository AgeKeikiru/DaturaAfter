ds_grid_destroy(global.grd_dia);
global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep();

if(ds_exists(global.currentSocial,ds_type_map)){
    global.grd_dia[# DIA_NAME,SV_i] = global.currentSocial[? SOC_VAR_NAME];
}

global.grd_dia[# DIA_TXT,SV_i] = "Omigod, Evoker is just so fun!";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "I have macros set up so when I hit Magical Redeemer it does like a whole transformation sequence, like an actual magical girl! Complete with uwus of course, heehee~";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Ah, transforming in the middle of a fight is kinda hard though...";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_home_endDia;