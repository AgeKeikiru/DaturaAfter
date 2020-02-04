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
		    _tW = 8,
		    _tH = 9,
		    _tGap = 3,
		    _tX = _x1 + _tW,
		    _tY = _y1 + _tH;
		    
		    draw_set_color(_c);
		    
		    draw_rectangle(_x1,_y1,_x2,_y2,false);
		    
		    for(var _i = 5;_i >= 0;_i--){
		        var
		        _flip = (_i mod 2) ? -1 : 1,
		        _iOff = -en_charVar.ele_fir,
		        _cArr = [0,0,0,0,0,0];
		        
		        _cArr[en_charVar.ele_fir + _iOff] = CC_FIRRED;
		        _cArr[en_charVar.ele_ice + _iOff] = CC_ICEBLUE;
		        _cArr[en_charVar.ele_nat + _iOff] = CC_NATGREEN;
		        _cArr[en_charVar.ele_elc + _iOff] = CC_ELCYELLOW;
		        _cArr[en_charVar.ele_lgt + _iOff] = CC_LGTBEIGE;
		        _cArr[en_charVar.ele_drk + _iOff] = CC_DRKVIOLET;
		        
		        draw_set_color((ds_list_size(lst_deck) > _i) ? _cArr[lst_deck[| _i]] : c_dkgray);
		        
		        draw_triangle(
		            _tX + -_tW,
		            _tY + (_tH * _flip),
		            
		            _tX + _tW,
		            _tY + (_tH * _flip),
		            
		            _tX,
		            _tY + -(_tH * _flip),
		            false
                );
                
                _tX += _tW + _tGap;
		    }
		    
		    draw_set_color(c_dkgray);
		    draw_set_halign(fa_right);
		    draw_set_valign(fa_top);
		    draw_set_font(ft_dungeonBold);
		    
		    draw_text_transformed(_x2 + 1,_y1 + 1,"ad",1,1,0);
		
		    break;
	#endregion
	
	#region //act_start
		case EVENT_ACT_START:
			var
			_src = cArgs[| 0],
			_act = cArgs[| 1];
			
			if(scr_exists(src) && _src == src && _act.object_index == obj_handler_act && _act.ele != ""){
			    ds_list_insert(lst_deck,0,_act.ele + -en_charVar.ele_fir);
			    
			    while(ds_list_size(lst_deck) > 6){
			        ds_list_delete(lst_deck,6);
			    }
			}
		
			break;
	#endregion
	    
	default:
	    event_inherited();
}