/// @description Insert description here

if(CS_SRCSTANCEIS obj_handler_actEffect_zodc_deck){
    with src.stance{
        ds_list_copy(lst_deck,lst_deckReload);
        
        ds_list_clear(lst_deckReload);
    }
}

event_inherited();