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
		    _str = "-";
		    
		    draw_set_color(c_dkgray);
		    
		    draw_rectangle(_x1,_y1,_x2,_y2,false);
		    
		    switch(typeCurr){
		    	case en_charVar.mAtk:
		    		_str = "M";
		    		draw_set_color(CC_FIRRED);
		    		break;
		    		
		    	case en_charVar.fAtk:
		    		_str = "F";
		    		draw_set_color(CC_ICEBLUE);
		    		break;
		    		
		    	case en_charVar.sAtk:
		    		_str = "S";
		    		draw_set_color(CC_ELCYELLOW);
		    		break;
		    }
		    
		    
		    draw_set_alpha((abs(sin(current_time / 400)) * .3) + .7);
		    
		    if(_str != "-"){
		    	draw_rectangle(_x1,_y1,_x2,_y2,false);
		    }
		    
		    draw_set_color(_c);
		    draw_set_alpha(1);
		    
		    draw_rectangle(_x2,_y1,_x2 + -56,_y2 + -4,false);
		    draw_triangle(_x2 + -56,_y1 + -1,_x2 + -56,_y2 + -4,_x2 + -66,_y1 + -1,false);
		    
		    draw_set_color(c_dkgray);
		    draw_set_halign(fa_right);
		    draw_set_valign(fa_top);
		    draw_set_font(ft_dungeonBold);
		    
		    draw_text_transformed(_x2,_y1 + 1,"wm:" + _str,1,1,0);
		
		    break;
	#endregion
	    
	#region //battle_enemyHit
		case EVENT_BATTLE_ENEMYHIT:
			var
			_src = cArgs[| 0],
			_tgt = cArgs[| 1],
			_act = cArgs[| 2];
			
			if(scr_exists(src) && ds_list_size(special) > 0){
				if(_src == src){
					if(_act.atkScale == en_charVar.sAtk){
						//fireworks
						var _lst = ds_list_create();
		
						scr_act_createEffect(obj_handler_actEffect_ace_fWorks,1,src,0,false,_lst);
						
						ds_list_destroy(_lst);
						
						if(random(1) < special[| ACE_WM_FWORK]){
							scr_stunMem(_tgt);
						}
					}
				}else if(_tgt == src){
					//riposte
					var _lst = ds_list_create();
				
					for(var _i = 0;_i < 8;_i++){
						var _o = src.act[_i];
						
						if(scr_exists(_o) && _o.atkScale == en_charVar.mAtk && _o.object_index == obj_handler_act){
							ds_list_add(_lst,_o);
						}
					}
					
					if(!ds_list_empty(_lst) && random(1) < special[| ACE_WM_RIPO] && ripoCd <= 0){
						ds_list_shuffle(_lst);
						
						with _lst[| 0]{
							scr_cEvent_id(id,EVENT_ACT_USE);
						}
						
						ripoCd = 3 * room_speed;
					}
					
					ds_list_destroy(_lst);
				}
			}
			
			event_inherited();
			
			break;
	#endregion
	
	#region //battle_atkMod
		case EVENT_BATTLE_ATKMOD:
			var
			_src = cArgs[| 0],
			_tgt = cArgs[| 1],
			_act = cArgs[| 2];
			
			if(scr_exists(src,asset_object) && _src == src){
			    if(typeCurr != _act.atkScale){
					typeCurr = _act.atkScale;
					
					global.tempFloat += special[| ACE_WM_LEVEL];
					scr_trace("weaponmaster type switch damage bonus: " + string(special[| ACE_WM_LEVEL]));
					
					globalvar G_type,G_obj;
					G_type = typeCurr;
					G_obj = src;
					
					with obj_handler_act_ace_xActParent{
						if(ds_list_size(special) > 0 && src == G_obj && G_type == special[| 0]){
                            cdCurr--;
                        				
                        	cdCurr = max(cdCurr,0);
                        }
					}
					
					map_statMod[? en_charVar.spd] = 0;
					enRecover = 0;
					
					switch(typeCurr){
						case en_charVar.mAtk:
							//swords dance
							var _lst = ds_list_create();
	
							ds_list_add(_lst,special[| ACE_WM_SDANCE]);
							
							for(var _i = 0;_i < 3;_i++){
							    var _o = global.grd_party_player[# _i,0];
							    
							    if(scr_exists(_o) && _o.hpCurr > 0){
							        scr_act_createEffect(obj_handler_actEffect_ace_sDance,1,_o,0,false,_lst);
							    }
							}
							
							ds_list_destroy(_lst);
							
							break;
							
						case en_charVar.fAtk:
							//stratos
							map_statMod[? en_charVar.spd] = special[| ACE_WM_STRATOS];
							
							break;
							
						case en_charVar.sAtk:
							//mana draw
							enRecover = special[| ACE_WM_MDRAW];
							
							break;
					}
					
					scr_cEvent_id(src,EVENT_BATTLM_ICONREFRESH);
				}
				
				if(special[| ACE_WM_HTRIG] != obj_handler_class_ace.stat_ht_base){
                	//hair trigger penalty
                	if(_act.atkScale == en_charVar.fAtk && _act.object_index == obj_handler_act){
    					global.tempFloat += special[| ACE_WM_HTRIG];
    					scr_trace("weaponmaster hair trigger damage penalty: " + string(special[| ACE_WM_HTRIG]));
    				}
                }
			}
		
			break;
	#endregion
	    
	default:
	    event_inherited();
}