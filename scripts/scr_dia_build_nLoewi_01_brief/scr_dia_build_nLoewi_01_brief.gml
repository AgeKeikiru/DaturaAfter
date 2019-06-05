ds_grid_destroy(global.grd_dia);

global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Tear";
global.grd_dia[# DIA_TXT,SV_i] = "Alright you lot, proceed to Northern Loewi's railway hub. A foreign breed of Slime has been reported in the area, likely smuggled in from a neighboring region.";
global.grd_dia[# DIA_SCR,SV_i] = scr_dia_build_nLoewi_01_brief_img01;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "With mutations to counter any possible natural predators, these augmented Slimes will destroy the ecosystem in a matter of days if left undealt with.";
global.grd_dia[# DIA_SCR,SV_i] = scr_dia_build_nLoewi_01_brief_img02;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "The objective is simple: eliminate all mutated Slimes. The Adventurer's Guild thinks this is a good way to prove your worth, so try to make a good first impression out there.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "They may just be slimes, but anything can happen in the field. This request should pose little difficulty, as long as you keep your guard up.\nGood luck.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "";
global.grd_dia[# DIA_TXT,SV_i] = "Location: North Loewi\nTarget: Paraslime (x7)\nObjective: Eliminate all targets";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_menu_briefConfirm;