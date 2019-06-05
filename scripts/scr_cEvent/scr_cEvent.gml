///@arg obj
///@arg event

with argument0{
	if(variable_instance_exists(id,"cEvent")){
		cEvent = argument1;
		event_user(0);
	}
}