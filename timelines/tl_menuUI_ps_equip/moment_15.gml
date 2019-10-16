
txt_desc = "";
txt_descLabel = "";
txt_title = "EQUIP";
txt_titleDesc = "Adjust equipped Act, Armor, and Class chips";

ps_portEquip = instance_create_depth(0,0,0,obj_fpo_parent);
with ps_portEquip{
    visible = false;
    tween_alpha = true;
    image_alpha = 0;
    tgt_alpha = 1;
}

var SV_m = scr_createMenuPanel(20,105,500,-1,"party/equip/..");

with SV_m{
    page_w = 1;
    page_h = 8;
    extra_function = -1;
    
	scr_refreshEquips();
	
	scr_cEvent_id(id,EVENT_MENU_RESIZEPANEL);
}