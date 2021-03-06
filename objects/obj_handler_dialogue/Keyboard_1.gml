/// @description Input
var
_log_range = ds_grid_height(log_grd) + -log_page + 1;

global.tempBool = instance_exists(talkbox);

with obj_handler_menu_parent{
	if(visible){
		global.tempBool = false;
	}
}

if(global.tempBool){
	if(scr_checkInput(en_ic_check.press,en_ic_key.menuBack)){
		if(!log_tgt){
			scr_dia_skipConfirm();
		}else{
			log_tgt = 0;
		}
	}else if(scr_checkInput(en_ic_check.press,en_ic_key.menuAccept)){
		if(!log_tgt){
			if(string_length(talkbox.txt[0]) < string_length(txt_tgt)){
				talkbox.txt[0] = txt_tgt;
			}else{
				scr_cEvent(EVENT_DIA_NEXTLINE);
				scr_playSfx(SFX_SCROLLTICK);
			}
		}
	}else if(scr_checkInput(en_ic_check.press,en_ic_key.menuExtra)){
		log_tgt = !log_tgt;
		
		if(log_tgt){
			log_i = max(ds_grid_height(log_grd) + -(log_page),0);
		}
	}else if(scr_checkInput(en_ic_check.press,en_ic_key.up)){
		if(log_tgt && _log_range > 0){
			log_i--;
		}
	}else if(scr_checkInput(en_ic_check.press,en_ic_key.down)){
		if(log_tgt && _log_range > 0){
			log_i++;
		}
	}
}

if(_log_range > 0){
	log_i = (log_i + _log_range) % _log_range;
}