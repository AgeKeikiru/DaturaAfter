/// @description Insert description here
// You can write your code in this editor

switch(cEvent){
	#region //effect_stanceDraw
		case EVENT_EFFECT_STANCEDRAW:
		    event_inherited();
		    
		    if(ds_list_size(special) > 0){
			    var
			    _x = cArgs[| 0] + 3,
			    _y = cArgs[| 1] + 3,
			    _c = cArgs[| 2],
			    _x2 = _x + 95,
			    _y2 = _y + 18,
			    _size = 8,
			    _gap = (_size * 2) + 3,
			    _fx = _x + _size + 1,
			    _fy = _y2 + -(_size / 2) + -4;
			    
			    for(var _i = 0;_i < special[| 0];_i++){
			    	draw_set_color(c_dkgray);
			    	
			    	if(ds_list_size(lst_food) > _i){
			    		switch lst_food[| _i].special[| 0]{
			    			case FOOD_ATK: draw_set_color(CC_FIRRED);
			    				break;
			    			case FOOD_DEF: draw_set_color(CC_ICEBLUE);
			    				break;
			    			case FOOD_ACC: draw_set_color(CC_NATGREEN);
			    				break;
			    			case FOOD_EVA: draw_set_color(CC_ELCYELLOW);
			    				break;
			    			case FOOD_SPD: draw_set_color(CC_LGTBEIGE);
			    				break;
			    			case FOOD_EN: draw_set_color(CC_DRKVIOLET);
			    				break;
			    				
			    			case FOOD_HP: draw_set_color(c_ltgray);
			    				break;
			    			case FOOD_WIDE: draw_set_color(CC_SUPERFLOUR);
			    				break;
			    			case FOOD_MULTI: draw_set_color(CC_DOUBLEGUM);
			    				break;
			    		}
			    	}
			    	
			    	draw_circle(_fx,_fy,_size,false);
			    	
			    	_fx += _gap;
			    }
			    
			    draw_set_color(_c);
			    draw_set_alpha(1);
			    
			    draw_rectangle(_x2,_y,_x2 + -39,_y + 9,false);
			    
			    draw_set_color(c_dkgray);
			    draw_set_halign(fa_right);
			    draw_set_valign(fa_top);
			    draw_set_font(ft_dungeonBold);
			    
			    var _scale = special[| 0] > 2 ? .7 : 1;
			    
			    draw_text_transformed(_x2,_y,"food",_scale,_scale,0);
		    }
		
		    break;
	#endregion
	
	#region //chef_addFood
		case EVENT_CHEF_ADDFOOD:
			var
			_src = cArgs[| 0],
			_eff = cArgs[| 1];
			
			if(scr_exists(src,asset_object) && _src == src && ds_list_size(special) > 0){
				ds_list_insert(lst_food,0,_eff);
				
				while(ds_list_size(lst_food) > special[| 0]){
					var _i = ds_list_size(lst_food) + -1;
					
					if(scr_exists(lst_food[| _i],asset_object)){
						instance_destroy(lst_food[| _i]);
					}
					
					ds_list_delete(lst_food,_i);
				}
			}
			
			break;
	#endregion
	    
	default:
	    event_inherited();
}