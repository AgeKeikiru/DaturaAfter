
scr_trace(object_get_name(object_index) + " " + cName + " destroyed");

for(var _ix = 0;_ix < ds_grid_width(grd_skillAct);_ix++){
	for(var _iy = 0;_iy < ds_grid_height(grd_skillAct);_iy++){
		var _o = grd_skillAct[# _ix,_iy];
		
		if(scr_exists(_o,asset_object)){
			instance_destroy(_o);
		}
	}
}