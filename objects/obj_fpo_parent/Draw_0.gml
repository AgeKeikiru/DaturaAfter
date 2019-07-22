/// @description Insert description here
// You can write your code in this editor

draw_set_alpha(fill_alpha * image_alpha * (fixedAlpha ? 1 : (global.set_winTrans / 100)));
draw_set_color(fill_col);

draw_rectangle(x,y,x + image_xscale,y + image_yscale,false);

draw_set_alpha(1);
draw_set_color(c_white);

if(drawSelf && sprite_exists(sprite_index)){
	draw_self();
}

for(var _i = 0;_i < array_length_1d(txt);_i++){
	draw_set_font(txt_ft[_i]);
	draw_set_halign(txt_halign[_i]);
	draw_set_valign(txt_valign[_i]);
	draw_set_color(txt_col[_i]);
	
	if(txt_shadow[_i]){
		ktk_scr_draw_text_shadow_ext_w(x + txt_x[_i],y + txt_y[_i],txt[_i],txt_col[_i],txt_col[_i],image_alpha + txt_alpha[_i],txt_col2[_i],txt_col2[_i],image_alpha + txt_alpha[_i],txt_weight[_i],txt_xScale[_i],txt_yScale[_i],image_angle,-1,txt_w[_i]);
	}else if(txt_stroke[_i]){
		ktk_scr_draw_text_stroke_ext(x + txt_x[_i],y + txt_y[_i],txt[_i],txt_col[_i],txt_col[_i],image_alpha + txt_alpha[_i],txt_col2[_i],txt_col2[_i],image_alpha + txt_alpha[_i],txt_weight[_i],10,txt_xScale[_i],txt_yScale[_i],image_angle);
	}else{
		draw_text_ext_transformed_color(x + txt_x[_i],y + txt_y[_i],txt[_i],-1,txt_w[_i],txt_xScale[_i],txt_yScale[_i],image_angle,txt_col[_i],txt_col[_i],txt_col[_i],txt_col[_i],image_alpha + txt_alpha[_i]);
	}
}

draw_set_alpha(1);
draw_set_color(c_white);