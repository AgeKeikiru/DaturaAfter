///@arg event
///@arg *flags

for(var _i = ds_list_size(global.lst_listeners) + -1;_i >= 0;_i--){
	var _obj = global.lst_listeners[| _i];
	
	if(scr_exists(_obj,asset_object)){
		with _obj{
			if(argument_count > 1 && variable_instance_exists(id,"cArgs")){
				ds_list_clear(cArgs);
				
				for(var SV_i = 1;SV_i < argument_count;SV_i++){
					ds_list_add(cArgs,argument[SV_i]);
				}
			}
			
			if(variable_instance_exists(id,"cEvent")){
				cEvent = argument[0];
				event_user(0);
			}
		}
	}else{
		ds_list_delete(global.lst_listeners,_i);
	}
}