global.playerControl = false;

if(!instance_exists(obj_handler_mission_parent)){
	for(var SV_i = 0;SV_i < 3;SV_i++){
		if(audio_exists(global.bgmTrack[SV_i])){
			audio_sound_gain(global.bgmTrack[SV_i],0,500);
			ds_list_add(global.lst_bgmFadeOut,global.bgmTrack[SV_i]);
		}
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
	
	tweenMax = .05;
}

load_step = 0;