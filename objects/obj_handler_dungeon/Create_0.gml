/// @description Insert description here
layer = global.ly_obj[1];

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

switch global.missionCurr{
	
	#region //nLoewi_01
		case MSN_NLOEWI_01:
			ds_grid_resize(grd_mobPool,4,ds_grid_height(grd_mobPool));
			ds_grid_set_region(grd_mobPool,0,3,ds_grid_width(grd_mobPool) + -1,3,0); //min popcorn
			ds_grid_set_region(grd_mobPool,0,4,ds_grid_width(grd_mobPool) + -1,4,2); //max popcorn
			
			grd_mobPool[# _i,0] = noone;
			grd_mobPool[# _i,1] = CHAR_SLIME;
			grd_mobPool[# _i,2] = noone;
			
			_i++;
			
			grd_mobPool[# _i,0] = CHAR_SLIME;
			grd_mobPool[# _i,1] = CHAR_SLIME;
			grd_mobPool[# _i,2] = noone;
			
			_i++;
			
			grd_mobPool[# _i,0] = noone;
			grd_mobPool[# _i,1] = CHAR_SLIME;
			grd_mobPool[# _i,2] = CHAR_SLIME;
			
			repeat(2){
				ds_list_add(global.lst_missionLoot_table,
					WTAG_TYPE_DGR,
					WTAG_TYPE_HGN
				);
			}
			
			repeat(1){
				ds_list_add(global.lst_missionLoot_table,
					WTAG_TYPE_PAN,
					WTAG_TYPE_SLG
				);
			}
			
			ds_list_add(lst_popcornPool,CHAR_CANDYWING);
			
			global.grd_dMap_terrain[# 1,6] = DMAP_TER_LOOT;
			global.grd_dMap_terrain[# 45,36] = DMAP_TER_LOOT;
			
			break;
	#endregion
		
	default:
		ds_list_add(global.lst_missionLoot_table,WTAG_TYPE_SWD);
		ds_list_add(lst_popcornPool,CHAR_CANDYWING);
		
		break;
}

alarm[0] = 60;