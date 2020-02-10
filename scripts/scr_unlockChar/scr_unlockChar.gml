///@arg charID

var
SV_id = argument0,
SV_map = scr_data_getMap(global.grd_chars,SV_id);

if(!global.map_flags[? SV_id]){
    var SV_o;
    
    //starting equipment
    switch SV_id{
        #region //ari
            case CHAR_ARI:
                SV_o = scr_data_act_new(WTAG_TYPE_GNT,"",2,0);
                SV_map[? CHAR_VAR_HB0] = SV_o;
                ds_list_add(global.lst_inv_acts,SV_o);
                
                SV_o = scr_data_act_new(WTAG_TYPE_RPG,CHAR_VAR_ELE_LGT,0,0);
                SV_map[? CHAR_VAR_HB1] = SV_o;
                ds_list_add(global.lst_inv_acts,SV_o);
                
                SV_o = scr_data_armor_new(CHAR_VAR_HP,0,4);
                SV_map[? CHAR_VAR_ARM0] = SV_o;
                ds_list_add(global.lst_inv_arms,SV_o);
                
                SV_o = instance_create_depth(0,0,0,obj_handler_class_angel);
                SV_map[? CHAR_VAR_CLS0] = SV_o;
                ds_list_add(global.lst_inv_classes,SV_o);
                
                with SV_o{
                    grd_skills[# 0,1] = 5;
                    grd_skills[# 1,1] = 5;
                }
                
                break;
        #endregion
        
        #region
            case CHAR_MINA:
                SV_o = scr_data_act_new(WTAG_TYPE_SWD,"",2,0);
                SV_map[? CHAR_VAR_HB0] = SV_o;
                ds_list_add(global.lst_inv_acts,SV_o);
                
                SV_o = scr_data_act_new(WTAG_TYPE_SMG,"",2,0);
                SV_map[? CHAR_VAR_HB1] = SV_o;
                ds_list_add(global.lst_inv_acts,SV_o);
                
                SV_o = scr_data_act_new(WTAG_TYPE_ASC_VRT,CHAR_VAR_ELE_ELC,2,0);
                SV_map[? CHAR_VAR_HB2] = SV_o;
                ds_list_add(global.lst_inv_acts,SV_o);
                
                SV_o = scr_data_armor_new(en_charVar.spd,3,0);
                SV_map[? CHAR_VAR_ARM0] = SV_o;
                ds_list_add(global.lst_inv_arms,SV_o);
                
                SV_o = scr_data_armor_new(en_charVar.misc,0,0);
                SV_map[? CHAR_VAR_ARM1] = SV_o;
                ds_list_add(global.lst_inv_arms,SV_o);
                
                SV_o = instance_create_depth(0,0,0,obj_handler_class_idol);
                SV_map[? CHAR_VAR_CLS0] = SV_o;
                ds_list_add(global.lst_inv_classes,SV_o);
                
                with SV_o{
                    grd_skills[# 0,1] = 5;
                    grd_skills[# 0,2] = 5;
                    grd_skills[# 1,2] = 5;
                }
                
                break;
        #endregion
    }
    
    scr_cEvent_id(global.map_chars[? SV_id],EVENT_BATTLM_INIT);
    
    global.map_flags[? SV_id] = true;
    
    if(!global.map_flags[? FG_TUT_FORMATION]){
        global.map_flags[? FG_TUT_FORMATION] = true;
        ds_stack_push(global.stk_menuAlert,scr_alert_formationTut);
    }
    
    var SV_str =
    "New Character: [" + SV_map[? CHAR_VAR_NAMEFULL] + "]" +
    "\n\n" +
    SV_map[? CHAR_VAR_DESC];
    
    scr_menu_confirmWindow("message/alert/..",SV_str,scr_menu_backNoRefresh,noone);
}