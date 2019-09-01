ds_grid_destroy(global.grd_dia);

global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_NAME,SV_i] = "Intercom";
global.grd_dia[# DIA_TXT,SV_i] = "Thank you for accepting our request. Remember, you will only receive payment if you can reach the control center.";
global.grd_dia[# DIA_FOCUS_L,SV_i] = false;
global.grd_dia[# DIA_REFR_L,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Activating defense systems... the test will begin now.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_dungeon_endDia;