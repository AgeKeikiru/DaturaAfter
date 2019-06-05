var
SV_r = ds_grid_create(4,0),
SV_items = [
    ITEM_HEAL1,
    ITEM_HEAL2,
    ITEM_HEAL3,
    ITEM_RAISE1,
    ITEM_RAISE2,
    ITEM_CURE1,
    ITEM_CURE2,
    ITEM_IMM_FIR,
    ITEM_IMM_ICE,
    ITEM_IMM_ELC,
    ITEM_IMM_NAT,
    ITEM_IMM_LGT,
    ITEM_IMM_DRK,
];

for(var SV_i = 0;SV_i < array_length_1d(SV_items);SV_i++){
    if(global.map_item_held[? SV_items[SV_i]] > 0){
        var SV_y = ds_grid_height(SV_r);
        ds_grid_resize(SV_r,ds_grid_width(SV_r),ds_grid_height(SV_r) + 1);
        
        SV_r[# 0,SV_y] = global.map_item_name[? SV_items[SV_i]];
        SV_r[# 1,SV_y] = global.map_item_held[? SV_items[SV_i]];
        SV_r[# 2,SV_y] = global.map_item_desc[? SV_items[SV_i]];
        SV_r[# 3,SV_y] = SV_items[SV_i];
    }
}

return SV_r;