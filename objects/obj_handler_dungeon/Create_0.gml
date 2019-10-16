/// @description Insert description here
layer = global.ly_obj[1];

ds_list_add(global.lst_listeners,id);

with obj_handler_act{
	using = false;
}

for(var _i = 0;_i < 3;_i++){
	var
	_o = global.grd_party_player[# _i,0],
	_x = 640 + (380 * (_i + -1)),
	_y = 650;
	
	if(scr_exists(_o,asset_object)){
		_o.x = _x;
		_o.y = _y;
		_o.allyParty = global.grd_party_player;
		_o.enemyParty = global.grd_party_enemy;
	}
	
	_o = global.grd_party_player[# _i,1];
	
	if(scr_exists(_o,asset_object)){
		_o.x = _x;
		_o.y = _y;
		_o.allyParty = global.grd_party_player;
		_o.enemyParty = global.grd_party_enemy;
	}
}

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