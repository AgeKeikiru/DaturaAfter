/// @description Insert description here
// You can write your code in this editor

switch(cEvent){
	#region //effect_stanceDraw
		case EVENT_EFFECT_STANCEDRAW:
		    event_inherited();
		    
		    if(ds_list_size(special) > 0){
			    var
			    _x1 = cArgs[| 0] + 3,
			    _y1 = cArgs[| 1] + 3,
			    _c = cArgs[| 2],
			    _x2 = _x1 + 95,
			    _y2 = _y1 + 18,
			    _xFill = _x2 + -(abs(_x1 + -_x2) * (map_statMod[? CHAR_VAR_MATK] / special[| 1]));
			    
			    draw_set_color(c_dkgray);
			    
			    draw_rectangle(_x1,_y1,_x2,_y2,false);
			    
			    draw_set_color(CC_STANCE_RAZE);
			    draw_set_alpha(1);
			    
			    if(map_statMod[? CHAR_VAR_MATK] == special[| 1]){
			        draw_set_alpha((ceil(sin(current_time / 25)) * .3) + .7);
			        _xFill = _x1;
			    }
			    
			    draw_rectangle(_xFill,_y1,_x2,_y2,false);
			    
			    draw_set_color(_c);
			    draw_set_alpha(1);
			    
			    draw_rectangle(_x2,_y1,_x2 + -56,_y2 + -4,false);
			    draw_triangle(_x2 + -56,_y1 + -1,_x2 + -56,_y2 + -4,_x2 + -66,_y1 + -1,false);
			    
			    draw_set_color(c_dkgray);
			    draw_set_halign(fa_right);
			    draw_set_valign(fa_top);
			    draw_set_font(ft_dungeonBold);
			    
			    draw_text_transformed(_x2,_y1 + 1,"atk+",1,1,0);
		    }
		
		    break;
	#endregion
	    
	#region //battle_enemyHit
		case EVENT_BATTLE_ENEMYHIT:
			var
			_src = cArgs[| 0],
			_tgt = cArgs[| 1],
			_act = cArgs[| 2];
			
			if(scr_exists(src,asset_object) && _src == src && ds_list_size(special) > 1){
				map_statMod[? CHAR_VAR_MATK] = min(map_statMod[? CHAR_VAR_MATK] + gainRate,special[| 1]);
				
				map_statMod[? CHAR_VAR_FATK] = map_statMod[? CHAR_VAR_MATK];
				map_statMod[? CHAR_VAR_SATK] = map_statMod[? CHAR_VAR_MATK];
			}
			
			event_inherited();
			
			break;
	#endregion
	    
	default:
	    event_inherited();
}