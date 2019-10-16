ds_grid_clear(global.grd_party_player,noone);

for(var SV_i = 0;SV_i < ds_list_size(global.lst_newFormation);SV_i++){
    var
    SV_x = SV_i % 3,
    SV_y = SV_i > 2,
    SV_id = global.lst_newFormation[| SV_i];
    
    global.grd_party_player[# SV_x,SV_y] = global.map_chars[? SV_id];
}

scr_cEvent(EVENT_BATTLM_INIT);

scr_menu_backNoRefresh();
scr_menu_backNoRefresh();