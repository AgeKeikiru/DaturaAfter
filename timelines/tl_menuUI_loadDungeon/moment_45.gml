with obj_handler_menuUI{
	title = false;
	visible = false;
}

var
SV_map = scr_data_getMap(global.grd_missions,global.missionCurr),
_bgm = SV_map[? MSN_VAR_BGM];

if(!instance_exists(obj_handler_mission_parent)){
	//load music
	ds_list_add(global.lst_bgmStream,audio_create_stream("BGM/bgm_" + _bgm + ".ogg"));
	ds_list_add(global.lst_bgmStream,audio_create_stream("BGM/bgm_battle.ogg"));
	ds_list_add(global.lst_bgmStream,audio_create_stream("BGM/bgm_eventBattle.ogg"));

	switch global.missionCurr{
		case MSN_0:
		case MSN_DEMOBOSS:
			ds_list_add(global.lst_bgmStream,audio_create_stream("BGM/bgm_rivalBattle.ogg"));
			break;
			
		case MSN_VWOODS_03:
		    ds_list_add(global.lst_bgmStream,audio_create_stream("BGM/bgm_boss.ogg"));
		    ds_list_add(global.lst_bgmStream,audio_create_stream("BGM/bgm_rival.ogg"));
		    break;
		
		default:
			ds_list_add(global.lst_bgmStream,audio_create_stream("BGM/bgm_boss.ogg"));
			break;
	}
	
	scr_playBgm(global.lst_bgmStream[| 0],0);
	scr_playBgm(global.lst_bgmStream[| 1],1);
	
	global.bgmTrack_curr = 0;
	audio_sound_gain(global.bgmTrack[1],0,0);
}