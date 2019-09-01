var
SV_pool = ds_list_create(),
SV_chunk = ds_list_create(),
SV_chSize = 4,
SV_rare = 0;

//check progress flags to determine max weapon rank to sell
if(DEBUG){
	SV_rare = 5;
}

//clear previous shop inv
while(ds_list_size(global.lst_shop_acts) > 0){
    instance_destroy(global.lst_shop_acts[| 0]);
    ds_list_delete(global.lst_shop_acts,0);
}

while(ds_list_size(global.lst_shop_arms) > 0){
    instance_destroy(global.lst_shop_arms[| 0]);
    ds_list_delete(global.lst_shop_arms,0);
}

while(ds_list_size(global.lst_shop_classes) > 0){
    instance_destroy(global.lst_shop_classes[| 0]);
    ds_list_delete(global.lst_shop_classes,0);
}

ds_list_clear(global.lst_shop_items);

#region //acts
    
    #region //melee
        //tier 1 shop
        ds_list_add(
            SV_pool,
            WTAG_TYPE_SWD,
    		WTAG_TYPE_DGR,
    		WTAG_TYPE_DGR,
    		WTAG_TYPE_PAN
        );
        
        //tier 2 shop
        if(true){ //some condition
            ds_list_add(
                SV_pool,
                WTAG_TYPE_SWD,
                WTAG_TYPE_SWD,
        		WTAG_TYPE_AXE,
        		WTAG_TYPE_DGR,
        		WTAG_TYPE_GNT,
        		WTAG_TYPE_PAN
            );
            
            SV_chSize += 2;
        }
        
        //tier 3 shop
        if(true){ //some condition
            ds_list_add(
                SV_pool,
                WTAG_TYPE_SWD,
        		WTAG_TYPE_AXE,
        		WTAG_TYPE_CSW,
        		WTAG_TYPE_SCY,
        		WTAG_TYPE_DGR,
        		WTAG_TYPE_GNT,
        		WTAG_TYPE_PAN
            );
            
            SV_chSize += 2;
        }
        
        //create/sort shop item chunk
        repeat(SV_chSize){
            ds_list_add(SV_chunk,SV_pool[| irandom(ds_list_size(SV_pool) + -1)]);
        }
        
        ds_list_sort(SV_chunk,true);
        
        //add item chunk to shop inventory
        while(ds_list_size(SV_chunk) > 0){
            var
            SV_plus = 0,
            SV_ele = "";
            
            while(random(1) < .4 && SV_plus < 5){
                SV_plus++;
            }
            
            if(random(1) < .4){
                SV_ele = choose(CHAR_VAR_ELE_DRK,CHAR_VAR_ELE_LGT,CHAR_VAR_ELE_FIR,CHAR_VAR_ELE_ICE,CHAR_VAR_ELE_ELC,CHAR_VAR_ELE_NAT);
            }
            
            var SV_item = scr_data_act_new(SV_chunk[| 0],SV_ele,irandom(SV_rare),SV_plus);
            
            ds_list_add(global.lst_shop_acts,SV_item);
            
            ds_list_delete(SV_chunk,0);
        }
    #endregion
    
    ds_list_clear(SV_pool);
    ds_list_clear(SV_chunk);
    SV_chSize = 4;
    
    #region //firearm
        //tier 1 shop
        ds_list_add(
            SV_pool,
            WTAG_TYPE_HGN,
            WTAG_TYPE_HGN,
    		WTAG_TYPE_SMG,
    		WTAG_TYPE_SLG
        );
        
        //tier 2 shop
        if(true){ //some condition
            ds_list_add(
                SV_pool,
                WTAG_TYPE_HGN,
        		WTAG_TYPE_SMG,
        		WTAG_TYPE_SMG,
        		WTAG_TYPE_SHG,
        		WTAG_TYPE_RFL,
        		WTAG_TYPE_SLG
            );
            
            SV_chSize += 2;
        }
        
        //tier 3 shop
        if(true){ //some condition
            ds_list_add(
                SV_pool,
                WTAG_TYPE_HGN,
        		WTAG_TYPE_SMG,
        		WTAG_TYPE_SHG,
        		WTAG_TYPE_LMG,
        		WTAG_TYPE_RPG,
        		WTAG_TYPE_RFL,
        		WTAG_TYPE_SLG
            );
            
            SV_chSize += 2;
        }
        
        //create/sort shop item chunk
        repeat(SV_chSize){
            ds_list_add(SV_chunk,SV_pool[| irandom(ds_list_size(SV_pool) + -1)]);
        }
        
        ds_list_sort(SV_chunk,true);
        
        //add item chunk to shop inventory
        while(ds_list_size(SV_chunk) > 0){
            var
            SV_plus = 0,
            SV_ele = "";
            
            while(random(1) < .4 && SV_plus < 5){
                SV_plus++;
            }
            
            if(random(1) < .4){
                SV_ele = choose(CHAR_VAR_ELE_DRK,CHAR_VAR_ELE_LGT,CHAR_VAR_ELE_FIR,CHAR_VAR_ELE_ICE,CHAR_VAR_ELE_ELC,CHAR_VAR_ELE_NAT);
            }
            
            var SV_item = scr_data_act_new(SV_chunk[| 0],SV_ele,irandom(SV_rare),SV_plus);
            
            ds_list_add(global.lst_shop_acts,SV_item);
            
            ds_list_delete(SV_chunk,0);
        }
    #endregion
    
    ds_list_clear(SV_pool);
    ds_list_clear(SV_chunk);
    SV_chSize = 4;
    
    #region //spell
        //tier 1 shop
        ds_list_add(
            SV_pool,
            WTAG_TYPE_ASC_ARW,
            WTAG_TYPE_ASC_ARW,
            WTAG_TYPE_ASC_ARW,
    		WTAG_TYPE_SSC_HEAL
        );
        
        //tier 2 shop
        if(true){ //some condition
            ds_list_add(
                SV_pool,
                WTAG_TYPE_ASC_ARW,
        		WTAG_TYPE_ASC_BRS,
        		WTAG_TYPE_CSC,
        		WTAG_TYPE_SSC_HEAL,
        		WTAG_TYPE_SSC_CURE
            );
            
            SV_chSize += 2;
        }
        
        //tier 3 shop
        if(true){ //some condition
            ds_list_add(
                SV_pool,
                WTAG_TYPE_ASC_ARW,
        	    WTAG_TYPE_ASC_RAY,
        		WTAG_TYPE_ASC_VRT,
        		WTAG_TYPE_ASC_BRS,
        		WTAG_TYPE_CSC,
        		WTAG_TYPE_SSC_HEAL,
        		WTAG_TYPE_SSC_CURE,
        		WTAG_TYPE_SSC_RAISE
            );
            
            SV_chSize += 2;
        }
        
        //create/sort shop item chunk
        repeat(SV_chSize){
            ds_list_add(SV_chunk,SV_pool[| irandom(ds_list_size(SV_pool) + -1)]);
        }
        
        ds_list_sort(SV_chunk,true);
        
        //add item chunk to shop inventory
        while(ds_list_size(SV_chunk) > 0){
            var
            SV_plus = 0,
            SV_ele = "";
            
            while(random(1) < .4 && SV_plus < 5){
                SV_plus++;
            }
            
            if(random(1) < .4){
                SV_ele = choose(CHAR_VAR_ELE_DRK,CHAR_VAR_ELE_LGT,CHAR_VAR_ELE_FIR,CHAR_VAR_ELE_ICE,CHAR_VAR_ELE_ELC,CHAR_VAR_ELE_NAT);
            }
            
            var SV_item = scr_data_act_new(SV_chunk[| 0],SV_ele,irandom(SV_rare),SV_plus);
            
            ds_list_add(global.lst_shop_acts,SV_item);
            
            ds_list_delete(SV_chunk,0);
        }
    #endregion
    
    ds_list_clear(SV_pool);
    ds_list_clear(SV_chunk);
    SV_chSize = 2;
    
    #region //shield
        //tier 1 shop
        ds_list_add(
            SV_pool,
            WTAG_TYPE_SHD_FLS,
    		WTAG_TYPE_SHD_BRN
        );
        
        //tier 2 shop
        if(true){ //some condition
            ds_list_add(
                SV_pool,
                WTAG_TYPE_SHD_FLS,
    		    WTAG_TYPE_SHD_BRN,
                WTAG_TYPE_SHD_STC
            );
            
            SV_chSize += 1;
        }
        
        //tier 3 shop
        if(true){ //some condition
            SV_chSize += 1;
        }
        
        //create/sort shop item chunk
        repeat(SV_chSize){
            ds_list_add(SV_chunk,SV_pool[| irandom(ds_list_size(SV_pool) + -1)]);
        }
        
        ds_list_sort(SV_chunk,true);
        
        //add item chunk to shop inventory
        while(ds_list_size(SV_chunk) > 0){
            var
            SV_plus = 0,
            SV_ele = "";
            
            while(random(1) < .4 && SV_plus < 5){
                SV_plus++;
            }
            
            var SV_item = scr_data_act_new(SV_chunk[| 0],SV_ele,irandom(SV_rare),SV_plus);
            
            ds_list_add(global.lst_shop_acts,SV_item);
            
            ds_list_delete(SV_chunk,0);
        }
    #endregion
    
#endregion

ds_list_clear(SV_pool);
ds_list_clear(SV_chunk);
SV_chSize = 6;

#region //armors
    
    //tier 1 shop
    ds_list_add(
        SV_pool,
		CHAR_VAR_MATK,
		CHAR_VAR_MDEF,
		CHAR_VAR_FATK,
		CHAR_VAR_FDEF,
		CHAR_VAR_SATK,
		CHAR_VAR_SDEF
    );
    
    //tier 2 shop
    if(true){ //some condition
        ds_list_add(
            SV_pool,
            CHAR_VAR_HP,
		    CHAR_VAR_EN
        );
        
        SV_chSize += 4;
    }
    
    //tier 3 shop
    if(true){ //some condition
        ds_list_add(
            SV_pool,
    		CHAR_VAR_ACC,
    		CHAR_VAR_EVA,
    		CHAR_VAR_SPD,
    		CHAR_VAR_MISC
        );
        
        SV_chSize += 4;
    }
    
    //create/sort shop item chunk
    repeat(SV_chSize){
        ds_list_add(SV_chunk,SV_pool[| irandom(ds_list_size(SV_pool) + -1)]);
    }
    
    ds_list_sort(SV_chunk,true);
    
    //add item chunk to shop inventory
    while(ds_list_size(SV_chunk) > 0){
        var
        SV_plus = 0;
        
        while(random(1) < .4 && SV_plus < 5){
            SV_plus++;
        }
        
        var SV_item = scr_data_armor_new(SV_chunk[| 0],irandom(SV_rare),SV_plus);
        
        ds_list_add(global.lst_shop_arms,SV_item);
        
        ds_list_delete(SV_chunk,0);
    }
    
#endregion

#region //items
    
    //tier 1 shop
    ds_list_add(
        global.lst_shop_items,
		ITEM_HEAL1,
		ITEM_CURE1,
		ITEM_CURE2
    );
    
    //tier 2 shop
    if(true){ //some condition
        ds_list_add(
            global.lst_shop_items,
            ITEM_HEAL2,
            ITEM_RAISE1
        );
    }
    
    //tier 3 shop
    if(true){ //some condition
        ds_list_add(
            global.lst_shop_items,
    		ITEM_HEAL3,
    		ITEM_RAISE2,
    		ITEM_IMM_FIR,
			ITEM_IMM_ICE,
			ITEM_IMM_LGT,
			ITEM_IMM_DRK,
			ITEM_IMM_ELC,
			ITEM_IMM_NAT
        );
    }
    
    //sort
    ds_list_sort(global.lst_shop_items,true);
    
#endregion

#region //classes

	global.cid = ds_list_size(global.lst_inv_classes);

	ds_list_add(global.lst_shop_classes,
		instance_create_depth(0,0,0,obj_handler_class_evoker),
		instance_create_depth(0,0,0,obj_handler_class_angel),
		instance_create_depth(0,0,0,obj_handler_class_chef),
		instance_create_depth(0,0,0,obj_handler_class_razer),
		instance_create_depth(0,0,0,obj_handler_class_idol),
		instance_create_depth(0,0,0,obj_handler_class_agent),
		instance_create_depth(0,0,0,obj_handler_class_sanctum)
	);

#endregion