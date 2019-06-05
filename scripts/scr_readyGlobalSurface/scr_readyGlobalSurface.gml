/*
arg0: surface x-size
arg1: surface y-size
*/

if(!surface_exists(global.sfc_temp)){
	global.sfc_temp = surface_create(1,1);
}

surface_resize(global.sfc_temp,argument0,argument1);
surface_set_target(global.sfc_temp);
draw_clear_alpha(c_white,0);