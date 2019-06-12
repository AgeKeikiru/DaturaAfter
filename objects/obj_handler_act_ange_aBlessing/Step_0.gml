/// @description Insert description here
// You can write your code in this editor
event_inherited();

if(scr_exists(src,asset_object) && scr_exists(src.stance,asset_object) && src.stance.object_index == obj_handler_actEffect_ange_angelite){
	if(src.stance.charge < 3){
	    usable = false;
	}
}else{
    usable = false;
}