ds_grid_destroy(global.grd_dia);

global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Tear";
global.grd_dia[# DIA_TXT,SV_i] = "This mission is a direct request to you from Lainarch's international Adventurer Guild branch, AG-I.";
global.grd_dia[# DIA_SCR,SV_i] = scr_dia_build_vWoods_01_brief_img01;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "AG-I will be sponsoring a special arena event and would like you lot to attend.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "The event is a battle between newcomers that have shown exceptional ability.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "After careful consideration, you have been selected to participate.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "The winner will receive a substantial reward, paid for by AG-I.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Your opponent is unknown, however they have included a message of their own:";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "\"Please give me a performance I'll be hard pressed to forget.\"";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "";
global.grd_dia[# DIA_TXT,SV_i] = "Location: AG-I Arena\nTarget: PvP\nObjective: Eliminate all targets";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_menu_briefConfirm;