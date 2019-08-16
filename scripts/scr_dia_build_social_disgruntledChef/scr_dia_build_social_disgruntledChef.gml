ds_grid_destroy(global.grd_dia);
global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep();

if(ds_exists(global.currentSocial,ds_type_map)){
    global.grd_dia[# DIA_NAME,SV_i] = global.currentSocial[? SOC_VAR_NAME];
}

global.grd_dia[# DIA_TXT,SV_i] = "Starting as a Chef solo was an awful idea.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "I can't make any progress without a good party, but would YOU want to travel with a level 0 Chef that can't cook?";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "I'm probably gonna just reroll at this rate...";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_home_endDia;