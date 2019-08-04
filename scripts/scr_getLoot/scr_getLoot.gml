///@arg type
///@arg *subtype
///@arg *qty
///@arg *src

if(global.map_flags[? FG_PROLOGUE]) return;

var
SV_map = scr_data_getMap(global.grd_missions,global.missionCurr),
SV_type = argument[0],
SV_sub = argument_count > 1 ? argument[1] : "",
SV_qty = argument_count > 2 ? argument[2] : 1,
SV_src = argument_count > 3 ? argument[3] : noone;

repeat(SV_qty){
    switch SV_type{
        case LOOT_RACE: //race item drop
        	var SV_key = "";
        	
        	if(SV_src != noone){
        	    SV_key = SV_src[? CHAR_VAR_RACE];
        	}
        	
        	if(SV_sub != ""){
        	    SV_key = SV_sub;
        	}
        	
        	if(ds_map_exists(global.map_mat_held,SV_key)){
            	ds_list_add(global.lst_missionLoot_queue,global.map_mat_name[? SV_key]);
            	global.map_mat_held[? SV_key] += 1;
        	}
            
            break;
        
        case LOOT_ELE: //ele item drop
        	var
        	SV_multi = 0,
        	SV_ele = SV_sub,
        	SV_max = 0,
        	SV_arr = [CHAR_VAR_ELE_DRK,CHAR_VAR_ELE_LGT,CHAR_VAR_ELE_FIR,CHAR_VAR_ELE_ICE,CHAR_VAR_ELE_NAT,CHAR_VAR_ELE_ELC];
        	
        	if(SV_ele == ""){
        	    SV_ele = SV_arr[irandom(5)];
        	}
        	
        	if(SV_src != noone){
            	for(var SV_i = 0;SV_i < 6;SV_i++){
            		var
            		SV_key = SV_arr[SV_i],
            		SV_aff = src[? SV_key];
            		
            		if(SV_aff > 0){
            			if(SV_aff == SV_max){
            				SV_multi++;
            			}else{
            				if(SV_aff > SV_max){
            					SV_multi = 0;
            					SV_ele = SV_key;
            				}
            				
            				SV_max = max(SV_aff,SV_max);
            			}
            		}
            	}
            	
            	if(SV_multi || SV_max <= 0){
            	    SV_ele = "";
            	}
        	}
        	
        	if(ds_map_exists(global.map_mat_held,SV_ele)){
        		ds_list_add(global.lst_missionLoot_queue,global.map_mat_name[? SV_ele]);
        		global.map_mat_held[? SV_ele] += 1;
        	}
            
            break;
        
        case LOOT_WPN: //weapon drop
        	var SV_lst = global.lst_missionLoot_table;
        	
        	ds_list_shuffle(SV_lst);
        	
        	var
        	SV_ele = "",
        	SV_rank = SV_map[? MSN_VAR_LOOT_RANKMIN],
        	SV_plus = 0,
        	SV_tag = SV_lst[| 0];
        	
        	if(random(1) < .5){
        		SV_ele = choose(CHAR_VAR_ELE_DRK,CHAR_VAR_ELE_LGT,CHAR_VAR_ELE_FIR,CHAR_VAR_ELE_ICE,CHAR_VAR_ELE_NAT,CHAR_VAR_ELE_ELC);
        	}
        	
        	while(SV_rank < SV_map[? MSN_VAR_LOOT_RANKMAX] && random(1) < .2){
        		SV_rank++;
        	}
        	
        	while(SV_plus < 10 && random(1) < .1){
        		SV_plus++;
        	}
        	
        	var SV_o = scr_data_act_new(SV_tag,SV_ele,SV_rank,SV_plus);
        	
        	ds_list_add(global.lst_inv_acts,SV_o);
        	ds_list_add(global.lst_missionLoot_queue,SV_o.name);
            
            break;
            
        case LOOT_ARM: //armor drop
            var SV_lst = ds_list_create();
            
            ds_list_add(SV_lst,
                CHAR_VAR_HP,
                CHAR_VAR_EN,
                CHAR_VAR_MATK,
                CHAR_VAR_MDEF,
                CHAR_VAR_FATK,
                CHAR_VAR_FDEF,
                CHAR_VAR_SATK,
                CHAR_VAR_SDEF,
                CHAR_VAR_ACC,
                CHAR_VAR_EVA,
                CHAR_VAR_SPD,
                CHAR_VAR_MISC
            );
        	
        	ds_list_shuffle(SV_lst);
        	
        	var
        	SV_rank = SV_map[? MSN_VAR_LOOT_RANKMIN],
        	SV_plus = 0,
        	SV_tag = SV_lst[| 0];
        	
        	while(SV_rank < SV_map[? MSN_VAR_LOOT_RANKMAX] && random(1) < .2){
        		SV_rank++;
        	}
        	
        	while(SV_plus < 10 && random(1) < .1){
        		SV_plus++;
        	}
        	
        	var SV_o = scr_data_armor_new(SV_tag,SV_rank,SV_plus);
        	
        	ds_list_add(global.lst_inv_arms,SV_o);
        	ds_list_add(global.lst_missionLoot_queue,SV_o.name);
            
            break;
        
        case LOOT_G: //gold drop
        	var SV_g = irandom_range(SV_map[? MSN_VAR_LOOT_GOLDMIN],SV_map[? MSN_VAR_LOOT_GOLDMAX]) * 10;
        	
        	global.heldGold = min(global.heldGold + SV_g,GCAP);
        	ds_list_add(global.lst_missionLoot_queue,"$" + string(SV_g));
            
            break;
    }
}