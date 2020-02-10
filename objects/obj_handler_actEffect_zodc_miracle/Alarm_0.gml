/// @description Insert description here

for(var _i = 0;_i < 3;_i++){
    var _obj = global.grd_party_player[# _i,0];
    
    if(scr_exists(_obj) && _obj.hpCurr <= 0){
        scr_createEffectTxt(_obj,effectTxt);
    }
    
    with _obj{
        hpCurr = hpMax;
        enCurr = enMax;
        ailment = [0,0,0,0,0,0];
        
        for(var _i2 = ds_list_size(lst_effects) + -1;_i2 >= 0;_i2--){
            var _e = lst_effects[| _i2];
            
            if(scr_exists(_e) && _e.debuff){
                instance_destroy(_e);
            }
        }
    }
    
    _obj = global.grd_party_player[# _i,1];
    
    with _obj{
        hpCurr = hpMax;
        enCurr = enMax;
        ailment = [0,0,0,0,0,0];
        
        for(var _i2 = ds_list_size(lst_effects) + -1;_i2 >= 0;_i2--){
            var _e = lst_effects[| _i2];
            
            if(scr_exists(_e) && _e.debuff){
                instance_destroy(_e);
            }
        }
    }
}

event_inherited();