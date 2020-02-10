/// @description Insert description here
/*
arr_events (x coord, y coord, shows visible tile marker)
used to keep track of tile-triggered events
*/

event_inherited();

ds_grid_resize(grd_events,1,3);

var
_x = [96],
_y = [25];

for(var _i = 0;_i < array_length_1d(_x);_i++){
    grd_events[# _i,MHE_VAR_X] = _x[_i];
    grd_events[# _i,MHE_VAR_Y] = _y[_i];
    grd_events[# _i,MHE_VAR_VIS] = true;
}

grd_party = ds_grid_create(3,2);
ds_grid_copy(grd_party,global.grd_party_player);

//remove mina from party if already present
for(var _ix = 0;_ix < 3;_ix++){
    for(var _iy = 0;_iy < 2;_iy++){
        var _mem = global.grd_party_player[# _ix,_iy];
        
        if(scr_exists(_mem) && _mem.src == global.grd_chars[# 1,en_chars.mina]){
            global.grd_party_player[# _ix,_iy] = noone;
        }
    }
}

//guest mina init
var
_map = global.grd_chars[# 1,en_chars.guest_mina],
_cls = create(obj_handler_class_idol);

_cls.grd_skills[# 0,1] = 5;
_cls.grd_skills[# 1,2] = 5;

_map[? en_charVar.hb0] = scr_data_act_new(WTAG_TYPE_SWD,"",2,0);
_map[? en_charVar.hb1] = scr_data_act_new(WTAG_TYPE_SMG,"",2,0);
_map[? en_charVar.hb2] = scr_data_act_new(WTAG_TYPE_ASC_VRT,CHAR_VAR_ELE_ELC,2,0);
_map[? en_charVar.hb3] = _cls.grd_skillAct[# 1,2];
_map[? en_charVar.arm0] = scr_data_armor_new(en_charVar.spd,3,0);
_map[? en_charVar.arm1] = scr_data_armor_new(en_charVar.misc,0,0);
_map[? en_charVar.cls0] = _cls;

guest = create(obj_dungeon_battleMember);
guest.src = _map;
guest.allyParty = global.grd_party_player;

global.grd_party_player[# 2,0] = guest;
scr_cEvent_id(guest,EVENT_BATTLM_INIT);
guest.hpCurr = guest.hpMax;
guest.enCurr = guest.enMax;

scr_placePlayers();