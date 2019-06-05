/// @description Insert description here
// You can write your code in this editor

for(var _i = 0;_i < array_length_1d(zoom);_i++){
	if(sprite_exists(layer_background_get_sprite(global.ly_bg[_i]))){
		if(zoom[_i] != 0){
			layer_x(global.lyid_bg[_i],layer_get_x(global.lyid_bg[_i]) + (sprite_get_width(layer_background_get_sprite(global.ly_bg[_i])) * -zoom[_i] * .5));
			layer_y(global.lyid_bg[_i],layer_get_y(global.lyid_bg[_i]) + (sprite_get_height(layer_background_get_sprite(global.ly_bg[_i])) * -zoom[_i] * .5));
			
			layer_background_xscale(global.ly_bg[_i],layer_background_get_xscale(global.ly_bg[_i]) + zoom[_i]);
			layer_background_yscale(global.ly_bg[_i],layer_background_get_yscale(global.ly_bg[_i]) + zoom[_i]);
		}
	}
}