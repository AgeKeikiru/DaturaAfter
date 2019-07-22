io_clear();

instance_destroy(ds_stack_pop(global.stk_menu));

with obj_handler_dialogue{
    tb_index = ds_grid_height(global.grd_dia) + -1;
    scr_cEvent(id,EVENT_DIA_NEXTLINE);
}