
event_inherited();

for(var _gi = 0;_gi < 3;_gi++){
    guest = guestArr[_gi];
    
    for(var _i = en_charVar.hb0;_i <= en_charVar.clsU;_i++){
        if(scr_exists(guest.src[? _i])){
            instance_destroy(guest.src[? _i]);
            guest.src[? _i] = noone;
        }
    }
    
    instance_destroy(guest);
}

ds_grid_copy(global.grd_party_player,grd_party);
ds_grid_destroy(grd_party);