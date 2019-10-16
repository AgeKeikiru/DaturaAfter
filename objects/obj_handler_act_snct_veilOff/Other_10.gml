/// @description Insert description here
// You can write your code in this editor

switch(cEvent){
	#region //act_use
		case EVENT_ACT_USE:
			if(scr_exists(src,asset_object) && ds_list_size(special) > 0){
				var _proc = ds_list_size(src.lst_effects);
				
				while(!ds_list_empty(src.lst_effects)){
					instance_destroy(src.lst_effects[| 0]);
					ds_list_delete(src.lst_effects,0);
				}
				
				for(var _i = 0;_i < array_length_1d(src.ailment);_i++){
					if(src.ailment[_i] > 0){
						src.ailment[_i] = 0;
						_proc++;
					}
				}
				
				stun_chance = _proc * special[| 0];
				
				scr_cEvent_id(src,EVENT_BATTLM_ICONREFRESH);
				scr_createEffectTxt(src,"VEIL OFF");
				scr_createSpark(src.x,src.y,spr_spark_pierce,"");
			}
			
			event_inherited();
			
			break;
	#endregion
	    
	default:
	    event_inherited();
}