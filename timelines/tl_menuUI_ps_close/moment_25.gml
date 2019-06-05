
if(ds_stack_size(global.stk_menu) > 0){
    scr_cEvent(ds_stack_top(global.stk_menu),EVENT_MENU_REFRESHMENUUI);
}

transTgt = instance_exists(obj_handler_dungeon) ? -1 : 1;
transCurr = 0;

for(var SV_i = 0;SV_i < ds_list_size(lst_ps_slots);SV_i++){
    instance_destroy(lst_ps_slots[| SV_i]);
}

ds_list_clear(lst_ps_slots);

with obj_handler_menu_parent{
    if(depthMem != 0){
        depth = depthMem;
    }
}

txt_title = txt_titleMem;
txt_titleDesc = txt_titleDescMem;
txt_ctrl = txt_ctrlMem;