///@arg map
///@arg value

var
SV_map = argument0,
SV_r = ds_map_find_first(SV_map);
    	
while(!is_undefined(SV_r)){
	if(SV_map[? SV_r] == argument1){
		return SV_r;
	}
	
	SV_r = ds_map_find_next(SV_map,SV_r);
}

return undefined;