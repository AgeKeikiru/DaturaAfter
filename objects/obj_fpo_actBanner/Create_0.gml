/// @description Insert description here
// You can write your code in this editor

event_inherited();

layer = global.ly_obj[5];
alarm[11] = 60;
hspeed = 40;

tgt_yScale = bSize;

scr_playSfx(sfx_cutin);

if(instance_number(obj_fpo_actBanner) <= 1){
	global.temp_screen = sprite_create_from_surface(application_surface,0,0,room_width,room_height,false,false,0,0);
}

#region //shader uniforms

	suni_blur_size = shader_get_uniform(shd_blur,"size");
	
	suni_silhouette_col = shader_get_uniform(shd_silhouette,"v4_col");
	suni_silhouette_grad = shader_get_uniform(shd_silhouette,"gradient");

#endregion