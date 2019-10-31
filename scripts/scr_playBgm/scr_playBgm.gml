///@arg bgm
///@arg channel

var
SV_si = argument0,
SV_c = argument1;

if(audio_exists(global.bgmTrack[SV_c])){
    audio_stop_sound(global.bgmTrack[SV_c]);
}

global.bgmTrack[SV_c] = audio_play_sound(SV_si,999,true);
audio_sound_gain(global.bgmTrack[SV_c],global.set_volBgm / 100,0);