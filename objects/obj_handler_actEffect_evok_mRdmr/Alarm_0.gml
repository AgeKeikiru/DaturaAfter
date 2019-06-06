/// @description Insert description here
if(scr_exists(src,asset_object)){
    var
    _pX = src.x,
    _pY = src.y + -70,
    _p = instance_create_depth(_pX,_pY,0,obj_fpo_parent);
    
    _p.txt_shadow[0] = true;
    _p.txt_ft[0] = ft_dungeonBoldLarge;
    _p.txt_col[0] = c_white;
    _p.txt_col2[0] = c_dkgray;
    _p.txt_xScale[0] = 1.3;
    _p.txt_yScale[0] = _p.txt_xScale[0];
    _p.txt_weight[0] = 4;
    _p.txt_halign[0] = fa_center;
    _p.vspeed = -2;
    _p.alarm[0] = 70;
    _p.alarm[1] = 60;
    _p.layer = global.ly_obj[4];
    _p.txt[0] = "Stance";
}