///@arg x
///@arg y
///@arg w
///@arg h
///@arg panelLabel

var
SV_x = argument0,
SV_y = argument1,
SV_w = argument2,
SV_h = argument3,
SV_bezel = DEFAULT_PANEL_BEZEL,
SV_panel = instance_create_depth(SV_x + -SV_bezel,SV_y + -(SV_bezel * 3),0,obj_fpo_panel),
SV_menu = instance_create_depth(SV_x,SV_y,0,obj_handler_menu_parent);

SV_panel.visible = false;

SV_menu.link_panel = SV_panel;
SV_menu.btn_w = SV_w;
SV_menu.layer = global.ly_obj[4];

SV_panel.fixedAlpha = false;
SV_panel.tgt_xScale = SV_w + (SV_bezel * 2);
SV_panel.tgt_yScale = SV_h;
SV_panel.txt[0] = argument4;
SV_panel.txt_ft[0] = ft_menuButton;
SV_panel.txt_xScale[0] = .5;
SV_panel.txt_yScale[0] = SV_panel.txt_xScale[0];

return SV_menu;