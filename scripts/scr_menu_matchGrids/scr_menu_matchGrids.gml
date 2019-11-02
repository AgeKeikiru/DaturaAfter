///@arg obj
///@arg initVals

with argument0{
    ds_grid_resize(grd_scr,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_desc,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_descLabel,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_equipSrc,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_toggle,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	ds_grid_resize(grd_page,ds_grid_width(grd_txt),ds_grid_height(grd_txt));
	
	if(argument1){
	    ds_grid_clear(grd_txt,"");
	    ds_grid_clear(grd_desc,"");
	    ds_grid_clear(grd_descLabel,"");
	    ds_grid_clear(grd_equipSrc,noone);
	    ds_grid_clear(grd_toggle,false);
	    ds_grid_clear(grd_page,0);
	}
}