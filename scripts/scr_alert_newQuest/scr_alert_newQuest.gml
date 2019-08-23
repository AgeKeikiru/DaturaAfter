if(ds_stack_size(global.stk_newQuests) > 0){
    var
    SV_map = ds_stack_pop(global.stk_newQuests),
    SV_str = "New Quest: " + SV_map[? Q_VAR_NAME] + "\n\n" + scr_quest_buildDesc(SV_map[? Q_VAR_ID]);
    
    scr_menu_confirmWindow("message/alert/..",SV_str,scr_menu_backNoRefresh,noone);
}