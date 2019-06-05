/// @description Insert description here
// You can write your code in this editor

persistent = true;

stat_basicStatRate = 5;
stat_fineStatRate = 2;
stat_dWield_base = 50;
stat_dWield_rate = 5;

ds_grid_set_region(grd_skills,0,0,3,2,0);
ds_grid_set_region(grd_skillRate,0,0,3,2,stat_basicStatRate);
ds_grid_set_region(grd_skillAct,0,0,3,2,noone);