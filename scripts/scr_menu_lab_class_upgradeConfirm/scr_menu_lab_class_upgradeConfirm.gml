var _m = ds_stack_top(global.stk_menu);

if(global.labObj.level >= 30 && !DEBUG){
    scr_menu_confirmWindow("menu/lab/class1/upgrade/confirm/..","Class is already at max level.",scr_menu_backNoRefresh,noone);
}else if(_m.menu_x > 0 && global.labObj.grd_skills[# _m.menu_x + -1,_m.menu_y] >= 5){
    scr_menu_confirmWindow("menu/lab/class1/upgrade/confirm/..","Skill is already at max level.",scr_menu_backNoRefresh,noone);
}else if(global.labObj.level < (_m.menu_x + -1) * 5 && !DEBUG){
    scr_menu_confirmWindow("menu/lab/class1/upgrade/confirm/..","Class is at insufficient level to learn this skill.",scr_menu_backNoRefresh,noone);
}else if(global.heldGold < scr_calcLevelupCost(global.labObj)){
    scr_menu_confirmWindow("menu/lab/class1/upgrade/confirm/..","Not enough gold.",scr_menu_backNoRefresh,noone);
}else{
    global.tempStr = "";
    
    scr_cEvent(global.labObj,EVENT_CLASS_FETCHTOOLTIP,_m.menu_x + -1,_m.menu_y);
    
    global.tempStr += "\n\n\nUpgrade skill for " + string(scr_calcLevelupCost(global.labObj)) + "g?";
    
    var SV_m = scr_menu_confirmWindow("menu/lab/class1/upgrade/confirm/..",global.tempStr,scr_menu_lab_class_upgradeConfirm_yes,scr_menu_backNoRefresh);
}