///@arg obj
///@arg event
///@arg *flags

with argument[0]{
	if(argument_count > 2 && variable_instance_exists(id,"cArgs")){
		ds_list_clear(cArgs);
		
		for(var SV_i = 2;SV_i < argument_count;SV_i++){
			ds_list_add(cArgs,argument[SV_i]);
		}
	}
	
	if(variable_instance_exists(id,"cEvent")){
		cEvent = argument[1];
		event_user(0);
	}
}