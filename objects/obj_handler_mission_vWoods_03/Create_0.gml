/// @description Insert description here
/*
arr_events (x coord, y coord, shows visible tile marker)
used to keep track of tile-triggered events
*/

event_inherited();

ds_grid_resize(grd_events,3,3);

var
_x = [51,51,84],
_y = [49,50,4];

/*//debug
_x = [16,17,16];
_y = [50,50,51];
//*/

for(var _i = 0;_i < array_length_1d(_x);_i++){
    grd_events[# _i,MHE_VAR_X] = _x[_i];
    grd_events[# _i,MHE_VAR_Y] = _y[_i];
    grd_events[# _i,MHE_VAR_VIS] = false;
}

grd_events[# 2,MHE_VAR_VIS] = true;

grd_party = ds_grid_create(3,2);
ds_grid_copy(grd_party,global.grd_party_player);

scr_placePlayers();

#region //guest init

	guestArr = [create(obj_dungeon_battleMember),create(obj_dungeon_battleMember),create(obj_dungeon_battleMember)];
	
	var
	_mapArr = [
	    global.grd_chars[# 1,en_chars.guest_witchy],
	    global.grd_chars[# 1,en_chars.guest_blaze],
	    global.grd_chars[# 1,en_chars.guest_altai]
	],
	_clsArr = [
	    create(obj_handler_class_sanctum),
	    create(obj_handler_class_evoker),
	    create(obj_handler_class_angel),
	    
	    create(obj_handler_class_razer),
	    create(obj_handler_class_agent),
	    create(obj_handler_class_draker)
	];
	
	#region //witchy
	    var
	    _map = _mapArr[0],
	    _cls = _clsArr[0],
	    _cls2 = _clsArr[3];
	    
	    _cls.grd_skills[# 0,0] = 5;
	    _cls.grd_skills[# 0,1] = 5;
	    _cls.grd_skills[# 1,0] = 5;
	    _cls.grd_skills[# 1,1] = 5;
	    _cls.grd_skills[# 2,1] = 5;
	    _cls.grd_skills[# 3,0] = 5;
	    
	    _cls2.grd_skills[# 0,1] = 5;
	    _cls2.grd_skills[# 0,2] = 5;
	    _cls2.grd_skills[# 1,0] = 5;
	    _cls2.grd_skills[# 1,1] = 5;
	    _cls2.grd_skills[# 2,2] = 5;
	    _cls2.grd_skills[# 3,2] = 5;
	    
	    _map[? en_charVar.hb0] = scr_data_act_new(WTAG_TYPE_GNT,en_charVar.ele_nat,3,10);
	    _map[? en_charVar.hb1] = scr_data_act_new(WTAG_TYPE_DGR,"",3,10);
	    _map[? en_charVar.hb2] = scr_data_act_new(WTAG_TYPE_SHD_FLS,"",3,10);
	    _map[? en_charVar.hb3] = _cls2.grd_skillAct[# 3,2];
	    _map[? en_charVar.hb4] = _cls.grd_skillAct[# 1,1];
	    _map[? en_charVar.hb5] = _cls.grd_skillAct[# 3,0];
	    _map[? en_charVar.hb6] = _cls2.grd_skillAct[# 1,0];
	    _map[? en_charVar.hb7] = _cls2.grd_skillAct[# 2,2];
	    _map[? en_charVar.arm0] = scr_data_armor_new(en_charVar.hp,3,10);
	    _map[? en_charVar.arm1] = scr_data_armor_new(en_charVar.mDef,3,10);
	    _map[? en_charVar.cls0] = _cls;
	    _map[? en_charVar.cls1] = _cls2;
	#endregion
	
	#region //blaze
	    var
	    _map = _mapArr[1],
	    _cls = _clsArr[1],
	    _cls2 = _clsArr[4];
	    
	    _cls.grd_skills[# 0,0] = 5;
	    _cls.grd_skills[# 0,1] = 5;
	    _cls.grd_skills[# 0,2] = 5;
	    _cls.grd_skills[# 1,0] = 5;
	    _cls.grd_skills[# 1,1] = 5;
	    _cls.grd_skills[# 2,0] = 5;
	    
	    _cls2.grd_skills[# 0,0] = 5;
	    _cls2.grd_skills[# 0,1] = 5;
	    _cls2.grd_skills[# 0,2] = 5;
	    _cls2.grd_skills[# 1,2] = 5;
	    _cls2.grd_skills[# 2,0] = 5;
	    _cls2.grd_skills[# 3,1] = 5;
	    
	    _map[? en_charVar.hb0] = scr_data_act_new(WTAG_TYPE_SHG,"",3,10);
	    _map[? en_charVar.hb1] = scr_data_act_new(WTAG_TYPE_HGN,en_charVar.ele_ice,3,10);
	    _map[? en_charVar.hb2] = scr_data_act_new(WTAG_TYPE_ASC_RAY,en_charVar.ele_drk,3,10);
	    _map[? en_charVar.hb3] = _cls2.grd_skillAct[# 3,1];
	    _map[? en_charVar.hb4] = _cls.grd_skillAct[# 1,0];
	    _map[? en_charVar.hb5] = _cls.grd_skillAct[# 2,0];
	    _map[? en_charVar.hb6] = _cls2.grd_skillAct[# 1,2];
	    _map[? en_charVar.hb7] = _cls2.grd_skillAct[# 2,0];
	    _map[? en_charVar.arm0] = scr_data_armor_new(en_charVar.spd,3,10);
	    _map[? en_charVar.arm1] = scr_data_armor_new(en_charVar.eva,3,10);
	    _map[? en_charVar.cls0] = _cls;
	    _map[? en_charVar.cls1] = _cls2;
	#endregion
	
	#region //altai
	    var
	    _map = _mapArr[2],
	    _cls = _clsArr[2],
	    _cls2 = _clsArr[5];
	    
	    _cls.grd_skills[# 0,0] = 5;
	    _cls.grd_skills[# 0,1] = 5;
	    _cls.grd_skills[# 0,2] = 5;
	    _cls.grd_skills[# 1,1] = 5;
	    _cls.grd_skills[# 1,2] = 5;
	    _cls.grd_skills[# 2,0] = 5;
	    
	    _cls2.grd_skills[# 0,1] = 5;
	    _cls2.grd_skills[# 1,1] = 5;
	    _cls2.grd_skills[# 1,2] = 5;
	    _cls2.grd_skills[# 2,0] = 5;
	    _cls2.grd_skills[# 2,2] = 5;
	    _cls2.grd_skills[# 3,2] = 5;
	    
	    _map[? en_charVar.hb0] = scr_data_act_new(WTAG_TYPE_ASC_VRT,en_charVar.ele_lgt,3,10);
	    _map[? en_charVar.hb1] = scr_data_act_new(WTAG_TYPE_CSC,en_charVar.ele_fir,3,10);
	    _map[? en_charVar.hb2] = scr_data_act_new(WTAG_TYPE_SSC_RAISE,"",3,10);
	    _map[? en_charVar.hb3] = scr_data_act_new(WTAG_TYPE_SSC_HEAL,"",3,10);
	    _map[? en_charVar.hb4] = _cls.grd_skillAct[# 1,2];
	    _map[? en_charVar.hb5] = _cls.grd_skillAct[# 2,0];
	    _map[? en_charVar.hb6] = _cls2.grd_skillAct[# 1,1];
	    _map[? en_charVar.hb7] = _cls2.grd_skillAct[# 2,0];
	    _map[? en_charVar.arm0] = scr_data_armor_new(en_charVar.en,3,10);
	    _map[? en_charVar.arm1] = scr_data_armor_new(en_charVar.sDef,3,10);
	    _map[? en_charVar.cls0] = _cls;
	    _map[? en_charVar.cls1] = _cls2;
	#endregion
	
	for(var _i = 0;_i < 3;_i++){
	    guest = guestArr[_i];
	    guest.src = _mapArr[_i];
	    guest.allyParty = global.grd_party_player;
	}

#endregion

map_flags[? 0] = 0;