var
SV_x = 150,
SV_y = 60,
SV_p = scr_createImgPanel(SV_x,SV_y,spr_enemy_wanderer,0.5,10);

SV_p.txt[0] = "M:/brief/assets/img/tgt_wanderer";

ds_list_add(lst_panels,SV_p);

SV_x = 140;
SV_y = 300;
SV_p = scr_createImgPanel(SV_x,SV_y,spr_enemy_slime,0.7,10);

SV_p.txt[0] = "M:/brief/assets/img/tgt_slime";

ds_list_add(lst_panels,SV_p);