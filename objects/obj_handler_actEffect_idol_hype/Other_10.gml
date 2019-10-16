/// @description Insert description here
// You can write your code in this editor

switch(cEvent){
	#region //effect_stanceDraw
		case EVENT_EFFECT_STANCEDRAW:
		    event_inherited();
		    
		    var
		    _x1 = cArgs[| 0] + 3,
		    _y1 = cArgs[| 1] + 3,
		    _c = cArgs[| 2],
		    _x2 = _x1 + 95,
		    _y2 = _y1 + 18,
		    _xFill = _x2 + -(abs(_x1 + -_x2) * (charge + -floor(charge)));
		    
		    draw_set_color(c_dkgray);
		    
		    draw_rectangle(_x1,_y1,_x2,_y2,false);
		    
		    draw_set_color(CC_STANCE_IDOL);
		    draw_set_alpha(1);
		    
		    if(charge > 5){
		        draw_set_alpha((abs(sin(current_time / 400)) * .3) + .7);
		        
		        if(charge == 6){
		        	_xFill = _x1;
		        }
		    }
		    
		    if(decayDelay <= 0){
		    	draw_set_alpha(.8);
		    }
		    
		    if(finaleMode){
		    	draw_set_alpha((abs(sin(current_time / 2)) * .1) + .9);
		    	draw_set_color(make_color_hsv((current_time / 1) mod 256,255,255));
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
		    
		    draw_text_transformed(_x2,_y1 + 1,"hyp:" + string(floor(charge)),1,1,0);
		
		    break;
	#endregion
	    
	#region //battle_enemyHit
		case EVENT_BATTLE_ENEMYHIT:
			var
			_src = cArgs[| 0],
			_tgt = cArgs[| 1],
			_act = cArgs[| 2],
			_dmg = cArgs[| 3];
			
			if(scr_exists(src,asset_object) && _src == src && ds_list_size(special) > 4){
				var
				_add = special[| 0] * _dmg,
				_prev = floor(charge);
				
				global.tempBool = false;
				global.tempGrd = src.allyParty;
				global.tempObj = src;
				
				with obj_handler_act{
					if(using && scr_exists(src,asset_object) && src != global.tempObj && src.allyParty == global.tempGrd){
						global.tempBool = true;
					}
				}
				
				if(global.tempBool){
					_add += _add * special[| 1];
					scr_trace("[Hype Boost Teamwork] hype gain boost: " + string(special[| 1] * 100) + "%");
				}
				
				charge = min(charge + _add,6);
				
				decayDelay = room_speed * 3;
				
				var _boost = special[| 4];
				
				decayDelay += room_speed * _boost;
				scr_trace("[Stage Presence] decayDelay extend: +" + string(_boost) + "sec");
				
				if(floor(charge) != _prev){
					aggro = floor(charge);
					scr_cEvent_id(src,EVENT_BATTLM_ICONREFRESH);
				}
			}
			
			event_inherited();
			
			break;
	#endregion
	    
	default:
	    event_inherited();
}