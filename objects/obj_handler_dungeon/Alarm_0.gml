/// @description Load intro dialogue

var _map = scr_data_getMap(global.grd_missions,global.missionCurr);

if(script_exists(_map[? MSN_VAR_INTRO_DIA])){
	script_execute(_map[? MSN_VAR_INTRO_DIA]);
	
	instance_create_depth(0,0,0,obj_handler_dialogue);
}else{
	global.playerControl = true;
	state_event = false;
}