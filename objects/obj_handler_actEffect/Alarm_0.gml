/// @description Insert description here

if(scr_exists(src,asset_object)){
    if(effectTxt != ""){
        var
        _pX = src.x,
        _pY = src.y + -70;
        
        scr_createEffectTxt(_pX,_pY,effectTxt);
    }
    
    scr_cEvent(src,EVENT_BATTLM_ICONREFRESH);
}