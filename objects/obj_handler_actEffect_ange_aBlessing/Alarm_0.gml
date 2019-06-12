/// @description Insert description here

event_inherited();

if(scr_exists(src,asset_object) && ds_list_size(special) > 0){
	src.enCurr = src.enMax;
	
	duration = special[| 0];
}