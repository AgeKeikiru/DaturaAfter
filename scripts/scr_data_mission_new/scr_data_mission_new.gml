///@arg msnID
///@arg *json

var
SV_r = ds_map_create(),
_isJson = false;

//general
SV_r[? MSN_VAR_ID] = argument[0];
SV_r[? MSN_VAR_JSON] = "";

if(argument_count > 1){
    SV_r[? MSN_VAR_JSON] = argument[1];
    _isJson = true;
}

var _json = scr_jsonLoad(SV_r[? MSN_VAR_JSON]);

SV_r[? MSN_VAR_NAME] = _isJson ? _json[? MSN_JSON_NAME] : "???";
SV_r[? MSN_VAR_CLIENT] = _isJson ? _json[? MSN_JSON_CLIENT] : "Anonymous";
SV_r[? MSN_VAR_REWARD] = _isJson ? _json[? MSN_JSON_REWARD] : 0;
SV_r[? MSN_VAR_OPNAME] = _isJson ? _json[? MSN_JSON_OPNAME] : "Wild Bird";
SV_r[? MSN_VAR_OPFOR] = _isJson ? _json[? MSN_JSON_OPFOR] : "???";
SV_r[? MSN_VAR_ESR] = _isJson ? _json[? MSN_JSON_ESR] : "0%";

SV_r[? MSN_VAR_DESC_LOC] = _isJson ? _json[? MSN_JSON_LOC] : "Lost Field";
SV_r[? MSN_VAR_DESC_TGT] = _isJson ? _json[? MSN_JSON_TGT] : "Unknown";
SV_r[? MSN_VAR_DESC_OBJ] = _isJson ? _json[? MSN_JSON_OBJECTIVE] : "Unknown";
SV_r[? MSN_VAR_DESC_SCR] = scr_dia_build_nLoewi_01_brief;

SV_r[? MSN_VAR_MAP_SPR] = _isJson ? asset_get_index(_json[? MSN_JSON_MAP]) : spr_map_nLoewi_01;

SV_r[? MSN_VAR_BGM] = _isJson ? _json[? MSN_JSON_BGM] : "forest";

SV_r[? MSN_VAR_INTRO_DIA] = noone;
SV_r[? MSN_VAR_OUTRO_DIA] = noone;
SV_r[? MSN_VAR_FAIL_DIA] = scr_dia_build_missionFailed;
SV_r[? MSN_VAR_HANDLER] = _isJson ? asset_get_index(_json[? MSN_JSON_HANDLER]) : obj_handler_mission_nLoewi_01;
SV_r[? MSN_VAR_STATUS] = 0;

SV_r[? MSN_VAR_PAR_TIME_S] = 9999999;
SV_r[? MSN_VAR_PAR_TIME_C] = 99999999;
SV_r[? MSN_VAR_PAR_DMG_S] = 1000;
SV_r[? MSN_VAR_PAR_DMG_C] = 0;
SV_r[? MSN_VAR_PAR_EXPL_S] = 90;
SV_r[? MSN_VAR_PAR_EXPL_C] = 50;

SV_r[? MSN_VAR_LOOT_GOLDMIN] = 1;
SV_r[? MSN_VAR_LOOT_GOLDMAX] = 2;
SV_r[? MSN_VAR_LOOT_RANKMIN] = 0;
SV_r[? MSN_VAR_LOOT_RANKMAX] = 0;

if(_isJson){
    var _lst = _json[? MSN_JSON_PAR_TIME];
    SV_r[? MSN_VAR_PAR_TIME_S] = _lst[| 0] * 60 * room_speed;
    SV_r[? MSN_VAR_PAR_TIME_C] = _lst[| 1] * 60 * room_speed;
    
    _lst = _json[? MSN_JSON_PAR_DMG];
    SV_r[? MSN_VAR_PAR_DMG_S] = _lst[| 0];
    SV_r[? MSN_VAR_PAR_DMG_C] = _lst[| 1];
    
    _lst = _json[? MSN_JSON_PAR_EXPL];
    SV_r[? MSN_VAR_PAR_EXPL_S] = _lst[| 0];
    SV_r[? MSN_VAR_PAR_EXPL_C] = _lst[| 1];
    
    _lst = _json[? MSN_JSON_LOOT_GOLD];
    SV_r[? MSN_VAR_LOOT_GOLDMIN] = _lst[| 0];
    SV_r[? MSN_VAR_LOOT_GOLDMAX] = _lst[| 1];
    
    _lst = _json[? MSN_JSON_LOOT_RANK];
    SV_r[? MSN_VAR_LOOT_RANKMIN] = _lst[| 0];
    SV_r[? MSN_VAR_LOOT_RANKMAX] = _lst[| 1];
}

var SV_h = ds_grid_height(global.grd_missions);
ds_grid_resize(global.grd_missions,2,SV_h + 1);
global.grd_missions[# 0,SV_h + -1] = argument[0];
global.grd_missions[# 1,SV_h + -1] = SV_r;

return SV_r;