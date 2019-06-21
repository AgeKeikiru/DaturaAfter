///@arg obj

var
SV_r = false,
SV_obj = argument0;

if(scr_exists(SV_obj,asset_object)){
    for(var SV_i = 0;SV_i < 6;SV_i++){
        if(SV_obj.ailment[SV_i] > 0){
            SV_r = true;
        }
    }
    
    for(var SV_i = 0;SV_i < ds_list_size(SV_obj.lst_effects);SV_i++){
        var SV_eff = SV_obj.lst_effects[| SV_i];
        
        if(scr_exists(SV_eff,asset_object) && SV_eff.debuff){
            SV_r = true;
        }
    }
}

return SV_r;