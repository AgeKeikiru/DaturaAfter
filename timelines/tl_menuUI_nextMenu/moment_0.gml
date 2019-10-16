global.playerControl = false;
global.bgManip.zoom[0] = .01;

transTgt = 0;
menuBG_tgt = -menuBG_w2;

menuNext = -1;

if(!ds_stack_empty(global.stk_menu)){
	var SV_menu = ds_stack_top(global.stk_menu);
	
	menuNext = txt_title == "HOME" ? SV_menu.menu_y : -1;
	
	if(menuNext == 0 || txt_title == "MISSION"){
		for(var SV_i = 0;SV_i < 3;SV_i++){
			if(audio_exists(global.bgmTrack[SV_i])){
				audio_sound_gain(global.bgmTrack[SV_i],0,500);
			}
		}
	}
	
	with SV_menu{
		instance_destroy();
	}
}

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
	
	tweenSpd = 7;
}

load_step = 0;

if(instance_exists(obj_handler_dungeon) || toTitle){
	for(var SV_i = 0;SV_i < 3;SV_i++){
		if(audio_exists(global.bgmTrack[SV_i])){
			audio_sound_gain(global.bgmTrack[SV_i],0,500);
			ds_list_add(global.lst_bgmFadeOut,global.bgmTrack[SV_i]);
		}
	}
}