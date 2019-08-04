with obj_handler_menuUI{
    instance_destroy(ps_bg);

    for(var SV_i = 0;SV_i < ds_list_size(lst_ps_slots);SV_i++){
        instance_destroy(lst_ps_slots[| SV_i]);
    }
    
    ds_list_clear(lst_ps_slots);
    
    ps_baseMenuIndex = -1;
}