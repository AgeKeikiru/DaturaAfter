/// @description Insert description here
// You can write your code in this editor

switch(cEvent){
	#region //stanceDraw
		case EVENT_EFFECT_STANCEDRAW:
		    event_inherited();
		    
		    var
		    _x1 = cArgs[| 0] + 3,
		    _y1 = cArgs[| 1] + 3,
		    _c = cArgs[| 2],
		    _x2 = _x1 + 95,
		    _y2 = _y1 + 18,
		    _xFill = _x2 + -(abs(_x1 + -_x2) * (duration / durMax));
		    
		    draw_set_color(c_dkgray);
		    
		    draw_rectangle(_x1,_y1,_x2,_y2,false);
		    
		    draw_set_color(CC_STANCE_RAZE);
		    draw_set_alpha(1);
		    
		    draw_rectangle(_xFill,_y1,_x2,_y2,false);
		    
		    draw_set_color(_c);
		    draw_set_alpha(1);
		    
		    draw_rectangle(_x2,_y1,_x2 + -56,_y2 + -4,false);
		    draw_triangle(_x2 + -56,_y1 + -1,_x2 + -56,_y2 + -4,_x2 + -66,_y1 + -1,false);
		    
		    draw_set_color(c_dkgray);
		    draw_set_halign(fa_right);
		    draw_set_valign(fa_top);
		    draw_set_font(ft_dungeonBold);
		    
		    draw_text_transformed(_x2,_y1 + 1,"DRAK",1,1,0);
		
		    break;
	#endregion
	    
	default:
	    event_inherited();
}