ds_grid_destroy(global.grd_dia);
global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep();

if(ds_exists(global.currentSocial,ds_type_map)){
    global.grd_dia[# DIA_NAME,SV_i] = global.currentSocial[? SOC_VAR_NAME];
}

global.grd_dia[# DIA_TXT,SV_i] = "The new outfit sets MPx is showing off right now have a nice unified look to them.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Hmm... too monochrome for my tastes though. I need something that really makes my horns pop!";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "*Sigh* When will they make more outfits like the ones they showed off during the summer event...";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_home_endDia;