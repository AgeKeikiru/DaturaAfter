///@arg obj
///@arg initVals

with argument0{
    ds_grid_resize(grd_scr,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_desc,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_descLabel,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_equipSrc,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_toggle,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	
	if(argument1){
	    ds_grid_set_region(grd_txt,0,0,ds_grid_width(grd_txt) + -1,ds_grid_height(grd_txt) + -1,"");
	    ds_grid_set_region(grd_desc,0,0,ds_grid_width(grd_txt) + -1,ds_grid_height(grd_txt) + -1,"");
	    ds_grid_set_region(grd_descLabel,0,0,ds_grid_width(grd_txt) + -1,ds_grid_height(grd_txt) + -1,"");
	    ds_grid_set_region(grd_equipSrc,0,0,ds_grid_width(grd_txt) + -1,ds_grid_height(grd_txt) + -1,noone);
	    ds_grid_set_region(grd_toggle,0,0,ds_grid_width(grd_txt) + -1,ds_grid_height(grd_txt) + -1,false);
	}
}