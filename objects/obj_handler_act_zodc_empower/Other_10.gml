/// @description Insert description here
// You can write your code in this editor

switch(cEvent){
	#region //act_use
		case EVENT_ACT_USE:
			if((CS_SRCSTANCEIS obj_handler_actEffect_zodc_deck) && ds_list_size(special) > 0){
			    with src.stance{
			        ds_list_copy(lst_deckReload,lst_deck);
			    }
			    
			    special[| ZODC_EMP_ATK] = 0;
			    special[| ZODC_EMP_DEF] = 0;
				
				var
				_check0 = arr_check[0],
				_check1 = arr_check[1];
			    
			    for(var _i = ds_list_size(src.stance.lst_deck) + -1;_i >= 0;_i--){
			        switch src.stance.lst_deck[| _i]{
			            case _check0:
			                //fire
			                special[| ZODC_EMP_ATK] += 0.15;
			                ds_list_delete(src.stance.lst_deck,_i);
			                
			                break;
                        case _check1:
			                //ice
			                special[| ZODC_EMP_DEF] += 0.15;
			                ds_list_delete(src.stance.lst_deck,_i);
			                
			                break;
			        }
			    }
			}
			
			event_inherited();
		
			break;
	#endregion
	    
	default:
	    event_inherited();
}