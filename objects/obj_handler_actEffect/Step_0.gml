/// @description Insert description here
// You can write your code in this editor

if(duration > 0){
    duration += -scr_timeMod(1);
    
    if(scr_exists(src,asset_object) && src.ailment[CHAR_SA_PSN] > 0){
        duration += -scr_timeMod(1);
    }
    
    if(duration <= 0){
        instance_destroy();
    }
}