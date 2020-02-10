/// @description Insert description here
// You can write your code in this editor

switch(cEvent){
	#region //act_use
		case EVENT_ACT_USE:
			if((CS_SRCSTANCEIS obj_handler_actEffect_zodc_deck)){
			    with src.stance{
			        ds_list_copy(lst_deckReload,lst_deck);
			    }
			    
			    acc = 60;
				
				var
				_check0 = arr_check[0],
				_check1 = arr_check[1];
			    
			    for(var _i = ds_list_size(src.stance.lst_deck) + -1;_i >= 0;_i--){
			        switch src.stance.lst_deck[| _i]{
			            case _check0:
                        case _check1:
			                acc += 5;
			                ds_list_delete(src.stance.lst_deck,_i);
			                
			                break;
			        }
			    }
			}
			
			event_inherited();
		
			break;
	#endregion
	
	#region //battle_enemyHit
		case EVENT_BATTLE_ENEMYHIT:
			var
			_src = cArgs[| 0],
			_tgt = cArgs[| 1],
			_act = cArgs[| 2];
			
			if(scr_exists(src) && _src == src){
				for(var _i = ds_list_size(_tgt.lst_effects) + -1;_i >= 0;_i--){
				    var _e = _tgt.lst_effects[| _i];
				    
				    if(scr_exists(_e) && !_e.debuff){
				        instance_destroy(_e);
				    }
				}
			}
			
			event_inherited();
			
			break;
	#endregion
	    
	default:
	    event_inherited();
}