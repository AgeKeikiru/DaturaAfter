///@arg x
///@arg y
///@arg spr
///@arg ele

var
SV_x = argument0,
SV_y = argument1,
SV_spr = argument2,
SV_ele = argument3,
SV_r = noone,
SV_c = c_white;

switch(SV_ele){
    case CHAR_VAR_ELE_FIR: SV_c = CC_FIRRED;
        break;
    case CHAR_VAR_ELE_ICE: SV_c = CC_ICEBLUE;
        break;
    case CHAR_VAR_ELE_ELC: SV_c = CC_ELCYELLOW;
        break;
    case CHAR_VAR_ELE_NAT: SV_c = CC_NATGREEN;
        break;
    case CHAR_VAR_ELE_LGT: SV_c = CC_LGTBEIGE;
        break;
    case CHAR_VAR_ELE_DRK: SV_c = CC_DRKVIOLET;
        break;
}

if(scr_exists(SV_spr,asset_sprite)){
	SV_r = instance_create_depth(SV_x,SV_y,-999,obj_fpo_parent);
	SV_r.sprite_index = SV_spr;
	SV_r.image_angle = random(360);
	SV_r.alarm[0] = sprite_get_number(SV_r.sprite_index);
	SV_r.image_blend = SV_c;
	
	switch(SV_spr){
	    case spr_spark_dot:
	        SV_r.image_angle = 90;
	    
	        repeat(irandom_range(6,12)){
				var SV_p = instance_create_depth(SV_x + random_range(-50,50),SV_y + random_range(-20,20),-999,obj_fpo_parent);
				SV_p.sprite_index = spr_spark_dot;
				SV_p.image_blend = SV_c;
				SV_p.image_angle = 90;
				SV_p.image_xscale = random_range(.5,2);
				SV_p.image_yscale = SV_p.image_xscale;
				SV_p.alarm[1] = sprite_get_number(SV_p.sprite_index) + random_range(5,30);
				SV_p.alarm[0] = SV_p.alarm[1] + 10;
			}
	        
	        break;
	    
		default:
			var _a = random_range(0,360);
		
			repeat(irandom_range(6,12)){
				var SV_p = instance_create_depth(SV_x + lengthdir_x(random_range(5,40),_a),SV_y + lengthdir_y(random_range(5,40),_a),-999,obj_fpo_parent);
				SV_p.sprite_index = spr_spark_dot;
				SV_p.image_blend = SV_c;
				SV_p.image_angle = _a;
				SV_p.image_xscale = random_range(.5,2);
				SV_p.image_yscale = SV_p.image_xscale;
				SV_p.alarm[1] = sprite_get_number(SV_p.sprite_index) + random_range(5,30);
				SV_p.alarm[0] = SV_p.alarm[1] + 10;
				
				_a += random_range(60,120);
			}
			
			break;
	}
}

return SV_r;