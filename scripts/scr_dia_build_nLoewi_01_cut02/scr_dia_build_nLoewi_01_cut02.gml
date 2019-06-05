ds_grid_destroy(global.grd_dia);

global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Imo'lei";
global.grd_dia[# DIA_TXT,SV_i] = "No doubt about it, that's our little bastard.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Paprika";
global.grd_dia[# DIA_TXT,SV_i] = "Ha! Get ready to get butt-whooped mister slime!";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Imo'lei";
global.grd_dia[# DIA_TXT,SV_i] = "Hmph, you just focus on keeping it distracted, chef-girl.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "*I'll* be the one turning this thing into mince-meat.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Paprika";
global.grd_dia[# DIA_TXT,SV_i] = "Mince-slime?";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Imo'lei";
global.grd_dia[# DIA_TXT,SV_i] = "Mince-slime, whatever, just hurry up and pull already!";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_dungeon_endDia;
