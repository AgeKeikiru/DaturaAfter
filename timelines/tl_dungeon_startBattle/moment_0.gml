with obj_handler_dungeon{
    global.playerControl = false;
    popcornTimer = 9999 * room_speed;
    
    if(!state_fixedBattle){
        audio_sound_gain(global.bgmTrack[0],0,1000);
        global.bgmTrack_curr = 1;
    	audio_sound_gain(global.bgmTrack[global.bgmTrack_curr],global.set_volBgm / 100,1000);
    }else{
        audio_sound_gain(global.bgmTrack[0],0,0);
        global.bgmTrack_curr = 2;
        scr_playBgm(global.lst_bgmStream[| 2 + state_boss],2);
    }
    
    battleChance = -.4;
    state_battle = true;
    
    var SV_o = instance_create_depth(room_width / 2,room_height / 2,0,obj_fpo_battleBanner);
    SV_o.boss = state_boss;
    
    if(state_boss){
        timeline_speed = .5;
    }
    
    state_boss = false;
}