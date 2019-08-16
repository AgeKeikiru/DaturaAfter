ds_grid_destroy(global.grd_dia);
global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep();

if(ds_exists(global.currentSocial,ds_type_map)){
    global.grd_dia[# DIA_NAME,SV_i] = global.currentSocial[? SOC_VAR_NAME];
}

global.grd_dia[# DIA_TXT,SV_i] = "Oh? Haven't seen y'all 'round these parts before, y'new here?";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Always glad t'see fresh faces 'round here!";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "See, this here speakeasy ain't just for, well, speakin' easy - some folk want a bit more than t'shoot the breeze.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Ask 'round, there's some odd jobs here and there that don't always make it to the guild. Good way t'make some friends if y'all're interested.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Hup! Alright, that's enough o' my blabberin'! Y'all stay safe and have fun now!";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_home_endDia;