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
		    _y2 = _y1 + 18;
		    
		    draw_set_color(c_dkgray);
		    
		    draw_rectangle(_x1,_y1,_x2,_y2,false);
		    
		    draw_set_color(CC_ICEBLUE);
		    draw_set_alpha(sin(current_time / 200) > .75 && sin(current_time / 200) < .9);
		    
		    draw_rectangle(_x1,_y1,_x2,_y2,false);
		    
		    draw_set_color(_c);
		    draw_set_alpha(1);
		    
		    draw_rectangle(_x2,_y1,_x2 + -56,_y2 + -4,false);
		    draw_triangle(_x2 + -56,_y1 + -1,_x2 + -56,_y2 + -4,_x2 + -66,_y1 + -1,false);
		    
		    draw_set_color(c_dkgray);
		    draw_set_halign(fa_right);
		    draw_set_valign(fa_top);
		    draw_set_font(ft_dungeonBold);
		    
		    draw_text_transformed(_x2,_y1 + 1,"TRAP",1,1,0);
		
		    break;
	#endregion
	
	#region //battle_enemyHit
		case EVENT_BATTLE_ENEMYHIT:
			var
			_src = cArgs[| 0],
			_tgt = cArgs[| 1],
			_act = cArgs[| 2];
			
			if(scr_exists(src,asset_object) && _tgt == src && _act.tgtEnemy && ds_list_size(special) > 0){
				global.tempInt = _src;
				
				with(special[| 0]){
					scr_act_createEffect(obj_handler_actEffect_agnt_sTrap_counter,1,global.tempInt,0,false,special);
				}
				
				_src.hurtShake = 1;
				
				scr_createSpark(_src.x,_src.y,spr_spark_bash,"");
				
				global.tempInt = src;
				
				with obj_handler_act_agnt_capture{
					if(src == global.tempInt){
						cdCurr--;
						cdCurr = max(cdCurr,0);
					}
				}
				
				instance_destroy();
			}
			
			event_inherited();
			
			break;
	#endregion
	    
	default:
	    event_inherited();
}