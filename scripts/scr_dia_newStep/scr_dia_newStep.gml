var SV_h = ds_grid_height(global.grd_dia);

ds_grid_resize(global.grd_dia,DIA_SCR + 1,SV_h + 1);

global.grd_dia[# DIA_BG,SV_h] = noone;
global.grd_dia[# DIA_FOCUS_L,SV_h] = false;
global.grd_dia[# DIA_FOCUS_R,SV_h] = false;
global.grd_dia[# DIA_NAME,SV_h] = "";
global.grd_dia[# DIA_SCR,SV_h] = noone;
global.grd_dia[# DIA_SPR_L,SV_h] = noone;
global.grd_dia[# DIA_SPR_R,SV_h] = noone;
global.grd_dia[# DIA_TXT,SV_h] = "";
global.grd_dia[# DIA_REFR_L,SV_h] = false;
global.grd_dia[# DIA_REFR_R,SV_h] = false;

if(SV_h > 0){
	global.grd_dia[# DIA_FOCUS_L,SV_h] = global.grd_dia[# DIA_FOCUS_L,SV_h + -1];
	global.grd_dia[# DIA_FOCUS_R,SV_h] = global.grd_dia[# DIA_FOCUS_R,SV_h + -1];
	global.grd_dia[# DIA_NAME,SV_h] = global.grd_dia[# DIA_NAME,SV_h + -1];
	global.grd_dia[# DIA_SPR_L,SV_h] = global.grd_dia[# DIA_SPR_L,SV_h + -1];
	global.grd_dia[# DIA_SPR_R,SV_h] = global.grd_dia[# DIA_SPR_R,SV_h + -1];
}

return SV_h;