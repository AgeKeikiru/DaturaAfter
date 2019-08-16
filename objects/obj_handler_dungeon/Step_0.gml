/// @description Insert description here
var
_ui = instance_find(obj_handler_menuUI,0),
_map = scr_data_getMap(global.grd_missions,global.missionCurr),
_mh = _map[? MSN_VAR_HANDLER];

//fail state check
global.tempBool = true;

for(var _ix = 0;_ix < 3;_ix++){
	for(var _iy = 0;_iy < 2;_iy++){
		var _o = global.grd_party_player[# _ix,_iy];
		
		if(scr_exists(_o,asset_object) && _o.hpCurr > 0){
			global.tempBool = false;
		}
	}
}

with obj_fpo_actBanner{
	global.tempBool = false;
}

if(global.tempBool && !missionFailed){
	scr_cEvent(id,EVENT_DND_BATTLELOSE);
}

//ow sprite handling
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
if(
	!state_results
	&& !state_event
	&& (!scr_exists(_ui,asset_object) || _ui.grd_ps_xDraw[# 0,0] == 1)
){
	missionTime++;
}

if(!state_event && !state_battle && !state_results && (missionComplete || missionFailed) && instance_number(obj_fpo_parent) == 0){
	scr_trace("TEST");
	
	if(missionFailed){
		state_results = true;
		
		script_execute(_map[? MSN_VAR_FAIL_DIA]);
		
		instance_create_depth(0,0,0,obj_handler_dialogue);
	}else if(missionComplete){
		state_results = true;
		
		if(script_exists(_map[? MSN_VAR_OUTRO_DIA])){
			script_execute(_map[? MSN_VAR_OUTRO_DIA]);
			
			instance_create_depth(0,0,0,obj_handler_dialogue);
		}else{
			scr_dungeon_endDia();
		}
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
			
			state_moving = false;
			
			globalvar G_tmp;
			G_tmp = false;
			
			with _map[? MSN_VAR_HANDLER]{
				for(var _i = 0;_i < ds_grid_width(grd_events);_i++){
					if(grd_events[# _i,MHE_VAR_X] != -1 && grd_events[# _i,MHE_VAR_X] == global.dMap_xPos && grd_events[# _i,MHE_VAR_Y] == global.dMap_yPos){
						G_tmp = true;
						
						scr_trace(string(grd_events[# _i,MHE_VAR_X]) + "," + string(grd_events[# _i,MHE_VAR_Y]));
						
						scr_cEvent(id,MHE_ETILE + string(_i));
					}
				}
			}
			
			if(!G_tmp){
				if(global.grd_dMap_terrain[# global.dMap_xPos,global.dMap_yPos] == DMAP_TER_LOOT){
					global.grd_dMap_terrain[# global.dMap_xPos,global.dMap_yPos] = DMAP_TER_FLOOR;
					
					repeat(irandom_range(1,3)){
						scr_getLoot(choose(LOOT_G,LOOT_G,LOOT_G,LOOT_WPN,LOOT_WPN,LOOT_ARM));
					}
					
					scr_playSfx(sfx_loot);
				}else if(random(1) < battleChance){
					scr_cEvent(id,EVENT_DND_ENCOUNTER);
				}else{
					battleChance += .02;
					battleChance = min(battleChance,.6);
				}
			}
			
			scr_dungeon_refreshMap();
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
		
		with obj_fpo_parent{
			G_tmp = false;
		}
		
		if(G_tmp && global.playerControl){
			scr_cEvent(id,EVENT_DND_BATTLEWIN);
		}else{
			popcornTimer += -scr_timeMod(1);
			
			if(popcornTimer <= 0 && ds_list_size(lst_popcorn) > 0){
				popcornTimer = .5 * room_speed;
				
				for(var _i = 0;_i < 3;_i++){
					if(!scr_exists(global.grd_party_enemy[# _i,0],asset_object)){
						scr_spawnEnemy(lst_popcorn[| 0],_i,grd_mobPool[# 0,DH_MOB_PLV]);
						ds_list_delete(lst_popcorn,0);
						
						break;
					}
				}
			}
		}
	}else{
		lootBannerDelay--;
		
		var _lst = global.lst_missionLoot_queue;
		
		if(lootBannerDelay <= 1 && ds_list_size(_lst) > 0 && (!missionFailed || instance_exists(obj_handler_dialogue))){
			lootBannerDelay = 20;
			
			var
			_name = _lst[| 0],
			_str = "GET! [" + _name + "] x",
			_count = 0,
			_gold = string_char_at(_name,1) == "$";
			
			for(var _i = ds_list_size(_lst) + -1;_i >= 0;_i--){
				if(_gold && string_char_at(_lst[| _i],1) == "$"){
					_count += real(string_digits(_lst[| _i]));
					ds_list_delete(_lst,_i);
				}else if(_lst[| _i] == _name){
					_count++;
					ds_list_delete(_lst,_i);
				}
			}
			
			_str += string(_count);
			
			if(_gold){
				_str = "GET! " + string(_count) + "g";
			}
			
			with obj_fpo_lootBanner{
				tgt_yPos += image_yscale + 10;
			}
			
			var _b = instance_create_depth(0,200,0,obj_fpo_lootBanner);
			
			_b.txt[0] = _str;
			_b.txt_ft[0] = ft_dungeonBold;
			_b.txt_valign[0] = fa_bottom;
			_b.txt_x[0] = 10;
			_b.txt_y[0] = 5;
		}
	}
}