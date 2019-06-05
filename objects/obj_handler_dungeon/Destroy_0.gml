/// @description Insert description here

while(!ds_map_empty(map_results)){
	instance_destroy(map_results[? ds_map_find_first(map_results)]);
	ds_map_delete(map_results,ds_map_find_first(map_results));
}