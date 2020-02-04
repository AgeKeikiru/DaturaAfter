/// @description Insert description here

if(CS_SRCSTANCEIS obj_handler_actEffect_zodc_deck){
    with src.stance{
        repeat(2){
            ds_list_insert(lst_deck,0,lst_deck[| 0]);
        }
        
        while(ds_list_size(lst_deck) > 6){
            ds_list_delete(lst_deck,6);
        }
    }
}

event_inherited();