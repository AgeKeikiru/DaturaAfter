/// @description Load intro dialogue

var
_map = scr_data_getMap(global.grd_missions,global.missionCurr),
_jf = _map[? MSN_VAR_JSON];

if(_jf != ""){
    scr_dia_importJson(_jf,MSN_JSON_DIA_INTRO);
    
    instance_create_depth(0,0,0,obj_handler_dialogue);
}else if(script_exists(_map[? MSN_VAR_INTRO_DIA])){
	script_execute(_map[? MSN_VAR_INTRO_DIA]);
	
	instance_create_depth(0,0,0,obj_handler_dialogue);
}else{
	global.playerControl = true;
	state_event = false;
}

missionTime = 0;