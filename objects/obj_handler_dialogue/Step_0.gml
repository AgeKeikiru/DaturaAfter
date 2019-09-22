/// @description Insert description here
// You can write your code in this editor

if(instance_exists(talkbox)){
	if(string_length(talkbox.txt[0]) < string_length(txt_tgt)){
		tb_strLen += global.set_txtSpeed / 4;
		talkbox.txt[0] = string_copy(txt_tgt,1,floor(tb_strLen));
	}
}

if(alarm[0] > 1){
	global.tempBool = false;
	
	with obj_handler_menuUI{
		if(visible && transCurr > 0){
			global.tempBool = true;
		}
	}
	
	if(global.tempBool){
		visible = false;
		
		alarm[0] = 30;
		talkbox.image_xscale = 0;
		talkbox.image_yscale = 0;
	}else{
		visible = true;
		
		if(!variable_instance_exists(id,"sfc_bg") && global.set_shaders){
			global.temp_screen = sprite_create_from_surface(application_surface,0,0,room_width,room_height,false,false,0,0);
			
			sfc_bg = surface_create(room_width,room_height);
			
			surface_set_target(sfc_bg);
			draw_set_alpha(1);
			shader_set(shd_blur);
			shader_set_uniform_f(suni_blur_size,room_width,room_height,8);
			
			draw_sprite(global.temp_screen,0,0,0);
			
			shader_reset();
			surface_reset_target();
		}
	}
}