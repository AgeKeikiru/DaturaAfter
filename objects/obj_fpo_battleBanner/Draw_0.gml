/// @description Insert description here
// You can write your code in this editor

draw_set_color(boss ? c_red : c_white);
draw_set_alpha(1);

draw_rectangle(0,y + -(image_yscale / 2),1280,y + (image_yscale / 2),false);

draw_set_alpha(image_alpha * .8);
draw_set_font(ft_dungeonBold);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _str = "";

while(string_width(_str) < room_width * 2){
	_str += boss ? "EXORCISE AN EXTREME CAUTION " : "INCOMING ENEMY FORCE ";
}

var
_xOff = abs(current_time / 10) % (string_width(_str) / 2),
_yOff = (image_yscale / 2) + 10;

draw_text(_xOff,y + -_yOff,_str);
draw_text(room_width + -_xOff,y + _yOff + 10,_str);

draw_set_color(c_white);
draw_set_alpha(1);

if(boss){
	_str = "!!!!! THREAT LEVEL MAXIMUM !!!!!";
	txtLen = min(txtLen + .5,string_length(_str));
	
	txt[0] = string_copy(_str,1,txtLen);
}

txt_yScale[0] = image_yscale / bSize;

event_inherited();