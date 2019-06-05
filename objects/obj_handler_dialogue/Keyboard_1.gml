/// @description Input
if(scr_checkInput(IC_CHECK_PRESS,IC_KEY_MENUACCEPT)){
	scr_trace("key");
	
	if(instance_exists(talkbox)){
		if(string_length(talkbox.txt[0]) < string_length(txt_tgt)){
			talkbox.txt[0] = txt_tgt;
		}else{
			scr_cEvent(id,EVENT_DIA_NEXTLINE);
		}
	}
}