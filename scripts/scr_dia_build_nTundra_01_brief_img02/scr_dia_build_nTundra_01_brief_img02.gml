var
SV_x = 950,
SV_y = 250,
SV_p = scr_createImgPanel(SV_x,SV_y,spr_enemy_mine,0.8,10);

SV_p.txt[0] = "M:/brief/assets/img/tgt_arcmine";

ds_list_add(lst_panels,SV_p);