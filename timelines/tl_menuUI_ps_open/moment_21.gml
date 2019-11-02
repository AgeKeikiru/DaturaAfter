
transCurr = 0;
transTgt = 1;
txt_desc = "";
txt_descLabel = "";
txt_title = "PARTY";
txt_titleDesc = "Adjust party settings";
txt_ctrl[2] = "";
ps_baseMenuIndex = ds_stack_size(global.stk_menu);

ps_bg = instance_create_depth(0,0,0,obj_fpo_parent);
with ps_bg{
	visible = false;
	image_alpha = 0;
	tgt_alpha = .2;
	tween_alpha = true;
	sprite_index = layer_background_get_sprite(global.ly_bg[0]);
}

var SV_m = scr_createMenuPanel(80,200,540,500,"party/..");

with SV_m{
    extra_function = -1;
    
	ds_grid_resize(grd_txt,1,8);
	scr_menu_matchGrids(id,true);
	
	var SV_i = 0;
	
	grd_txt[# 0,SV_i] = "Check Items";
	grd_desc[# 0,SV_i] = "View and set consumable items.";
	grd_descLabel[# 0,SV_i] = "Inventory";
	grd_scr[# 0,SV_i] = scr_menu_party_item;
	grd_scr[# 0,SV_i] = noone;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Check Status";
	grd_desc[# 0,SV_i] = "View the stats of party members.";
	grd_descLabel[# 0,SV_i] = "Status";
	grd_scr[# 0,SV_i] = scr_menu_party_status;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Change Equipment";
	grd_desc[# 0,SV_i] = "Adjust equipped Act, Accessory, and Class chips.";
	grd_descLabel[# 0,SV_i] = "Equip";
	grd_scr[# 0,SV_i] = scr_menu_party_equip;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Mission Info";
	grd_desc[# 0,SV_i] = "Review mission info and conditions.";
	grd_descLabel[# 0,SV_i] = "Mission";
	grd_scr[# 0,SV_i] = instance_exists(obj_handler_dungeon) ? noone : noone;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Quests";
	grd_desc[# 0,SV_i] = "View and turn in active quests.";
	grd_descLabel[# 0,SV_i] = "Quest";
	grd_scr[# 0,SV_i] = scr_menu_party_quest;
	
	if(false){ //check if there are active completed quests
		grd_txt[# 0,SV_i] = "[!]" + grd_txt[# 0,SV_i];
	}
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Wiki";
	grd_desc[# 0,SV_i] = "View information on the world of Babel XR.";
	grd_descLabel[# 0,SV_i] = "Glossary";
	grd_scr[# 0,SV_i] = scr_menu_party_wiki;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Options";
	grd_desc[# 0,SV_i] = "Adjust game settings.";
	grd_descLabel[# 0,SV_i] = "Setting";
	grd_scr[# 0,SV_i] = scr_menu_party_options;
	
	SV_i++;
	
	grd_txt[# 0,SV_i] = "Title";
	grd_desc[# 0,SV_i] = "Return to title screen.";
	grd_descLabel[# 0,SV_i] = "Title";
	grd_scr[# 0,SV_i] = instance_exists(obj_handler_dungeon) ? noone : scr_menu_party_title;
	
	scr_cEvent_id(id,EVENT_MENU_RESIZEPANEL);
}