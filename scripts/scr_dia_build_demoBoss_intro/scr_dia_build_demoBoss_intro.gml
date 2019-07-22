ds_grid_destroy(global.grd_dia);
global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep(CHAR_BLAZE,false);
global.grd_dia[# DIA_TXT,SV_i] = "Yo.";
global.grd_dia[# DIA_FOCUS_R,SV_i] = true;
global.grd_dia[# DIA_REFR_R,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Looks like you made it to the end of the demo, congrats!";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Yeah that briefing was a load of shit, I just wanted to get you out here.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Now that you have a hang of the game, we can try the prologue forreal this time.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "You saw first-hand what I can do though, and it's gonna be even worse now that I'm not stuck behind player input, so I hope you're ready!";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "";
global.grd_dia[# DIA_TXT,SV_i] = "-ASSET [spr_enemy_blaze] NOT FOUND-";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Blaze";
global.grd_dia[# DIA_TXT,SV_i] = "Eh!? Uhh, I'll just make something up real quick...";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_dungeon_endDia;

global.map_flags[? FG_FREEPLAY] = true;

with obj_handler_dungeon{
    grd_mobPool[# 0,DH_MOB_ID1] = noone;
    grd_mobPool[# 0,DH_MOB_ID2] = CHAR_PVP_BLAZE;
    grd_mobPool[# 0,DH_MOB_ID3] = noone;
    
    grd_mobPool[# 0,DH_MOB_PMIN] = 0;
    grd_mobPool[# 0,DH_MOB_PMIN] = 0;
    
    grd_mobPool[# 0,DH_MOB_LV1] = 0;
    grd_mobPool[# 0,DH_MOB_LV2] = 50;
    grd_mobPool[# 0,DH_MOB_LV3] = 0;
    
    state_battle = true;
    state_boss = true;
    endDia_battle = true;
    missionComplete = true;
}