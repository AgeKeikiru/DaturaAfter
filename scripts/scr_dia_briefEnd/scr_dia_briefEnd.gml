///@arg map

var
_map = argument0,
_i = scr_dia_newStep();

if(_map == global.missionJson){
    global.grd_dia[# DIA_NAME,_i] = "";
    global.grd_dia[# DIA_TXT,_i] =
    "Location: " + _map[? MSN_JSON_LOC] +
    "\nTarget: " + _map[? MSN_JSON_TGT] +
    "\nObjective: " + _map[? MSN_JSON_OBJECTIVE];
}else{
    global.grd_dia[# DIA_NAME,_i] = "";
    global.grd_dia[# DIA_TXT,_i] =
    "Location: " + _map[? MSN_VAR_DESC_LOC] +
    "\nTarget: " + _map[? MSN_VAR_DESC_TGT] +
    "\nObjective: " + _map[? MSN_VAR_DESC_OBJ];
}

_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,_i] = scr_menu_briefConfirm;