with obj_handler_menuUI{
    var
    _w = irandom_range(450,200),
    _h = irandom_range(450,200);
    
    if(!surface_exists(global.sfc_glitch)){
        global.sfc_glitch = surface_create(1,1);
    }
    
    surface_resize(global.sfc_glitch,_w,_h);
    surface_set_target(global.sfc_glitch);
    draw_clear_alpha(c_white,0);
    
    shader_set(shd_glitch);

    repeat(2){
        var
        _spr = choose(
            spr_enemy_slime,
            spr_enemy_evoker,
            spr_enemy_bleedingBullet,
            spr_enemy_wolfeant,
            spr_enemy_candywing
        ),
        _uvs = sprite_get_uvs(_spr,0),
        _tex = sprite_get_texture(_spr, 0),
        _x = irandom_range(0,_w),
        _y = irandom_range(_h / 2,_h);
        
        shader_set_uniform_f(suni_glitch_uvs, _uvs[0],_uvs[1],_uvs[2],_uvs[3]);
        shader_set_uniform_f(suni_glitch_region, 32);
        shader_set_uniform_f(suni_glitch_texel, texture_get_texel_width(_tex),texture_get_texel_height(_tex));
        
        draw_sprite(_spr,0,_x,_y);
    }
    
    shader_reset();
    surface_reset_target();
    
    return sprite_create_from_surface(global.sfc_glitch,0,0,_w,_h,false,false,_w / 2,_h);
}