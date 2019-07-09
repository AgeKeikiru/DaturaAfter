///@arg sfx

var
SV_si = argument0,
SV_dupe = false,
SV_r = noone;

if(SV_si != noone){
    for(var SV_i = 0;SV_i < ds_list_size(global.lst_sfx);SV_i++){
        var SV_sfx = global.lst_sfx[| SV_i];
        
        if(audio_exists(SV_sfx) && asset_get_index(audio_get_name(SV_sfx)) == SV_si && audio_sound_get_track_position(SV_sfx) == 0){
            SV_dupe = true;
        }
    }
    
    if(!SV_dupe){
        SV_r = audio_play_sound(SV_si,0,false);
        audio_sound_gain(SV_r,global.set_volSfx / 100,0);
        
        ds_list_add(global.lst_sfx,SV_r);
    }
    
    while(ds_list_size(global.lst_sfx) > 12){
        ds_list_delete(global.lst_sfx,0);
    }
    
    switch SV_si{
        case sfx_tick1:
        case sfx_tick2:
        case sfx_tick3:
        case sfx_tick4:
        case sfx_alert1:
        case sfx_alert2:
        case sfx_alert3:
        case sfx_brief:
            break;
        default:
            audio_sound_pitch(SV_r,random_range(.95,1.05));
    }
}

return SV_r;