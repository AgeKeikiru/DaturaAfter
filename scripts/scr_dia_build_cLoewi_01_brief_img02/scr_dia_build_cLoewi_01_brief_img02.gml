var
SV_x = 150,
SV_y = 100,
SV_p = scr_createImgPanel(SV_x,SV_y,spr_enemy_bigslime,0.8,10);

SV_p.txt[0] = "M:/brief/assets/img/tgt_bigSlime";

ds_list_add(lst_panels,SV_p);