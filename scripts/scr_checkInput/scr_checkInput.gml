///@arg checkMacro
///@arg keyMacro

var SV_r = [
	false,
	false,
	false
];

if(global.playerControl){
	if(keyboard_check(global.grd_controls[# argument1,0])){
		SV_r[0] = true;
	}

	if(keyboard_check_pressed(global.grd_controls[# argument1,0])){
		SV_r[1] = true;
	}

	if(keyboard_check_released(global.grd_controls[# argument1,0])){
		SV_r[2] = true;
	}
}

return SV_r[argument0];