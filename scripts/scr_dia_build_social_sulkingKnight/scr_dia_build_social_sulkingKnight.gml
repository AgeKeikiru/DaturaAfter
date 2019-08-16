ds_grid_destroy(global.grd_dia);
global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep();

if(ds_exists(global.currentSocial,ds_type_map)){
    global.grd_dia[# DIA_NAME,SV_i] = global.currentSocial[? SOC_VAR_NAME];
}

global.grd_dia[# DIA_TXT,SV_i] = "*Sigh* another year, another failed Layered application...";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "I swear that fitness test gets stricter every year!";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "At this rate I'll never be able to tell Harzer how I feel...";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "...No! She would never accept a man who gives up so easily anyways! Next year for sure!";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_home_endDia;