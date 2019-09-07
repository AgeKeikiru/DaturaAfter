///@arg charID

var
SV_id = argument0;

if(global.map_flags[? SIM_FG_STATUS + SV_id] == -1){
    global.map_flags[? SIM_FG_STATUS + SV_id] = 0;
    
    if(!global.map_flags[? FG_TUT_SIM]){
        global.map_flags[? FG_TUT_SIM] = true;
        ds_stack_push(global.stk_menuAlert,scr_alert_simTut);
        
        with ds_stack_top(global.stk_menu){
            grd_scr[# 0,1] = scr_menu_sim;
        }
    }
    
    scr_menu_confirmWindow("message/alert/..","New Simulator Zone: [" + SV_id + "]",scr_menu_backNoRefresh,noone);
}