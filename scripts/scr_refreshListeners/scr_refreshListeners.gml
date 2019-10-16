var _arr = [
    obj_handler_class_parent,
    obj_handler_act,
    obj_dungeon_battleMember
]

for(var _i = ds_list_size(global.lst_listeners) + -1;_i >= 0;_i--){
    var _obj = global.lst_listeners[| _i];
    
    if(!scr_exists(_obj,asset_object)){
        ds_list_delete(global.lst_listeners,_i);
    }else{
        for(var _i2 = 0;_i2 < array_length_1d(_arr);_i2++){
            var _ind = _arr[_i2];
            
            if(_obj.object_index == _ind || object_is_ancestor(_obj.object_index,_ind)){
                ds_list_delete(global.lst_listeners,_i);
            }
        }
    }
}