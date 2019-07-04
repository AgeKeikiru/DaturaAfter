///@arg val

var
SV_r = argument0 * (global.set_atbSpeed / 100);

global.tempBool = false;

with obj_handler_dungeon{
    global.tempBool = state_battle;
}

for(var SV_i = 0;SV_i < 3;SV_i++){
    var
    SV_off = scr_checkInput(IC_CHECK_DOWN,IC_KEY_PARTYSHIFT),
    SV_mem = global.grd_party_player[# SV_i,SV_off];
    
    if(global.tempBool && scr_checkInput(IC_CHECK_DOWN,IC_KEY_PARTY1 + SV_i) && scr_exists(SV_mem,asset_object) && SV_mem.hpCurr > 0){
        SV_r *= global.set_atbMod / 100;
        break;
    }
}

return SV_r;