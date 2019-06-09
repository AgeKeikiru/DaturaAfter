/// @description Insert description here
// You can write your code in this editor

if(cdCurr > 0 && scr_exists(src,asset_object)){
	var _spd = src.spd;
	
	global.tempFloat = 0;
	scr_cEvent(all,EVENT_BATTLE_SPDMOD,src);
	_spd += src.spd * global.tempFloat;
		
	_spd = max(_spd,-99);
	
	if(!xAct){
		cdCurr += -(100 + _spd) / (1 + (src.ailment[CHAR_SA_SLW] > 0));
		cdCurr = max(cdCurr,0);
	}
}