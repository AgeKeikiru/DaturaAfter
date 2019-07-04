/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_white);
draw_set_alpha(1);
gpu_set_blendmode(bm_subtract);

draw_rectangle_color(x,y,x + image_xscale,y + -image_yscale,make_color_hsv(0,0,255 * image_alpha),c_black,c_black,make_color_hsv(0,0,255 * image_alpha),false);

gpu_set_blendmode(bm_add);

draw_line_width_color(x,y,x + image_xscale,y,2,make_color_hsv(0,0,255 * image_alpha),c_black);

draw_set_color(c_white);
draw_set_alpha(1);
gpu_set_blendmode(bm_normal);

//txt_x[0] = 1100 + -x;

event_inherited();