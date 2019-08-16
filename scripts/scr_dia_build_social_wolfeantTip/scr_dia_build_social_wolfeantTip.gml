ds_grid_destroy(global.grd_dia);
global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep();

if(ds_exists(global.currentSocial,ds_type_map)){
    global.grd_dia[# DIA_NAME,SV_i] = global.currentSocial[? SOC_VAR_NAME];
}

global.grd_dia[# DIA_TXT,SV_i] = "T-Those damn tree wolves! The Wolfeants! They're a m-menace!";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "I haven't seen a monster that can attack the entire p-party before!";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Ever since running into one I started bringing shields with me everywhere I g-g-go!";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_home_endDia;