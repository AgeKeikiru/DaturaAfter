///@arg obj
///@arg src
///@arg rare
///@arg stance
///@arg special

var
SV_r = instance_create_depth(0,0,0,argument0),
SV_src = argument1,
SV_rare = argument2,
SV_stance = argument3,
SV_special = argument4;

for(var SV_i = ds_list_size(SV_src.lst_effects) + -1;SV_i >= 0;SV_i--){
	var SV_obj = SV_src.lst_effects[| SV_i];
	
	if(!scr_exists(SV_obj,asset_object)){
		ds_list_delete(SV_src.lst_effects,SV_i);
	}else if(SV_obj.object_index == argument0){
		instance_destroy(SV_obj);
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

return SV_r;