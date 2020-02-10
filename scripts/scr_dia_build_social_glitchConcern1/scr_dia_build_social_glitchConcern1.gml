ds_grid_destroy(global.grd_dia);
global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep();

if(ds_exists(global.currentSocial,ds_type_map)){
    global.grd_dia[# DIA_NAME,SV_i] = global.currentSocial[? SOC_VAR_NAME];
}

global.grd_dia[# DIA_TXT,SV_i] = "Have you seen those new enemies? Damn creepy, I don't even know what they're supposed to be.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Isn't it weird though? The new expansion isn't supposed to be out for like, another couple months I think.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "If you ask me I'd have waited until then, but maybe it's some kind of hype campaign.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_home_endDia;