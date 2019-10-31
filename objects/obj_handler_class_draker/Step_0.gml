
var
_ix = 3,
_iy = 1,
_proc = grd_skills[# _ix,_iy] * grd_skillRate[# _ix,_iy];

if((CS_SRCSTANCEIS obj_handler_actEffect_drak_install)){
	//aura check
	for(var _i = 0;_i < 6;_i++){
		if(grd_skills[# 3,2] && src.ailment[_i] > 2){
			src.ailment[_i] += -scr_timeMod(1);
		}
	}
	
	//reinstall check
	if(src.stance.duration < 5 && !reinstall && random(1) < _proc){
		reinstall = true;
		src.stance.duration = src.stance.durMax;
		
		scr_createEffectTxt(src,"REINSTALL");
	}
}