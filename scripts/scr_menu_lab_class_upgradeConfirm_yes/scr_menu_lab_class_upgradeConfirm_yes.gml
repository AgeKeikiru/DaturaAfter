scr_menu_back(false);

var SV_m = ds_stack_top(global.stk_menu);

global.heldGold += -scr_calcLevelupCost(global.labObj);
global.labObj.grd_skills[# SV_m.menu_x + -1,SV_m.menu_y] += 1;

scr_cEvent(global.labObj,EVENT_CLASS_SKILLREFRESH);

with SV_m{
    grd_txt[# menu_x,menu_y] = global.labObj.grd_skillName[# menu_x + -1,menu_y] + " Lv." + string(global.labObj.grd_skills[# menu_x + -1,menu_y]);
    grd_descLabel[# menu_x,menu_y] = grd_txt[# menu_x,menu_y];
}