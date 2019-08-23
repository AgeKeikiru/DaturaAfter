
txt_desc = "";
txt_descLabel = "";
txt_title = "QUEST";
txt_titleDesc = "View and turn in active quests";

ps_portStatus = instance_create_depth(0,0,0,obj_fpo_parent);
with ps_portStatus{
    visible = false;
    tween_alpha = true;
    image_alpha = 0;
    tgt_alpha = 1;
}

var SV_m = scr_createMenuPanel(20,105,600,-1,"party/quest/..");

with SV_m{
    page_w = 1;
    page_h = 8;
    extra_function = -1;
    
	scr_refreshQuestList();
	
	scr_cEvent(id,EVENT_MENU_RESIZEPANEL);
}