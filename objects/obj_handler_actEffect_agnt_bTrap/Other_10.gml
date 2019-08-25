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
		    
		    draw_set_color(CC_FIRRED);
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
				var _grd = src.enemyParty;
				
				for(var _i = 0;_i < ds_grid_width(_grd);_i++){
					var _o = _grd[# _i,0];
					
					if(scr_exists(_o,asset_object) && _o.hpCurr > 0){
						var _dmg = max(src.fAtk,10) * 20;
						_dmg *= (100 + _o.ele_fir) / 100;
						
						scr_createEffectTxt(_o,string(_dmg));
						
						_o.hpCurr = max(_o.hpCurr + -_dmg,1);
						_o.hurtShake = 1;
						
						scr_createSpark(_o.x,_o.y,spr_spark_bash,CHAR_VAR_ELE_FIR);
						
						scr_inflictAilment(src,_o,CHAR_SA_BRN,special[| 0],6);
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