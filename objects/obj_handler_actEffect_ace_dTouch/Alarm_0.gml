
if(ds_list_size(special) > 1){
    duration = special[| 1] * room_speed;
    
    var _lst = ds_list_create();
    ds_list_add(_lst,
        en_charVar.mAtk,
        en_charVar.fAtk,
        en_charVar.sAtk,
        en_charVar.mDef,
        en_charVar.fDef,
        en_charVar.sDef,
        en_charVar.spd,
        en_charVar.eva,
        en_charVar.acc
    );
    
    ds_list_shuffle(_lst);
    
    map_statMod[? _lst[| 0]] = -0.5;
    map_statMod[? _lst[| 1]] = -0.5;
    
    ds_list_destroy(_lst);
}

event_inherited();