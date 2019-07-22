global.playerControl = false;

with(obj_handler_menuUI){
	with ds_stack_top(global.stk_menu){
	    visible = false;
	}
	
	txt_desc = "";
	txt_descLabel = "";
	txt_title = "OPTION";
	txt_titleDesc = "Adjust gameplay settings";
}

var SV_m = scr_createMenuPanel(80,250,500,-1,"party/option/..");

with SV_m{
	var
	SV_i = 0;
	
	ds_grid_resize(grd_txt,1,7);
	scr_menu_matchGrids(id,true);
	
	grd_txt[# 0,SV_i] = scr_stringGapFormat("BGM Volume:","<- " + string(global.set_volBgm) + "% ->",25);
	grd_desc[# 0,SV_i] = "Adjust volume of ingame music.";
	grd_descLabel[# 0,SV_i] = "Sound Settings";
	grd_scr[# 0,SV_i] = scr_menu_party_options_tog_volBgm;
	grd_toggle[# 0,SV_i] = true;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = scr_stringGapFormat("SFX Volume:","<- " + string(global.set_volSfx) + "% ->",25);
	grd_desc[# 0,SV_i] = "Adjust volume of ingame sound effects.";
	grd_descLabel[# 0,SV_i] = "Sound Settings";
	grd_scr[# 0,SV_i] = scr_menu_party_options_tog_volSfx;
	grd_toggle[# 0,SV_i] = true;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = scr_stringGapFormat("ATB Speed:","<- " + string(global.set_atbSpeed) + "% ->",25);
	grd_desc[# 0,SV_i] = "Adjust the rate at which Acts recharge for allies and enemies. Reduce this option if battles become overwhelming.";
	grd_descLabel[# 0,SV_i] = "Game Settings";
	grd_scr[# 0,SV_i] = scr_menu_party_options_tog_atbSpeed;
	grd_toggle[# 0,SV_i] = true;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = scr_stringGapFormat("ATB Slowdown:","<- " + string(global.set_atbMod) + "% ->",25);
	grd_desc[# 0,SV_i] = "An additional modifier that affects ATB Speed while a party member's Act Menu is open. Reduce this option if battles become overwhelming.";
	grd_descLabel[# 0,SV_i] = "Game Settings";
	grd_scr[# 0,SV_i] = scr_menu_party_options_tog_atbMod;
	grd_toggle[# 0,SV_i] = true;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = scr_stringGapFormat("Text Speed:","<- " + string(global.set_txtSpeed) + " ->",25);
	grd_desc[# 0,SV_i] = "Adjust the rate at which text crawls during dialogue.";
	grd_descLabel[# 0,SV_i] = "Game Settings";
	grd_scr[# 0,SV_i] = scr_menu_party_options_tog_txtSpeed;
	grd_toggle[# 0,SV_i] = true;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = scr_stringGapFormat("Window Opac.:","<- " + string(global.set_winTrans) + "% ->",25);
	grd_desc[# 0,SV_i] = "Adjust the transparency of menu panels and dialogue boxes.";
	grd_descLabel[# 0,SV_i] = "Game Settings";
	grd_scr[# 0,SV_i] = scr_menu_party_options_tog_winTrans;
	grd_toggle[# 0,SV_i] = true;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Return";
	grd_desc[# 0,SV_i] = "Return to previous menu.";
	grd_descLabel[# 0,SV_i] = "Back";
	grd_scr[# 0,SV_i] = scr_menu_back;
	
	scr_cEvent(id,EVENT_MENU_RESIZEPANEL);
}