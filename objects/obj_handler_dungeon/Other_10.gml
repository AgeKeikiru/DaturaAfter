/// @description Custom events
// You can write your code in this editor

switch(cEvent){
	#region //dnd_encounter
		case EVENT_DND_ENCOUNTER_FIXED:
		case EVENT_DND_ENCOUNTER:
			if(cEvent == EVENT_DND_ENCOUNTER_FIXED){
				state_fixedBattle = true;
			}
		
			scr_runTimeline(tl_dungeon_startBattle);
		
			break;
	#endregion
	
	#region //dnd_battleWin
		case EVENT_DND_BATTLEWIN:
			scr_writeLog();
			
			state_battle = false;
			tgtSlot = -1;
			
			if(!missionComplete){
				audio_sound_gain(global.bgmTrack[1],0,2000);
				audio_sound_gain(global.bgmTrack[2],0,2000);
				
				global.bgmTrack_curr = 0;
				
				audio_sound_gain(global.bgmTrack[global.bgmTrack_curr],global.set_volBgm / 100,2000);
			}
			
			with obj_dungeon_battleMember{
				actUsing = noone;
				tgtSlot = -1;
			}
			
			state_boss = false;
			
			break;
	#endregion
	
	#region //dnd_battleLose
		case EVENT_DND_BATTLELOSE:
			scr_writeLog();
		
			state_battle = false;
			missionComplete = false;
			missionFailed = true;
			
			with obj_dungeon_battleMember{
				if(allyParty == global.grd_party_enemy){
					instance_destroy();
				}
			}
			
			with obj_fpo_actBanner{
				instance_destroy();
			}
			
			with obj_handler_act{
				abort = true;
			}
			
			with obj_handler_actEffect{
				instance_destroy();
			}
			
			break;
	#endregion
}