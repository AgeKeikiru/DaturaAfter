///@arg *charID
///@arg *leftSide

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

if(argument_count > 1){
	var
	SV_map = scr_data_getMap(global.grd_chars,argument[0]),
	SV_side = argument[1] ? DIA_SPR_L : DIA_SPR_R,
	SV_refr = argument[1] ? DIA_REFR_L : DIA_REFR_R;
	
	if(global.grd_dia[# DIA_NAME,SV_h] != SV_map[? CHAR_VAR_NAMEDISP]){
		global.grd_dia[# DIA_NAME,SV_h] = SV_map[? CHAR_VAR_NAMEDISP];
		
		if(global.grd_dia[# SV_side,SV_h] != SV_map[? CHAR_VAR_SPR_NEUTRAL]){
			global.grd_dia[# SV_refr,SV_h] = true;
		}
		
		global.grd_dia[# SV_side,SV_h] = SV_map[? CHAR_VAR_SPR_NEUTRAL];
	}
}

return SV_h;