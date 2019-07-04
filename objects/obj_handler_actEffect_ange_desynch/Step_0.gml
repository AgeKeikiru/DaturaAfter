/// @description Insert description here
// You can write your code in this editor
event_inherited();

if(
	scr_exists(src,asset_object)
	&& scr_exists(src.stance,asset_object)
	&& src.stance.object_index == obj_handler_actEffect_ange_angelite
	&& ds_list_size(special) > 0
){
	src.iFrames = 2;
	src.stance.charge += -scr_timeMod(special[| 0]);
	
	if(src.stance.charge <= 0){
		src.stance.charge = 0;
		instance_destroy();
	}
}