ds_grid_destroy(global.grd_dia);
global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep();

if(ds_exists(global.currentSocial,ds_type_map)){
    global.grd_dia[# DIA_NAME,SV_i] = global.currentSocial[? SOC_VAR_NAME];
}

global.grd_dia[# DIA_TXT,SV_i] = "Hm... lemme give you a warning.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "You ever run into a Wanderer? Pale, ghostly lookin' things. Got a nasty bite, but they're one trick ponies.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Their only attack can wipe you out quick, but it's light-based.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "If somebody with high Spell or Light defense can keep its attention, it'll be much less of a threat.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Better yet, if you can silence it, that's all she wrote. Silence knocks any element-based attack flat on its ass.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_home_endDia;