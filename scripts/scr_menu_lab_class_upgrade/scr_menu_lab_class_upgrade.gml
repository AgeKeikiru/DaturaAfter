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
	var
	_w = ds_grid_width(global.labObj.grd_skills) + 1,
	_h = ds_grid_height(global.labObj.grd_skills);
	
	extra_function = -1;
	link_panel.tween_xPos = true;
	
	ds_grid_resize(grd_txt,_w,_h);
	scr_menu_matchGrids(id,true);
	
	grd_ex_icon = ds_grid_create(_w,_h);
	grd_ex_str = ds_grid_create(_w,_h);
	
	var
	SV_ix = 0,
	SV_iy = 0;
	
	grd_txt[# SV_ix,SV_iy] = global.labObj.ms_name;
	grd_desc[# SV_ix,SV_iy] = global.labObj.ms_desc;
	grd_descLabel[# SV_ix,SV_iy] = grd_txt[# SV_ix,SV_iy];
	grd_scr[# SV_ix,SV_iy] = noone;
	grd_ex_icon[# SV_ix,SV_iy] = global.labObj.ms_icon;
	grd_ex_str[# SV_ix,SV_iy] = "Main";
	
	SV_iy++;
	
	grd_txt[# SV_ix,SV_iy] = global.labObj.ss_name;
	grd_desc[# SV_ix,SV_iy] = global.labObj.ss_desc;
	grd_descLabel[# SV_ix,SV_iy] = grd_txt[# SV_ix,SV_iy];
	grd_scr[# SV_ix,SV_iy] = scr_menu_lab_class_upgradeConfirm;
	grd_ex_icon[# SV_ix,SV_iy] = global.labObj.ss_icon;
	grd_ex_str[# SV_ix,SV_iy] = "";
	
	SV_iy++;
	
	grd_txt[# SV_ix,SV_iy] = "Return";
	grd_desc[# SV_ix,SV_iy] = "Return to previous menu.";
	grd_descLabel[# SV_ix,SV_iy] = "Back";
	grd_scr[# SV_ix,SV_iy] = scr_menu_back;
	grd_ex_icon[# SV_ix,SV_iy] = spr_backIcon;
	grd_ex_str[# SV_ix,SV_iy] = "";
	
	repeat(ds_grid_width(global.labObj.grd_skills)){
	    SV_iy = 0;
	    
	    repeat(ds_grid_height(global.labObj.grd_skills)){
        	grd_txt[# SV_ix + 1,SV_iy] = global.labObj.grd_skillName[# SV_ix,SV_iy];
        	grd_desc[# SV_ix + 1,SV_iy] = global.labObj.grd_skillDesc[# SV_ix,SV_iy];
        	grd_descLabel[# SV_ix + 1,SV_iy] = grd_txt[# SV_ix + 1,SV_iy];
        	grd_scr[# SV_ix + 1,SV_iy] = scr_menu_lab_class_upgradeConfirm;
        	grd_ex_icon[# SV_ix + 1,SV_iy] = global.labObj.grd_skillIcon[# SV_ix,SV_iy];
			grd_ex_str[# SV_ix + 1,SV_iy] = "";
        	
        	SV_iy++;
	    }
	    
	    SV_ix++;
    }
	
	scr_cEvent_id(id,EVENT_MENU_RESIZEPANEL);
}

global.labMenu = SV_m;