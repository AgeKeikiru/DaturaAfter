ds_grid_destroy(global.grd_dia);
global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep();

if(ds_exists(global.currentSocial,ds_type_map)){
    global.grd_dia[# DIA_NAME,SV_i] = global.currentSocial[? SOC_VAR_NAME];
}

global.grd_dia[# DIA_TXT,SV_i] = "Heh, I read online that the new expansion is datamined already.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Huh? A new creepy-looking enemy? I don't remember reading anything about that.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_home_endDia;