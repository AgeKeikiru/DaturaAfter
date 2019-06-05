
global.playerControl = false;

for(var SV_i = 0;SV_i < ds_list_size(lst_ps_slots);SV_i++){
    lst_ps_slots[| SV_i].tgt_alpha = 0;
}

with ds_stack_top(global.stk_menu){
    visible = false;
}