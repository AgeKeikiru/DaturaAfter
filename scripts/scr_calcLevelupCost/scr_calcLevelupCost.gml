///@arg class

var
SV_c = argument0,
SV_r = 500;

if(scr_exists(SV_c,asset_object)){
    SV_r *= 1 + (power(SV_c.level,1.5) * .2);
}

return round(SV_r);