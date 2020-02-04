scr_cEvent(EVENT_BATTLM_INIT);

with ds_stack_top(global.stk_menu){
    ds_grid_resize(grd_txt,ds_list_size(global.lst_activePartySlots),12);
    scr_menu_matchGrids(id,true);
    
    for(var SV_i = 0;SV_i < ds_list_size(global.lst_activePartySlots);SV_i++){ //menu x
    	var
    	SV_i2 = 0, //menu y
    	SV_memX = global.lst_activePartySlots[| SV_i],
    	SV_mem = global.grd_party_player[# SV_memX % 3,SV_memX > 2],
    	_guest = scr_exists(SV_mem) && SV_mem.src[? en_charVar.guest];
    	
    	repeat(8){
        	grd_txt[# SV_i,SV_i2] = "ACT" + string(SV_i2) + ": ";
        	grd_desc[# SV_i,SV_i2] = "Nothing equipped.";
        	grd_descLabel[# SV_i,SV_i2] = "Act Slot";
        	grd_scr[# SV_i,SV_i2] = _guest ? noone : scr_menu_party_equip_changeAct;
        	
        	var SV_obj = SV_mem.act[SV_i2];
        	
        	if(scr_exists(SV_obj)){
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
        	grd_descLabel[# SV_i,SV_i2] = "Armor Slot";
        	grd_scr[# SV_i,SV_i2] = _guest ? noone : scr_menu_party_equip_changeArm;
        	
        	var SV_obj = SV_mem.src[? en_charVar.hb0 + SV_i2];
        	
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
        	grd_descLabel[# SV_i,SV_i2] = "Class Slot";
        	grd_scr[# SV_i,SV_i2] = _guest ? noone : scr_menu_party_equip_changeClass;
        	
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
}