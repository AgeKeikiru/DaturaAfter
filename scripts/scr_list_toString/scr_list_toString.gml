///@arg list

var
SV_r = "[";

for(var SV_i = 0;SV_i < ds_list_size(argument0);SV_i++){
    if(SV_i > 0){
        SV_r += ",";
    }
    
    SV_r += string(argument0[| SV_i]);
}

return SV_r + "]";