/// @description Insert description here
// You can write your code in this editor
if(!state_moving){
	switch pIcon{
		case spr_imo_ow_runRight:
			pIcon = spr_imo_ow_faceRight;
			
			break;
		case spr_imo_ow_runLeft:
			pIcon = spr_imo_ow_faceLeft;
			
			break;
		case spr_imo_ow_runUp:
			pIcon = spr_imo_ow_faceUp;
			
			break;
		case spr_imo_ow_runDown:
			pIcon = spr_imo_ow_faceDown;
			
			break;
	}
}

//time handling
if(!state_results && !state_event){
	missionTime++;
}

if(!state_event && !state_battle && !state_results && missionComplete){
	state_results = true;
	
	var _map = scr_data_getMap(global.grd_missions,global.missionCurr);
	
	if(script_exists(_map[? MSN_VAR_OUTRO_DIA])){
		script_execute(_map[? MSN_VAR_OUTRO_DIA]);
		
		instance_create_depth(0,0,0,obj_handler_dialogue);
	}else{
		scr_dungeon_endDia();
	}
}else{
	battleTrans = ktk_scr_tween(battleTrans,!state_battle,4,-1);
	
	if(global.dMap_xPos != global.dMap_xPosTgt || global.dMap_yPos != global.dMap_yPosTgt){
		global.playerControl = false;
		
		global.dMap_xPos = ktk_scr_tween(global.dMap_xPos,global.dMap_xPosTgt,1,.1);
		global.dMap_yPos = ktk_scr_tween(global.dMap_yPos,global.dMap_yPosTgt,1,.1);
		
		if(global.dMap_xPos == global.dMap_xPosTgt && global.dMap_yPos == global.dMap_yPosTgt){
			global.playerControl = true;
			global.dMap_xPos = round(global.dMap_xPos);
			global.dMap_yPos = round(global.dMap_yPos);
			
			ds_grid_set_disk(global.grd_dMap_visible,global.dMap_xPos,global.dMap_yPos,3,true);
			
			state_moving = false;
			
			globalvar G_tmp;
			G_tmp = false;
			
			with obj_handler_mission_parent{
				for(var _i = 0;_i < ds_grid_width(grd_events);_i++){
					if(grd_events[# _i,MHE_VAR_X] == global.dMap_xPos && grd_events[# _i,MHE_VAR_Y] == global.dMap_yPos){
						G_tmp = true;
						
						scr_cEvent(id,MHE_ETILE + string(_i));
					}
				}
			}
			
			if(!G_tmp){
				if(random(1) < battleChance){
					scr_cEvent(id,EVENT_DND_ENCOUNTER);
				}else{
					battleChance += .04;
				}
			}
		}
	}
	
	if(state_battle){
		globalvar G_tmp;
		G_tmp = true;
		
		with obj_dungeon_battleMember{
			if(allyParty == global.grd_party_enemy){
				G_tmp = false;
			}
		}
		
		if(G_tmp){
			scr_cEvent(id,EVENT_DND_BATTLEWIN);
		}
	}
}