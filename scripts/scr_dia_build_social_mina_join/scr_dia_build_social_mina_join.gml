ds_grid_destroy(global.grd_dia);
global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep();

if(ds_exists(global.currentSocial,ds_type_map)){
    global.grd_dia[# DIA_NAME,SV_i] = global.currentSocial[? SOC_VAR_NAME];
}

global.grd_dia[# DIA_SPR_R,SV_i] = spr_mina_neutral;
global.grd_dia[# DIA_REFR_R,SV_i] = true;
global.grd_dia[# DIA_FOCUS_R,SV_i] = true;
global.grd_dia[# DIA_TXT,SV_i] = "*Sigh*";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Paprika";
global.grd_dia[# DIA_SPR_L,SV_i] = spr_paprika_neutral;
global.grd_dia[# DIA_REFR_L,SV_i] = true;
CS_SWITCHDIAFOCUS;
global.grd_dia[# DIA_TXT,SV_i] = "Huh? Is that...";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Wow! Imo, look look!";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = global.currentSocial[? SOC_VAR_NAME];
CS_SWITCHDIAFOCUS;
global.grd_dia[# DIA_TXT,SV_i] = "Oh! You guys!";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Thanks again so much for your help! I bet I'd still be stuck taking those dumb exams if you didn't come along!";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Imo'lei";
global.grd_dia[# DIA_SPR_L,SV_i] = spr_imo_neutral;
global.grd_dia[# DIA_REFR_L,SV_i] = true;
CS_SWITCHDIAFOCUS;
global.grd_dia[# DIA_TXT,SV_i] = "Oh yeah, don't mention it. How's adventuring treating you anyways?";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = global.currentSocial[? SOC_VAR_NAME];
CS_SWITCHDIAFOCUS;
global.grd_dia[# DIA_TXT,SV_i] = "Oh it's- ah, uhm... w-well...";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Nobody told me it would be this hard to find a party...";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Imo'lei";
CS_SWITCHDIAFOCUS;
global.grd_dia[# DIA_TXT,SV_i] = "Color me surprised, I figured people would be flocking to play with somebody like you, you look like a real social butterfly.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = global.currentSocial[? SOC_VAR_NAME];
CS_SWITCHDIAFOCUS;
global.grd_dia[# DIA_TXT,SV_i] = "That's just it though! It's not like I can't find people, but everybody I run into is hitting on me or just wants to RP, talk about total sleazebags!";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Paprika";
global.grd_dia[# DIA_SPR_L,SV_i] = spr_paprika_neutral;
global.grd_dia[# DIA_REFR_L,SV_i] = true;
CS_SWITCHDIAFOCUS;
global.grd_dia[# DIA_TXT,SV_i] = "Oh how terrible! Hey, we're not total sleazebags, why not join up with us?";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Imo'lei";
global.grd_dia[# DIA_SPR_L,SV_i] = spr_imo_neutral;
global.grd_dia[# DIA_REFR_L,SV_i] = true;
global.grd_dia[# DIA_TXT,SV_i] = "Excuse me? That's not *your* decision to make, you furball.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Paprika";
global.grd_dia[# DIA_SPR_L,SV_i] = spr_paprika_neutral;
global.grd_dia[# DIA_REFR_L,SV_i] = true;
global.grd_dia[# DIA_TXT,SV_i] = "But Imooooo! This is our fate, our destiny!";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "We saved her from that dreaded test, now we must save her from the dreaded creepos!";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Imo'lei";
global.grd_dia[# DIA_SPR_L,SV_i] = spr_imo_neutral;
global.grd_dia[# DIA_REFR_L,SV_i] = true;
global.grd_dia[# DIA_TXT,SV_i] = "Tch, as much as I hate douches like that...";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = ".........";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Listen you. I run this team, and I don't have any interest hauling dead weight around, so if you still flounder around like you did during that exam, you're outta here.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = global.currentSocial[? SOC_VAR_NAME];
CS_SWITCHDIAFOCUS;
global.grd_dia[# DIA_TXT,SV_i] = "You got it! Mina Ajett, at your service, I promise I won't let you down!";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_home_endDia;

ds_stack_push(global.stk_menuAlert,scr_unlockChar_mina);