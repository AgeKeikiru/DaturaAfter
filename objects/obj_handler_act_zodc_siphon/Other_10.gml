/// @description Insert description here
// You can write your code in this editor

switch(cEvent){
	#region //act_use
		case EVENT_ACT_USE:
			if((CS_SRCSTANCEIS obj_handler_actEffect_zodc_deck) && ds_list_size(special) > 0){
			    special[| 0] = 0;
			    
			    for(var _i = ds_list_size(src.stance.lst_deck) + -1;_i >= 0;_i--){
			        switch src.stance.lst_deck[| _i]{
			            case arr_check[0]:
                        case arr_check[1]:
			                special[| 0] += 0.3;
			                ds_list_delete(src.stance.lst_deck,_i);
			                
			                break;
			        }
			    }
			}
			
			event_inherited();
		
			break;
	#endregion
	
	#region //battle_enemyHit
		case EVENT_BATTLE_ENEMYHIT:
			var
			_src = cArgs[| 0],
			_tgt = cArgs[| 1],
			_act = cArgs[| 2],
			_dmg = cArgs[| 3];
			
			if(scr_exists(src) && _src == src && _act == id && ds_list_size(special) > 0){
				for(var _i = 0;_i < 3;_i++){
				    var
				    _mem = global.grd_party_player[# _i,0],
				    _heal = round(_dmg * special[| 0]);
				    
				    if(scr_exists(_mem) && _mem.hpCurr > 0){
				        _mem.hpCurr = clamp(_mem.hpCurr + _heal,0,_mem.hpMax);
				        
				        with scr_createEffectTxt(_mem,string(_heal)){
				            txt_col[0] = CC_HEALGREEN;
				        }
				    }
				}
			}
			
			event_inherited();
			
			break;
	#endregion
	    
	default:
	    event_inherited();
}