
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
    
	ds_grid_resize(grd_txt,ds_list_size(global.lst_activePartySlots),12);
	ds_grid_resize(grd_scr,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_desc,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_descLabel,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	
	for(var SV_i = 0;SV_i < ds_list_size(global.lst_activePartySlots);SV_i++){ //menu x
    	var
    	SV_i2 = 0, //menu y
    	SV_memX = global.lst_activePartySlots[| SV_i],
    	SV_mem = global.grd_party_player[# SV_memX,0];
    	
    	repeat(8){
        	grd_txt[# SV_i,SV_i2] = "ACT" + string(SV_i2) + ": ";
        	grd_desc[# SV_i,SV_i2] = "Nothing equipped.";
        	grd_descLabel[# SV_i,SV_i2] = "Act Chip";
        	grd_scr[# SV_i,SV_i2] = scr_menu_party_equip_changeAct;
        	
        	var SV_obj = SV_mem.act[SV_i2];
        	
        	if(SV_obj != noone && SV_obj != undefined){
        	    grd_txt[# SV_i,SV_i2] += SV_obj.name;
        	    grd_desc[# SV_i,SV_i2] = SV_obj.desc;
        	}else{
        	    grd_txt[# SV_i,SV_i2] += "-none-";
        	}
        	
        	SV_i2++;
    	}
    	
    	repeat(2){
        	grd_txt[# SV_i,SV_i2] = "ARM" + string(SV_i2 + -8) + ": ";
        	grd_desc[# SV_i,SV_i2] = "Nothing equipped.";
        	grd_descLabel[# SV_i,SV_i2] = "Armor Chip";
        	grd_scr[# SV_i,SV_i2] = scr_menu_party_equip_changeArm;
        	
        	var SV_obj = SV_mem.src[? "char_var_arm" + string(SV_i2 + -8)];
        	
        	if(SV_obj != noone && SV_obj != undefined){
        	    grd_txt[# SV_i,SV_i2] += SV_obj.name;
        	    grd_desc[# SV_i,SV_i2] = SV_obj.desc;
        	}else{
        	    grd_txt[# SV_i,SV_i2] += "-none-";
        	}
        	
        	SV_i2++;
    	}
    	
    	repeat(1){
        	grd_txt[# SV_i,SV_i2] = "CLS" + string(SV_i2 + -10) + ": ";
        	grd_desc[# SV_i,SV_i2] = "Nothing equipped.";
        	grd_descLabel[# SV_i,SV_i2] = "Class Chip";
        	grd_scr[# SV_i,SV_i2] = scr_menu_party_equip_changeClass;
        	
        	var SV_obj = SV_mem.class[SV_i2 + -10];
        	
        	if(SV_obj != noone && SV_obj != undefined){
        	    grd_txt[# SV_i,SV_i2] += SV_obj.name + " \"" + SV_obj.cName + "\"";
        	    grd_desc[# SV_i,SV_i2] = SV_obj.desc;
        	}else{
        	    grd_txt[# SV_i,SV_i2] += "-none-";
        	}
        	
        	SV_i2++;
    	}
    	
    	grd_txt[# SV_i,SV_i2] = "Return";
    	grd_desc[# SV_i,SV_i2] = "Return to previous menu.";
    	grd_descLabel[# SV_i,SV_i2] = "Back";
    	grd_scr[# SV_i,SV_i2] = scr_menu_back;
	}
	
	scr_cEvent(id,EVENT_MENU_RESIZEPANEL);
}