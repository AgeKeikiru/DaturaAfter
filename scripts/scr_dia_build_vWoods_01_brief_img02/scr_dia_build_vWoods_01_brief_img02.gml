var
SV_x = 160,
SV_y = 80,
SV_p = scr_createImgPanel(SV_x,SV_y,spr_enemy_bleedingBullet,0.5,10);

SV_p.txt[0] = "M:/brief/assets/img/tgt_bl...";

ds_list_add(lst_panels,SV_p);