//load music
ds_list_add(global.lst_bgmStream,audio_create_stream("bgm_forest.ogg"));
ds_list_add(global.lst_bgmStream,audio_create_stream("bgm_battle.ogg"));
ds_list_add(global.lst_bgmStream,audio_create_stream("bgm_eventBattle.ogg"));
ds_list_add(global.lst_bgmStream,audio_create_stream("bgm_boss.ogg"));

scr_playBgm(global.lst_bgmStream[| 0],0);
scr_playBgm(global.lst_bgmStream[| 1],1);

global.bgmTrack_curr = 0;
audio_sound_gain(global.bgmTrack[1],0,0);