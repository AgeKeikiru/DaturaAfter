/// @description Insert description here

if(scr_exists(src,asset_object)){
	for(var _i = 0;_i < 8;_i++){
		var _act = src.act[_i];
		
		if(scr_exists(_act,asset_object) && !_act.xAct && _act.object_index != obj_handler_act_ange_aDash){
			_act.cdCurr = 0;
		}
	}
}