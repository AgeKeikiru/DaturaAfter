///@arg increase
///@arg var
///@arg gap
///@arg min
///@arg max

var
SV_inc = argument0,
SV_var = argument1,
SV_gap = argument2,
SV_min = argument3,
SV_max = argument4 + SV_gap,
SV_range = SV_max + -SV_min,
SV_new = variable_global_get(SV_var) + -SV_min;

SV_new += SV_range + (SV_inc ? SV_gap : -SV_gap);
SV_new %= SV_range;

variable_global_set(SV_var,SV_new + SV_min);