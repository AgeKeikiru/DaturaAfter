/// @description Insert description here

if(ds_list_size(special) > 1){
	duration = special[| 0];
	
	aggro = special[| 1];
}

durMax = duration;

event_inherited();