/// @description Insert description here
// You can write your code in this editor

if(scr_exists(src,asset_object)){
	var _i = ds_list_find_index(src.lst_effects,id);
	
	if(_i != -1){
		ds_list_delete(src.lst_effects,_i);
	}
	
    scr_cEvent(src,EVENT_BATTLM_ICONREFRESH);
}