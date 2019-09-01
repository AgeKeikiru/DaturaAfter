///@arg src
///@arg tgt
///@arg type
///@arg chance
///@arg duration

var
SV_src = argument0,
SV_tgt = argument1,
SV_type = argument2,
SV_chance = argument3,
SV_duration = argument4,
SV_rng = random(1),
SV_eles = [
    CHAR_VAR_ELE_FIR,
    CHAR_VAR_ELE_ICE,
    CHAR_VAR_ELE_NAT,
    CHAR_VAR_ELE_ELC,
    CHAR_VAR_ELE_DRK,
    CHAR_VAR_ELE_LGT
];

global.tempFloat = 0;
global.tempInt = 0;
scr_cEvent(all,EVENT_BATTLE_ENEMYDEBUFFED,SV_src,SV_tgt);
SV_chance += global.tempFloat;
SV_duration += global.tempInt;

if(scr_exists(SV_tgt,asset_object)){
    scr_trace("inflict ailment type " + string(SV_type) + ": " + string(SV_rng) + " < " + string(SV_chance));
    
    if(SV_rng < SV_chance){
        SV_tgt.ailment[SV_type] += room_speed * (SV_duration + irandom(5));
        
        scr_createSpark(SV_tgt.x,SV_tgt.y,spr_spark_dotDn,SV_eles[SV_type]);
        
        scr_cEvent(SV_tgt,EVENT_BATTLM_ICONREFRESH);
    }
}