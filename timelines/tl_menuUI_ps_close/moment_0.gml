
global.playerControl = false;
grd_ps_xDraw[# 3,1] = 0;
transTgt = -.5;
transCurr = transTgt;
ps_baseMenuIndex = -1;

for(var SV_i = 0;SV_i < ds_list_size(lst_ps_slots);SV_i++){
    lst_ps_slots[| SV_i].tgt_alpha = 0;
}