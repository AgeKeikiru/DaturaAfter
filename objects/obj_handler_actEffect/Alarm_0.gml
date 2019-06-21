/// @description Insert description here

if(scr_exists(src,asset_object)){
    if(effectTxt != ""){
        scr_createEffectTxt(src,effectTxt);
    }
    
    scr_cEvent(src,EVENT_BATTLM_ICONREFRESH);
}