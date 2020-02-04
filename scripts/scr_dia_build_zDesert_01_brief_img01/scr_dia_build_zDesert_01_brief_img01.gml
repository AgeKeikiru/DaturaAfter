var
SV_x = (room_width / 2) + -(sprite_get_width(spr_brief_zDesert_01_1) / 2),
SV_y = 20,
SV_p = scr_createImgPanel(SV_x,SV_y,spr_brief_zDesert_01_1,1,12);

SV_p.txt[0] = "M:/brief/assets/img/area_map";

ds_list_add(lst_panels,SV_p);

scr_playSfx(sfx_brief);