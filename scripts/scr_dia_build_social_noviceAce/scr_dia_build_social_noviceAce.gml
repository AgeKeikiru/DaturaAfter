ds_grid_destroy(global.grd_dia);
global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep();

if(ds_exists(global.currentSocial,ds_type_map)){
    global.grd_dia[# DIA_NAME,SV_i] = global.currentSocial[? SOC_VAR_NAME];
}

global.grd_dia[# DIA_TXT,SV_i] = "Dive Syndrome? Ain't that just a coma?";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Ah mean ya pass out, can't wake up, sounds like a coma to me...";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Damn newsfolk always wanna make up fancy lingo for words we already got!";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_home_endDia;