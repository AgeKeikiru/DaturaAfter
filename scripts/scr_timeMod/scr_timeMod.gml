///@arg val

var
SV_r = argument0 * (global.set_atbSpeed / 100);

global.tempBool = false;

with obj_handler_dungeon{
    global.tempBool = state_battle;
}

for(var SV_i = 0;SV_i < 3;SV_i++){
    var
    SV_mem = global.grd_party_player[# SV_i,0];
    
    if(global.tempBool && scr_checkInput(en_ic_check.down,en_ic_key.party1 + SV_i) && scr_exists(SV_mem,asset_object) && SV_mem.hpCurr > 0){
        SV_r *= global.set_atbMod / 100;
        break;
    }
}

return SV_r;