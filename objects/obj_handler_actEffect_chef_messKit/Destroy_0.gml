
for(var _i = 0;_i < ds_list_size(lst_food);_i++){
	if(scr_exists(lst_food[| _i],asset_object)){
		instance_destroy(lst_food[| _i]);
	}
}