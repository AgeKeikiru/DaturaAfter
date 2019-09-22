/// @description Insert description here
// You can write your code in this editor

var
_y1 = y + -(image_yscale / 2),
_y2 = y + (image_yscale / 2),
_col = make_color_hsv(136,120,255);

if(global.set_shaders){
	draw_set_color(c_white);
	draw_set_alpha(1);
	shader_set(shd_blur);
	shader_set_uniform_f(suni_blur_size,room_width,image_yscale,2);
	
	if(variable_global_exists("temp_screen")){
		draw_sprite_part(global.temp_screen,0,0,_y1,room_width,image_yscale,0,_y1);
	}
	
	shader_reset();
	draw_set_color(c_white);
	draw_set_alpha(0.3);
	
	draw_rectangle(0,_y1,room_width,_y2,false);
}else{
	draw_set_alpha(1);
	
	draw_rectangle_color(0,_y1,1280,_y2,_col,c_white,c_white,c_white,false);
}

draw_set_color(c_white);
draw_set_alpha(1);

if(sprite_exists(sprite_index) && scr_exists(src,asset_object)){
	var _gray = 0.1;
	
	if(global.set_shaders){
		shader_set(shd_silhouette);
		shader_set_uniform_f(suni_silhouette_col,_gray,_gray,_gray,1.0);
		shader_set_uniform_f(suni_silhouette_grad,false);
		
		draw_sprite_part_ext(sprite_index,0,0,src.src[? CHAR_VAR_ABDO_Y],sprite_width,bSize + 1,(x * 1.2) + src.src[? CHAR_VAR_ABDO_X],_y1,1,image_yscale / bSize,c_white,1);
		
		shader_reset();
	}
	
	draw_sprite_part_ext(sprite_index,0,0,src.src[? CHAR_VAR_ABDO_Y],sprite_width,bSize + 1,x + src.src[? CHAR_VAR_ABDO_X],_y1,1,image_yscale / bSize,c_white,1);
}

txt_x[0] = 1100 + -x;
txt_x[1] = txt_x[0] + -10;
txt_yScale[0] = image_yscale / bSize;
txt_yScale[1] = txt_yScale[0];

draw_set_font(txt_ft[0]);
draw_set_halign(fa_right);
draw_set_valign(fa_middle);

if(global.set_shaders){
	var
	_h = 8 * (image_yscale / bSize),
	_fadeW = 60,
	_txtX = 1100 + -string_width(txt[0]);
	
	txt_x[1] = -50 + -x;
	
	draw_set_color(c_white);
	draw_set_alpha(.3 * (image_yscale / bSize));
	
	draw_text_transformed(1100 + -(x * 1.5),y + 20,txt[1],2,2 * (image_yscale / bSize),0);
	
	gpu_set_blendmode(bm_subtract);
	draw_set_color(c_gray);
	draw_set_alpha(1);
	
	draw_rectangle_color(_txtX + -_fadeW,y,_txtX,_y2,c_black,draw_get_colour(),draw_get_colour(),c_black,false);
	draw_rectangle(_txtX + 1,y,room_width,_y2,false);
	
	gpu_set_blendmode(bm_add);
	
	draw_rectangle_color(0,_y1,room_width,_y1 + _h,c_ltgray,c_ltgray,c_black,c_black,false);
	draw_rectangle_color(0,_y2 + 1,room_width,_y2 + -_h + 1,c_black,c_black,c_ltgray,c_ltgray,false);
	
	gpu_set_blendmode(bm_normal);
}

draw_set_color(c_white);

event_inherited();