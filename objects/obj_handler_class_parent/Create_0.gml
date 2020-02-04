/// @description Insert description here
// You can write your code in this editor
ds_list_add(global.lst_listeners,id);

persistent = true;
visible = false;

scr_trace(object_get_name(object_index) + " " + cName + " created");

stat_basicStatRate = 5;
stat_fineStatRate = 2;

stat_dWield_base = 0.5; //dual wield
stat_dWield_rate = 0.05;

stat_wLove_rate = 0.1; //weapon love

stat_cmpAtk_rate = 0.1; //compound attack (spell imbue (+S), weapon throw (+F), weapon bash (+M))

stat_soh_rate = 0.08; //sleight of hand (hasten)

stat_inst_base = 5; //install
stat_inst_rate = 1;

stat_adr_rate = 5; //adrenaline/flawless

stat_flict_rate = 0.06; //status imbue

ds_grid_set_region(grd_skills,0,0,3,2,0);
ds_grid_set_region(grd_skillRate,0,0,3,2,stat_basicStatRate);
ds_grid_set_region(grd_skillAct,0,0,3,2,noone);
ds_grid_set_region(grd_skillCost,0,0,3,2,100);
ds_grid_set_region(grd_skillCd,0,0,3,2,5000);
ds_grid_set_region(grd_skillIcon,0,0,3,2,spr_icon_test);

alarm[0] = 1;