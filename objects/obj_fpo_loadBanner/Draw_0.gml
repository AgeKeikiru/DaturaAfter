/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_white);
draw_set_alpha(1);

var _yOff = (sprite_get_height(spr_imo_ow_runLeft) / 2) + -(image_yscale / 2);

draw_rectangle(0,y + -(image_yscale / 2),1280,y + (image_yscale / 2),false);
draw_sprite_part_ext(sprite_index,-1,0,_yOff,sprite_width,image_yscale + 1,1100,y + -(image_yscale / 2),1,1,c_black,1);

draw_set_alpha(image_alpha * .5);
draw_set_font(ft_dungeonBold);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _str = "";

while(string_width(_str) < room_width * 2){
	_str += "Please Wait ";
}

var
_xOff = abs(current_time / 10) % (string_width(_str) / 2),
_yOff = (image_yscale / 2) + 10;

draw_text(_xOff,y + -_yOff,_str);
draw_text(room_width + -_xOff,y + _yOff + 10,_str);

draw_set_color(c_white);
draw_set_alpha(1);

event_inherited();