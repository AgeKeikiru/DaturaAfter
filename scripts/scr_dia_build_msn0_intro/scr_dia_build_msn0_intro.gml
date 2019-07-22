ds_grid_destroy(global.grd_dia);
global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep(CHAR_BLAZE,false);
global.grd_dia[# DIA_NAME,SV_i] = "???";
global.grd_dia[# DIA_TXT,SV_i] = "Yo.";
global.grd_dia[# DIA_FOCUS_R,SV_i] = true;
global.grd_dia[# DIA_REFR_R,SV_i] = true;
global.grd_dia[# DIA_REFR_L,SV_i] = true;
global.grd_dia[# DIA_SPR_L,SV_i] = spr_imo_neutral;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Ah shit you brought friends, hold on.\n*Ahem*";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Huhuhu... so, you finally showed up? I was starting to think you got cold feet.";

SV_i = scr_dia_newStep(CHAR_AILE,true);
global.grd_dia[# DIA_TXT,SV_i] = "Aa, i-it's really her...";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep(CHAR_PAPRIKA,true);
global.grd_dia[# DIA_TXT,SV_i] = "I know, right!? I wonder if she brought her friends!";

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "Don't get intimidated, she's full of shit.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "You always have been, Blaze.";

SV_i = scr_dia_newStep(CHAR_BLAZE,false);
global.grd_dia[# DIA_TXT,SV_i] = "Hey! First of all: can you not go around undermining my reputation please? I work hard to get reactions like that out of people!";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "And secondly: I'll tell mom that you're cussing missy.";

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "Cut the crap! You know why I'm here, so let's get started already.";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep(CHAR_BLAZE,false);
global.grd_dia[# DIA_TXT,SV_i] = "Eh? You were being serious about that?";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Ahahaha! You just started haven't you? Tell you what - I'll be your punching bag while you get used to the controls, at least until I get bored.";

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "...";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Ah, aha... you haven't changed a bit, sis.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "That cocky attitude, you always know...";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "...just how to piss me off.";

SV_i = scr_dia_newStep(CHAR_BLAZE,false);
global.grd_dia[# DIA_TXT,SV_i] = "Don't say I didn't warn you~";
CS_SWITCHDIAFOCUS;

with obj_handler_dungeon{
    grd_mobPool[# 0,DH_MOB_ID1] = CHAR_PVP_AILE;
    grd_mobPool[# 0,DH_MOB_ID2] = CHAR_PVP_IMO;
    grd_mobPool[# 0,DH_MOB_ID3] = CHAR_PVP_PAPRIKA;
    
    grd_mobPool[# 0,DH_MOB_PMIN] = 0;
    grd_mobPool[# 0,DH_MOB_PMIN] = 0;
    
    grd_mobPool[# 0,DH_MOB_LV1] = 0;
    grd_mobPool[# 0,DH_MOB_LV2] = 0;
    grd_mobPool[# 0,DH_MOB_LV3] = 0;
    
    state_battle = true;
    state_boss = true;
    endDia_battle = true;
    missionComplete = true;
}

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_dungeon_endDia;