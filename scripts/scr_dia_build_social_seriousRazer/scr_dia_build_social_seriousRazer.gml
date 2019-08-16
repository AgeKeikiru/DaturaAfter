ds_grid_destroy(global.grd_dia);
global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep();

if(ds_exists(global.currentSocial,ds_type_map)){
    global.grd_dia[# DIA_NAME,SV_i] = global.currentSocial[? SOC_VAR_NAME];
}

global.grd_dia[# DIA_TXT,SV_i] = "Ugh, what the hell did they do to Razer?";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Kneecap and Adapt Dodge got nerfed to hell and back recently - I used to be able to use just those two skills and solo entire late-game dungeons.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "But now? Bah, they're alright but take way too long to recast.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Tch, not like it matters anyhow, soloing dungeons is nothing compared to Violet.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Heard of 'em? Famous for getting world-firsts on new raids totally solo. Some big raid groups gave up on going for WFs entirely 'cuz of 'em.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "PvP Invitational's coming up though, if Violet signs up they'll be sure to rip straight to grand finals - that'll be my chance to take 'em down!";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "You planning on entering too? Don't even think of getting in my way. Razer may not be able to solo dungeons anymore, but I'll still tear other players to pieces.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_home_endDia;