global.labFunc = 0;

with ds_stack_top(global.stk_menu){
    visible = false;
    
    global.labFunc = menu_y % 2;
}

var SV_m = scr_createMenuPanel(20,105,500,-1,"menu/lab/class" + string(global.labFunc + 1) + "/..");

with SV_m{
    page_h = 8;
    
	ds_grid_resize(grd_txt,1,ds_list_size(global.lst_inv_classes) + 1);
	scr_menu_matchGrids(id,true);
	
	var SV_i = 0;
	
	for(SV_i = 0;SV_i < ds_list_size(global.lst_inv_classes);SV_i++){
	    var SV_obj = global.lst_inv_classes[| SV_i];
	    
    	grd_txt[# 0,SV_i] = SV_obj.name + " \"" + SV_obj.cName + "\"";
    	grd_desc[# 0,SV_i] = SV_obj.desc;
    	grd_descLabel[# 0,SV_i] = "Class Chip";
    	grd_scr[# 0,SV_i] = global.labFunc ? scr_menu_lab_class_rename : scr_menu_lab_class_upgrade;
    	grd_equipSrc[# 0,SV_i] = SV_obj;
    	
    	if(SV_obj.src != noone){
    		grd_txt[# 0,SV_i] = "[E]" + grd_txt[# 0,SV_i];
    		grd_descLabel[# 0,SV_i] = "E: " + SV_obj.src.src[? CHAR_VAR_NAMEDISP];
    	}
    }
	
	grd_txt[# 0,SV_i] = "Return";
	grd_desc[# 0,SV_i] = "Return to previous menu.";
	grd_descLabel[# 0,SV_i] = "Back";
	grd_scr[# 0,SV_i] = scr_menu_back;
	
	scr_cEvent(id,EVENT_MENU_RESIZEPANEL);
}