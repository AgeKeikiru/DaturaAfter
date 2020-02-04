/// @arg _slot

var _slot = argument0;

var
_mem = global.grd_party_player[# _slot,0],
_mem2 = global.grd_party_player[# _slot,1];

if(!scr_exists(_mem2) || _mem2.swapCd > 0){
    return false;
}

with obj_handler_act{
    if(using){
        return false;
    }
}

if(scr_exists(_mem) && scr_exists(_mem.actUsing)){
    return false;
}

with obj_fpo_actBanner{
    if(object_index == obj_fpo_actBanner){
        return false;
    }
}

return true;