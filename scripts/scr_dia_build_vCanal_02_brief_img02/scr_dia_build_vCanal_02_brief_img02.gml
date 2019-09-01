var
SV_x = 150,
SV_y = 60,
SV_p = scr_createImgPanel(SV_x,SV_y,spr_enemy_hpStation,0.7,10);

SV_p.txt[0] = "M:/brief/assets/img/tgt_conduit";

ds_list_add(lst_panels,SV_p);

SV_x = 140;
SV_y = 240;
SV_p = scr_createImgPanel(SV_x,SV_y,spr_enemy_flamerDrone,.9,10);

SV_p.txt[0] = "M:/brief/assets/img/tgt_flamerDrone";

ds_list_add(lst_panels,SV_p);

SV_x = 950;
SV_y = 240;
SV_p = scr_createImgPanel(SV_x,SV_y,spr_enemy_gunnerDrone,.9,10);

SV_p.txt[0] = "M:/brief/assets/img/tgt_gunnerDrone";

ds_list_add(lst_panels,SV_p);