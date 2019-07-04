///@arg increase

var
SV_m = ds_stack_top(global.stk_menu);

scr_menu_toggleBasic(argument0,"set_volBgm",5,0,100);

SV_m.grd_txt[# SV_m.menu_x,SV_m.menu_y] = scr_stringGapFormat("BGM Volume:","<- " + string(global.set_volBgm) + "% ->",25);

var SV_s = global.bgmTrack[global.bgmTrack_curr];
    
if(audio_exists(SV_s)){
    audio_sound_gain(SV_s,global.set_volBgm / 100,0);
}