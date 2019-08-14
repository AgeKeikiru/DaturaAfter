
for(var _ix = 0;_ix < ds_grid_width(grd_skillAct);_ix++){
	for(var _iy = 0;_iy < ds_grid_height(grd_skillAct);_iy++){
		var _o = grd_skillAct[# _ix,_iy];
		
		if(scr_exists(_o,asset_object)){
			if(_o.stanceAct){
				grd_skillDesc[# _ix,_iy] = "[Stance] " + grd_skillDesc[# _ix,_iy];
			}
			
			if(_o.xAct){
				grd_skillDesc[# _ix,_iy] = "[X Act] " + grd_skillDesc[# _ix,_iy];
			}
			
			if(_o.agileAct){
				grd_skillDesc[# _ix,_iy] = "[Agile] " + grd_skillDesc[# _ix,_iy];
			}
		}
	}
}