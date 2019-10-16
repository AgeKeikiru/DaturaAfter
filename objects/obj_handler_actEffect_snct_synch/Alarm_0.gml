/// @description Insert description here

if(scr_exists(src,asset_object)){
	for(var _i = 0;_i < 3;_i++){
		var _o = src.allyParty[# _i,0];
		
		if(scr_exists(_o,asset_object) && _o != src){
			for(var _i2 = ds_list_size(_o.lst_effects) + -1;_i2 >= 0;_i2--){
				var _e = _o.lst_effects[| _i2];
				
				if(scr_exists(_e,asset_object) && _e.debuff){
					ds_list_delete(_o.lst_effects,_i2);
					
					ds_list_add(src.lst_effects,_e);
					
					_e.duration += duration;
				}
			}
			
			for(var _i2 = 0;_i2 < array_length_1d(_o.ailment);_i2++){
				src.ailment[_i2] += _o.ailment[_i2];
				_o.ailment[_i2] = 0;
			}
		}
	}
	
	scr_cEvent(EVENT_BATTLM_ICONREFRESH);
}

event_inherited();

instance_destroy();