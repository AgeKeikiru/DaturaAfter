///@arg charID

var SV_id = argument0;

for(var SV_i = 0;SV_i < 6;SV_i++){
    var
    SV_x = SV_i % 3,
    SV_y = SV_i > 2,
    SV_c = global.grd_party_player[# SV_x,SV_y];
    
    if(scr_exists(SV_c,asset_object) && SV_c.src[? CHAR_VAR_ID] == SV_id){
        return true;
    }
}

return false;