///@arg charID

var
SV_id = argument0,
SV_map = scr_data_getMap(global.grd_chars,SV_id);

if(!global.map_flags[? SV_id]){
    global.map_flags[? SV_id] = true;
    
    if(!global.map_flags[? FG_TUT_FORMATION]){
        global.map_flags[? FG_TUT_FORMATION] = true;
        ds_stack_push(global.stk_menuAlert,scr_alert_formationTut);
    }
    
    var SV_str =
    "New Character: [" + SV_map[? CHAR_VAR_NAMEFULL] + "]" +
    "\n\n" +
    SV_map[? CHAR_VAR_DESC];
    
    scr_menu_confirmWindow("message/alert/..",SV_str,scr_menu_backNoRefresh,noone);
}