//load map

var
SV_map = scr_data_getMap(global.grd_missions,global.missionCurr),
_mspr = SV_map[? MSN_VAR_MAP_SPR], //map sprite
SV_w = sprite_get_width(_mspr),
SV_h = sprite_get_height(_mspr);

if(global.missionCurr != MSN_SIM){
	repeat(100){
		if(global.dMap_xPos < SV_w && global.dMap_yPos < SV_h){
			var
			SV_colR = buffer_read(global.buff_temp,buffer_u8),
			SV_colG = buffer_read(global.buff_temp,buffer_u8),
			SV_colB = buffer_read(global.buff_temp,buffer_u8),
			SV_colA = buffer_read(global.buff_temp,buffer_u8);
			
			if(color_get_value(SV_colR) == 0){
				global.grd_dMap_terrain[# global.dMap_xPos,global.dMap_yPos] = DMAP_TER_FLOOR;
			}
		}else{
			break;
		}
		
		global.dMap_xPos++;
		
		if(global.dMap_xPos >= SV_w){
			global.dMap_xPos = 0;
			global.dMap_yPos++;
		}
	}
	
	if(global.dMap_xPos < SV_w && global.dMap_yPos < SV_h){
		timeline_position += -1;
	}else{
		global.dMap_xPos = sprite_get_xoffset(_mspr);
		global.dMap_yPos = sprite_get_yoffset(_mspr);
		global.dMap_xPosTgt = global.dMap_xPos;
		global.dMap_yPosTgt = global.dMap_yPos;
		
		buffer_delete(global.buff_temp);
	}
}else{
	global.dMap_xPos = global.dMap_pgmCoords[0] + 1;
	global.dMap_yPos = global.dMap_pgmCoords[1];
	global.dMap_xPosTgt = global.dMap_xPos;
	global.dMap_yPosTgt = global.dMap_yPos;
}