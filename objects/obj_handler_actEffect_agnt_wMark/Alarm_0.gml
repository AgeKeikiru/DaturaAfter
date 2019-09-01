
if(ds_list_size(special) > 1){
	map_statMod[? CHAR_VAR_MDEF] = special[| 0];
	map_statMod[? CHAR_VAR_FDEF] = special[| 1];
	map_statMod[? CHAR_VAR_SDEF] = special[| 0];
}

if(scr_exists(src,asset_object)){
    scr_createSpark(src.x,src.y,spr_spark_dotDn,"");
}

event_inherited();