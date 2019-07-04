for(var _i = ds_list_size(global.lst_bgmFadeOut) + -1;_i >= 0;_i--){
    var _s = global.lst_bgmFadeOut[| _i];
    
    if(!audio_exists(_s) || audio_sound_get_gain(_s) == 0){
        if(audio_exists(_s)){
            audio_stop_sound(_s);
        }
        
        ds_list_delete(global.lst_bgmFadeOut,_i);
    }
}