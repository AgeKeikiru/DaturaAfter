/// @description Insert description here
// You can write your code in this editor
alarm[0] = room_speed * 5;

if(instance_number(obj_handler_menuUI) > 1){
	global.tempInt = id;
	
	with obj_handler_menuUI{
		if(id != global.tempInt){
			instance_destroy();
		}
	}
}else{
	layer = global.ly_obj[2];
	ds_grid_set_region(grd_ps_xDraw,0,0,3,1,1); //x positions for drawing menu fill, 0-1 for bottom layer, 2-3 for top layer
}