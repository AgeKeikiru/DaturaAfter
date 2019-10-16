/// @description Insert description here

if(scr_exists(src,asset_object)){
    if(effectTxt != ""){
        scr_createEffectTxt(src,effectTxt);
    }
    
    if(cure_ail){
    	for(var _i = 0;_i < 6;_i++){
    		src.ailment[_i] = 0;
    	}
    }
    
    if(cure_deb){
    	global.tempObj = src;
    	
    	with obj_handler_actEffect{
    		if(src == global.tempObj && debuff){
    			instance_destroy();
    		}
    	}
    }
    
    scr_cEvent_id(src,EVENT_BATTLM_ICONREFRESH);
}