/// @description Insert description here
layer = global.ly_obj[1];

arr_slotOff = [0,0,0]; //draw offset for when a party slot is displaying act menu

ds_list_add(global.lst_listeners,id);

with obj_handler_act{
	using = false;
}

scr_placePlayers();

var _map = scr_data_getMap(global.grd_missions,global.missionCurr);

instance_create_depth(0,0,0,_map[? MSN_VAR_HANDLER]);

var _i = 0;

//1st set reserved for fixed battles
grd_mobPool[# _i,0] = CHAR_SLIME;
grd_mobPool[# _i,1] = CHAR_SLIME;
grd_mobPool[# _i,2] = noone;

_i++

grd_mobPool[# _i,0] = noone;
grd_mobPool[# _i,1] = CHAR_SLIME;
grd_mobPool[# _i,2] = noone;

ds_list_clear(global.lst_missionLoot_table);
ds_list_clear(lst_popcornPool);

scr_cEvent(MHE_INIT);

scr_bgManip_reset();

alarm[0] = 60;

battleChance = ENCOUNTER_RATE;