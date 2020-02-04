/// @description Insert description here
// You can write your code in this editor

switch(cEvent){
	#region //act_use
		case EVENT_ACT_USE:
			if((CS_SRCSTANCEIS obj_handler_actEffect_zodc_deck) && !ds_list_empty(src.stance.lst_deck)){
			    hitCount = ds_list_size(src.stance.lst_deck);
			    
			    ds_list_clear(sa_chance);
			    
			    repeat(6){
			        ds_list_add(sa_chance,0);
			    }
			    
			    while(!ds_list_empty(src.stance.lst_deck)){
			        sa_chance[| src.stance.lst_deck[| 0]] += 0.1;
			        
			        ds_list_delete(src.stance.lst_deck,0);
			    }
			}
			
			event_inherited();
		
			break;
	#endregion
	    
	default:
	    event_inherited();
}