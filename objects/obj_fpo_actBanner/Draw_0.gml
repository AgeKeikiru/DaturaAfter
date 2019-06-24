/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_white);
draw_set_alpha(1);

draw_rectangle_color(0,y + -(image_yscale / 2),1280,y + (image_yscale / 2),make_color_hsv(136,120,255),c_white,c_white,c_white,false);

if(sprite_exists(sprite_index) && scr_exists(src,asset_object)){
	draw_sprite_part_ext(sprite_index,0,0,src.src[? CHAR_VAR_ABDO_Y],sprite_width,bSize + 1,x + src.src[? CHAR_VAR_ABDO_X],y + -(image_yscale / 2),1,image_yscale / bSize,c_white,1);
}

draw_set_color(c_white);
draw_set_alpha(1);

txt_x[0] = 1100 + -x;
txt_x[1] = txt_x[0] + -10;
txt_yScale[0] = image_yscale / bSize;
txt_yScale[1] = txt_yScale[0];

event_inherited();