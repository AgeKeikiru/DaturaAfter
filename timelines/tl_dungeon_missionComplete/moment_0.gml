var _phase = global.map_flags[? FG_MSNPHASE];

global.playerControl = false;
global.map_flags[? FG_MSNCLEARS] += 1;
global.map_flags[? FG_MP + string(_phase)] += 1;

scr_updateMsnList();

var _map = scr_data_getMap(global.grd_missions,global.missionCurr);
_map[? MSN_VAR_STATUS] = 2;

map_results[? MCS_TGT_SPD] = missionTime;
map_results[? MCS_DISP_SPD] = 0;
map_results[? MCS_TGT_DMG] = round(missionDmg);
map_results[? MCS_DISP_DMG] = 0;
map_results[? MCS_TGT_BONUS] = 0;
map_results[? MCS_DISP_BONUS] = 0;
map_results[? MCS_TGT_GOLD] = _map[? MSN_VAR_REWARD];
map_results[? MCS_DISP_GOLD] = 0;

if(global.missionCurr == MSN_ZDESERT_01){
    map_results[? MCS_TGT_GOLD] = round(missionDmg / 10) * 3;
}

var
_expTotal = 0,
_expRevealed = 0;

for(var _ix = 0;_ix < ds_grid_width(global.grd_dMap_terrain);_ix++){
    for(var _iy = 0;_iy < ds_grid_height(global.grd_dMap_terrain);_iy++){
        if(global.grd_dMap_terrain[# _ix,_iy] != noone){
            _expTotal++;
            
            if(global.grd_dMap_visible[# _ix,_iy]){
                _expRevealed++;
            }
        }
    }
}

map_results[? MCS_TGT_EXP] = (_expRevealed / _expTotal) * 100;
map_results[? MCS_DISP_EXP] = 0;

scr_playBgm(sfx_clear,global.bgmTrack_curr);

//banner
map_results[? MCS_BG] = instance_create_depth(0,room_height / 2,0,obj_fpo_panel);
with map_results[? MCS_BG]{
    layer = global.ly_obj[4];
    
    image_xscale = room_width;
    image_yscale = 0;
    
    tween_xScale = false;
    tween_yScale = true;
    tween_yPos = true;
    tween_alpha = false;
    tgt_yScale = 60;
    tgt_yPos = y + -(tgt_yScale / 2);
    
    fill_col = c_white;
    fill_alpha = .85;
    crosshair_alpha = 0;
}

//"mission clear"
map_results[? MCS_TITLE] = instance_create_depth(room_width / 2,(room_height / 2) + 10,0,obj_fpo_parent);
with map_results[? MCS_TITLE]{
    layer = global.ly_obj[4];
    
    tween_xPos = true;
    tween_yPos = true;
    x += 400;
    
    tween_alpha = true;
    tgt_alpha = 1;
    image_alpha = 0;
    
    txt[0] = "MISSION CLEAR";
    txt_col[0] = c_dkgray;
    txt_halign[0] = fa_center;
    txt_valign[0] = fa_middle;
    txt_ft[0] = ft_menuTitle;
}