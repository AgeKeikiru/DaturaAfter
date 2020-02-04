ds_list_destroy(lst_statusIcons);
ds_list_destroy(lst_effects);
ds_list_destroy(cArgs);

if(sprite_exists(sprite_index)){
	sprite_delete(sprite_index);
}