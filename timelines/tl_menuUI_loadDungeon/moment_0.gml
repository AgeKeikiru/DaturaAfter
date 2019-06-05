global.playerControl = false;

scr_refreshShopList();

link_load = instance_create_depth(0,0,0,obj_fpo_parent);

with link_load{
	layer = global.ly_obj[5];
	image_xscale = room_width;
	image_yscale = room_height;
	
	fill_col = c_black;
	fill_alpha = 1;
	
	tween_alpha = true;
	tgt_alpha = 1;
	image_alpha = 0;
	
	tweenMax = .05;
}