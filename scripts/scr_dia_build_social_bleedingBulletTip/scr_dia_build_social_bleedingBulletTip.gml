ds_grid_destroy(global.grd_dia);
global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep();

if(ds_exists(global.currentSocial,ds_type_map)){
    global.grd_dia[# DIA_NAME,SV_i] = global.currentSocial[? SOC_VAR_NAME];
}

global.grd_dia[# DIA_TXT,SV_i] = "Ah, the Bleeding Bullet - a fascinating creation, albeit quite perilous to study in person.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "I would bring a nice suit of armor when meeting them up close if I were you, those plants have some of the most efficient synaptic structures I've ever observed.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "All dedicated to tracking prey and calculating trajectories with military-grade precision and speed.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "...What I mean to say is: they don't miss.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_home_endDia;