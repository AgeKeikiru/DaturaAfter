ds_grid_copy(global.grd_party_player,global.grd_newFormation);

for(var _i = 0;_i < 3;_i++){
    if(global.grd_party_player[# _i,0] == noone){
        global.grd_party_player[# _i,0] = global.grd_party_player[# _i,1];
        global.grd_party_player[# _i,1] = noone;
    }
}

scr_cEvent(EVENT_BATTLM_INIT);

scr_menu_backNoRefresh();
scr_menu_backNoRefresh();