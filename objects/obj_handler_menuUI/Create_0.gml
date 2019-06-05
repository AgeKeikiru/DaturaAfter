/// @description Insert description here
// You can write your code in this editor
if(instance_number(obj_handler_menuUI) > 1){
	instance_destroy();
}else{
	layer = global.ly_obj[2];
	ds_grid_set_region(grd_ps_xDraw,0,0,3,1,1); //x positions for drawing menu fill, 0-1 for bottom layer, 2-3 for top layer
}