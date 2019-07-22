/// @description Input
global.tempBool = true;

with obj_handler_menu_parent{
	if(visible){
		global.tempBool = false;
	}
}

if(global.tempBool){
	if(scr_checkInput(IC_CHECK_PRESS,IC_KEY_MENUBACK)){
		if(instance_exists(talkbox)){
			scr_dia_skipConfirm();
		}
	}else if(scr_checkInput(IC_CHECK_PRESS,IC_KEY_MENUACCEPT)){
		if(instance_exists(talkbox)){
			if(string_length(talkbox.txt[0]) < string_length(txt_tgt)){
				talkbox.txt[0] = txt_tgt;
			}else{
				scr_cEvent(id,EVENT_DIA_NEXTLINE);
				scr_playSfx(SFX_SCROLLTICK);
			}
		}
	}
}