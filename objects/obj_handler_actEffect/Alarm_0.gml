/// @description Insert description here

if(!ds_list_empty(lst_summonPool)){
	repeat(summonCount){
		ds_list_shuffle(lst_summonPool);
		global.tempStr = lst_summonPool[| 0];
		
		with obj_handler_dungeon{
			ds_list_add(lst_popcorn,global.tempStr);
			popcornTimer = .5 * room_speed;
		}
	}
}

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