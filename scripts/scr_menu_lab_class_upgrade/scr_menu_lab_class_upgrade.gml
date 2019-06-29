global.labObj = noone;

with ds_stack_top(global.stk_menu){
    visible = false;
    
    global.labObj = grd_equipSrc[# menu_x,menu_y];
}

with obj_handler_menuUI{
    highlight_x = 0;
}

var SV_m = scr_createMenuPanel(-9999,-9999,-1,-1,"menu/lab/class1/upgrade/..");

with SV_m{
	ds_grid_resize(grd_txt,ds_grid_width(global.labObj.grd_skills) + 1,ds_grid_height(global.labObj.grd_skills));
	ds_grid_resize(grd_scr,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_desc,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_descLabel,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_equipSrc,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	
	var
	SV_ix = 0,
	SV_iy = 0;
	
	grd_txt[# SV_ix,SV_iy] = global.labObj.ms_name;
	grd_desc[# SV_ix,SV_iy] = global.labObj.ms_desc;
	grd_descLabel[# SV_ix,SV_iy] = grd_txt[# SV_ix,SV_iy];
	grd_scr[# SV_ix,SV_iy] = noone;
	
	SV_iy++;
	
	grd_txt[# SV_ix,SV_iy] = global.labObj.ss_name + " Lv." + string(global.labObj.ss_level);
	grd_desc[# SV_ix,SV_iy] = global.labObj.ss_desc;
	grd_descLabel[# SV_ix,SV_iy] = grd_txt[# SV_ix,SV_iy];
	grd_scr[# SV_ix,SV_iy] = scr_menu_lab_class_upgradeConfirm;
	
	SV_iy++;
	
	grd_txt[# SV_ix,SV_iy] = "Return";
	grd_desc[# SV_ix,SV_iy] = "Return to previous menu.";
	grd_descLabel[# SV_ix,SV_iy] = "Back";
	grd_scr[# SV_ix,SV_iy] = scr_menu_back;
	
	repeat(ds_grid_width(global.labObj.grd_skills)){
	    SV_iy = 0;
	    
	    repeat(ds_grid_height(global.labObj.grd_skills)){
        	grd_txt[# SV_ix + 1,SV_iy] = global.labObj.grd_skillName[# SV_ix,SV_iy] + " Lv." + string(global.labObj.grd_skills[# SV_ix,SV_iy]);
        	grd_desc[# SV_ix + 1,SV_iy] = global.labObj.grd_skillDesc[# SV_ix,SV_iy];
        	grd_descLabel[# SV_ix + 1,SV_iy] = grd_txt[# SV_ix + 1,SV_iy];
        	grd_scr[# SV_ix + 1,SV_iy] = scr_menu_lab_class_upgradeConfirm;
        	
        	SV_iy++;
	    }
	    
	    SV_ix++;
    }
	
	scr_cEvent(id,EVENT_MENU_RESIZEPANEL);
}