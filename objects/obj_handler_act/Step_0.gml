/// @description Insert description here
// You can write your code in this editor
if(!scr_exists(src,asset_object)){
	exit;
}

if(scr_exists(src,asset_object)){
	if(cdCurr > 0){
		var _spd = src.spd;
		
		global.tempFloat = 0;
		
		scr_cEvent_id(obj_handler_actEffect,EVENT_BATTLE_SPDMOD,src);
		scr_cEvent_id(obj_handler_class_parent,EVENT_BATTLE_SPDMOD,src);
		
		_spd += src.spd * global.tempFloat;
			
		_spd = max(_spd,-99);
		
		if(!xAct){
			cdCurr += -scr_timeMod((100 + _spd) / (1 + (src.ailment[CHAR_SA_SLW] > 0)));
			cdCurr = max(cdCurr,0);
		}
	}
	
	usable = enCost <= src.enCurr && recoil < src.hpCurr;
}