if(!scr_isFormationEmpty()){
    scr_menu_confirmWindow("message/confirm/..","Change party to this formation?",scr_menu_social_formation_confirm_yes,scr_menu_social_formation_cancel_yes);
}else{
    scr_menu_backNoRefresh();
}