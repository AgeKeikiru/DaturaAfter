///@arg obj
///@arg chance
///@arg src
///@arg rare
///@arg stance
///@arg special

var
SV_r = noone,
SV_chance = argument1,
SV_src = argument2,
SV_rare = argument3,
SV_stance = argument4;

if(object_exists(argument0) && random(1) < SV_chance){
	SV_r = instance_create_depth(0,0,0,argument0);
	
	var SV_special = ds_list_create();
	
	ds_list_copy(SV_special,argument5);
	
	for(var SV_i = ds_list_size(SV_src.lst_effects) + -1;SV_i >= 0;SV_i--){
		var SV_obj = SV_src.lst_effects[| SV_i];
		
		if(!scr_exists(SV_obj,asset_object)){
			ds_list_delete(SV_src.lst_effects,SV_i);
		}else if(SV_obj.object_index == argument0){
			switch(argument0){
				case obj_handler_actEffect_chef_food:
					break;
				default:
					instance_destroy(SV_obj);
					break;
			}
		}
	}
		
	ds_list_add(SV_src.lst_effects,SV_r);
	SV_r.name = name;
	SV_r.src = SV_src;
	SV_r.rare = SV_rare;
	SV_r.special = SV_special;
	
	if(SV_stance){
		if(scr_exists(SV_src.stance,asset_object)){
			instance_destroy(SV_src.stance);
		}
		
		SV_src.stance = SV_r;
	}
}

return SV_r;