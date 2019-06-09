/// @description Insert description here
// You can write your code in this editor

if(duration > 0){
    duration--;
    
    if(scr_exists(src,asset_object) && src.ailment[CHAR_SA_PSN] > 0){
        duration--;
    }
    
    if(duration <= 0){
        instance_destroy();
    }
}