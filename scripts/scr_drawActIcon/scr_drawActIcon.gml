///@arg x
///@arg y
///@arg size
///@arg act
///@arg col1
///@arg col2
///@arg angle
///@arg using

var
SV_x = argument0,
SV_y = argument1,
SV_size = argument2,
SV_act = argument3,
SV_col1 = argument4,
SV_col2 = argument5,
SV_a = argument6,
SV_using = argument7;

if(SV_using){
	var
	_glowAlpha = ((sin(current_time / 100) + 1) / 20) + .5,
	_glowSize = 1;
	
	draw_set_color(c_yellow);
	
	repeat(3){
		draw_set_alpha(_glowAlpha);
		
		scr_drawDiamond(SV_x + -_glowSize,SV_y + -_glowSize,SV_size + (_glowSize * 2),SV_size + (_glowSize * 2),SV_a);
		
		_glowSize++;
	}
}

draw_set_alpha(1);
draw_set_color(instance_exists(SV_act) ? SV_col1 : SV_col2);

if(scr_exists(SV_act,asset_object)){
	draw_set_color(!SV_act.usable ? c_red : (SV_act.xAct ? CC_STANCE_EVOK : SV_col1));
}else{
	draw_set_color(SV_col2);
}

scr_drawDiamond(SV_x,SV_y,SV_size,SV_size,SV_a);

if(instance_exists(SV_act)){
	draw_set_alpha(1);
	
	draw_sprite_ext(SV_act.icon,0,SV_x,SV_y,1,1,SV_a,c_white,1);
	
	switch SV_act.ele{
		case CHAR_VAR_ELE_FIR:
			draw_set_color(CC_FIRRED);
			break;
		case CHAR_VAR_ELE_ICE:
			draw_set_color(CC_ICEBLUE);
			break;
		case CHAR_VAR_ELE_NAT:
			draw_set_color(CC_NATGREEN);
			break;
		case CHAR_VAR_ELE_ELC:
			draw_set_color(CC_ELCYELLOW);
			break;
		case CHAR_VAR_ELE_DRK:
			draw_set_color(CC_DRKVIOLET);
			break;
		case CHAR_VAR_ELE_LGT:
			draw_set_color(CC_LGTBEIGE);
			break;
		default:
			draw_set_color(c_white);
			break;
	}
	
	if(draw_get_colour() != c_white){
		draw_sprite_ext(spr_icon_eleFrame,0,SV_x,SV_y,1,1,SV_a,draw_get_colour(),1);
	}
	
	draw_set_color(c_black);
	draw_set_alpha(.5);

	scr_drawDiamond(SV_x,SV_y,SV_size,SV_size * (SV_act.cdCurr / SV_act.cdMax),SV_a);
	
	if(SV_act.cdCurr > 0){
		draw_set_alpha(.2);
		
		scr_drawDiamond(SV_x,SV_y,SV_size,SV_size,SV_a);
		
		draw_set_alpha(.5);
	}
}