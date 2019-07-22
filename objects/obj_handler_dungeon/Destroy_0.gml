/// @description Insert description here

while(!ds_map_empty(map_results)){
	var _o = map_results[? ds_map_find_first(map_results)];
	
	if(scr_exists(_o,asset_object) && (object_is_ancestor(_o.object_index,obj_fpo_parent) || _o.object_index == obj_fpo_parent)){
		instance_destroy(_o);
	}
	
	ds_map_delete(map_results,ds_map_find_first(map_results));
}