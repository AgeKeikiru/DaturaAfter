event_inherited();

if(ripoCd > 0){
	ripoCd += scr_timeMod(1);
}

if(ds_list_size(special) > 0 && special[| ACE_WM_HTRIG] != obj_handler_class_ace.stat_ht_base){
	//hair trigger bonus
	for(var _i = 0;_i < 8;_i++){
		var _ca = src.act[_i];
		
		if(scr_exists(_ca) && _ca.object_index == obj_handler_act && _ca.atkScale == en_charVar.fAtk){
			_ca.tempAgile = true;
		}
	}
}