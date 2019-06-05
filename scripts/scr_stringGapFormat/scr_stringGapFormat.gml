///@arg string1
///@arg string2
///@arg totalLength

var
SV_s1 = string(argument0),
SV_s2 = string(argument1),
SV_r = SV_s1,
SV_gap = argument2 + -string_length(SV_s1) + -string_length(SV_s2);

SV_gap = max(SV_gap,0);

repeat(SV_gap){
    SV_r += " ";
}

SV_r += SV_s2;

return SV_r;