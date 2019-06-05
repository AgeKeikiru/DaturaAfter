with obj_handler_bgManip{
	instance_destroy();
}

global.bgManip = instance_create_depth(0,0,0,obj_handler_bgManip);

for(var _i = 0;_i < array_length_1d(global.ly_bg);_i++){
	layer_x(global.lyid_bg[_i],0);
	layer_y(global.lyid_bg[_i],0);
	layer_background_xscale(global.ly_bg[_i],1);
	layer_background_yscale(global.ly_bg[_i],1);
}