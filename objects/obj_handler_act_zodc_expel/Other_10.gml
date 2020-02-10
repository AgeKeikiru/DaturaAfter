/// @description Insert description here
// You can write your code in this editor

switch(cEvent){
	#region //act_use
		case EVENT_ACT_USE:
			if((CS_SRCSTANCEIS obj_handler_actEffect_zodc_deck) && !ds_list_empty(src.stance.lst_deck)){
			    var
			    _eles = ds_list_create();
			    
			    repeat(6){
			        ds_list_add(_eles,0);
			    }
			    
			    with src.stance{
			        ds_list_copy(lst_deckReload,lst_deck);
			    }
			    
			    hitCount = ds_list_size(src.stance.lst_deck);
			    
			    ds_list_clear(sa_chance);
			    
			    repeat(6){
			        ds_list_add(sa_chance,0);
			    }
			    
			    while(!ds_list_empty(src.stance.lst_deck)){
			        sa_chance[| src.stance.lst_deck[| 0]] += 0.1;
			        
			        _eles[| src.stance.lst_deck[| 0]] += 1;
			        
			        ds_list_delete(src.stance.lst_deck,0);
			    }
			    
			    //orphan check
			    if(ds_list_find_index(_eles,0) == -1){
			        globalvar G_src;
			        G_src = src;
			        
			        with obj_handler_act_zodc_orphan{
			            if(G_src == src){
			                cdCurr = max(cdCurr + -1,0);
			            }
			        }
			    }
			    
			    //flush check
			    if(ds_list_find_index(_eles,6) != -1){
			        globalvar G_src;
			        G_src = src;
			        
			        with obj_handler_act_zodc_miracle{
			            if(G_src == src){
			                cdCurr = max(cdCurr + -1,0);
			            }
			        }
			    }
			    
			    ds_list_destroy(_eles);
			}
			
			event_inherited();
		
			break;
	#endregion
	    
	default:
	    event_inherited();
}