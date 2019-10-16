/// @description Custom events
// You can write your code in this editor

switch(cEvent){
	case EVENT_DIA_NEXTLINE:
		scr_trace("e:nextLine");
	
		if(instance_exists(talkbox) && tb_index < ds_grid_height(global.grd_dia)){
			scr_trace("tb_index:" + string(tb_index));
			scr_trace(global.grd_dia[# DIA_TXT,tb_index]);
			
			//get speaker name
			txt_name = global.grd_dia[# DIA_NAME,tb_index];
			
			//get next text
			if(global.grd_dia[# DIA_TXT,tb_index] != ""){
				talkbox.txt[0] = "";
				tb_strLen = 0;
				txt_tgt = global.grd_dia[# DIA_TXT,tb_index];
				
				var _h = ds_grid_height(log_grd);
				
				ds_grid_resize(log_grd,ds_grid_width(log_grd),_h + 1);
				log_grd[# 0,_h] = txt_name;
				log_grd[# 1,_h] = txt_tgt;
			}
			
			//get portraits
			var
			_lx = 300,
			_rx = room_width + -_lx;
			
			tb_obj_l.sprite_index = global.grd_dia[# DIA_SPR_L,tb_index];
			tb_obj_l.image_blend = global.grd_dia[# DIA_FOCUS_L,tb_index] ? c_white : c_gray;
			tb_obj_l.tgt_xPos = _lx + (50 * global.grd_dia[# DIA_FOCUS_L,tb_index]);
			
			if(global.grd_dia[# DIA_REFR_L,tb_index]){
				tb_obj_l.x = _lx + -100;
				tb_obj_l.image_alpha = 0;
				tb_obj_l.tgt_alpha = 1;
			}
			
			if(!scr_exists(global.grd_dia[# DIA_SPR_L,tb_index],asset_sprite)){
				tb_obj_l.tgt_xPos = _lx + -100;
				tb_obj_l.tgt_alpha = 0;
			}
			
			tb_obj_r.sprite_index = global.grd_dia[# DIA_SPR_R,tb_index];
			tb_obj_r.image_blend = global.grd_dia[# DIA_FOCUS_R,tb_index] ? c_white : c_gray;
			tb_obj_r.tgt_xPos = _rx + -(50 * global.grd_dia[# DIA_FOCUS_R,tb_index]);
			
			if(global.grd_dia[# DIA_REFR_R,tb_index]){
				tb_obj_r.x = _rx + 100;
				tb_obj_r.image_alpha = 0;
				tb_obj_r.tgt_alpha = 1;
			}
			
			if(!scr_exists(global.grd_dia[# DIA_SPR_R,tb_index],asset_sprite)){
				tb_obj_r.tgt_xPos = _rx + 100;
				tb_obj_r.tgt_alpha = 0;
			}
			
			//run script
			if(script_exists(global.grd_dia[# DIA_SCR,tb_index])){
				script_execute(global.grd_dia[# DIA_SCR,tb_index]);
			}
			
			tb_index++;
		}
		
		break;
}