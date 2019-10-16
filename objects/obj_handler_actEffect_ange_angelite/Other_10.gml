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
			    _xFill = _x2 + -(abs(_x1 + -_x2) * (charge + -floor(charge)));
			    
			    draw_set_color(c_dkgray);
			    
			    draw_rectangle(_x1,_y1,_x2,_y2,false);
			    
			    draw_set_color(CC_STANCE_ANGE);
			    draw_set_alpha(1);
			    
			    if(charge == special[| 0]){
			        draw_set_alpha((abs(sin(current_time / 400)) * .3) + .7);
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
			    
			    draw_text_transformed(_x2,_y1 + 1,"agl:" + string(floor(charge)),1,1,0);
		    }
		
		    break;
	#endregion
	    
	#region //battle_enemyHit
		case EVENT_BATTLE_ENEMYHIT:
			var
			_src = cArgs[| 0],
			_tgt = cArgs[| 1],
			_act = cArgs[| 2];
			
			if(scr_exists(src,asset_object) && _src == src && ds_list_size(special) > 0){
				var _add = .05;
				
				global.tempFloat = 0;
				scr_cEvent(EVENT_ANGE_ANGELITEGAINMOD,src,typeCurr != _act.atkScale,_act.ele == CHAR_VAR_ELE_LGT);
				_add += _add * global.tempFloat;
				
				charge = min(charge + _add,special[| 0]);
				
				if(_act.hitLoopRemaining == 1){
					typeCurr = _act.atkScale;
				}
			}
			
			event_inherited();
			
			break;
	#endregion
	    
	default:
	    event_inherited();
}