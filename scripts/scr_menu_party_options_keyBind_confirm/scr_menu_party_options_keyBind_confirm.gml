var _dupe = false;

for(var _i = 0;_i < en_ic_key.JOY_ALT;_i++){
    if(_i < en_ic_key.party1 || _i == en_ic_key.pause){
        //unique keys
        
        for(var _i2 = 0;_i2 < en_ic_key.JOY_ALT;_i2++){
            _dupe += global.tempArr[_i] == global.tempArr[_i2] && _i2 != _i;
        }
    }else if(_i < en_ic_key.menuAccept){
        //party keys
        
        for(var _i2 = _i + 1;_i2 < en_ic_key.menuAccept;_i2++){
            _dupe += global.tempArr[_i] == global.tempArr[_i2];
        }
    }else if(_i < en_ic_key.pause){
        //menu keys
        
        for(var _i2 = _i + 1;_i2 < en_ic_key.pause;_i2++){
            _dupe += global.tempArr[_i] == global.tempArr[_i2];
        }
    }
}

if(_dupe){
    scr_menu_confirmWindow("message/alert/..","ERROR: Duplicate keybindings.",scr_menu_backNoRefresh,noone);
}else{
    scr_menu_confirmWindow("message/confirm/..","Save new keybindings? Changes will take effect after confirm.",scr_menu_party_options_keyBind_confirm_yes,scr_menu_backNoRefresh);
}