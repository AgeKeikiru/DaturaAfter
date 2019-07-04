if(instance_exists(obj_handler_dungeon)){
	if(load_step = 0){
		var SV_o = instance_create_depth(100,600,0,obj_fpo_loadBanner);
		
		with SV_o{
			layer = global.ly_obj[5];
			
			image_xscale = room_width;
			image_yscale = 0;
			
			tween_xPos = true;
			x += 200;
			
			tween_yPos = true;
			y += tgt_yScale / 2;
			
			fill_col = c_white;
			
			tween_alpha = true;
			tgt_alpha = 1;
			image_alpha = 0;
			
			//tweenSpd = 7;
		}
		
		ds_list_add(lst_link_loadExtra,SV_o);
	}
	
	load_step++;
	
	if(load_step < 4){
		timeline_position += -30;
	}
}