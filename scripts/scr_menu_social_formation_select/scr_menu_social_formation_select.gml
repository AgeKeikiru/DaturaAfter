var
SV_m = ds_stack_top(global.stk_menu),
SV_map = SV_m.grd_equipSrc[# SV_m.menu_x,SV_m.menu_y],
SV_id = SV_map[? CHAR_VAR_ID],
SV_pos = ds_list_find_index(global.lst_newFormation,SV_id);

if(SV_pos >= 0){
    ds_list_delete(global.lst_newFormation,SV_pos);
}else if(ds_list_size(global.lst_newFormation) < 6){
    ds_list_add(global.lst_newFormation,SV_id);
}

scr_refreshFormation();