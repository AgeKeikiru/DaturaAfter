scr_menu_back(false);

var SV_m = ds_stack_top(global.stk_menu);

global.heldGold += -scr_calcLevelupCost(global.labObj);

if(SV_m.menu_x > 0){
    global.labObj.grd_skills[# SV_m.menu_x + -1,SV_m.menu_y] += 1;
}else{
    global.labObj.ss_level++;
}

scr_cEvent_id(global.labObj,EVENT_CLASS_SKILLREFRESH);

if(scr_exists(global.labObj.src,asset_object)){
    scr_cEvent_id(global.labObj.src,EVENT_BATTLM_INIT);
}