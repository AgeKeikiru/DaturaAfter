scr_activateQuest(Q_TEST);
global.map_flags[? SOC_FG_STATUS + SOC_ARI_JOIN1] = 3;

ds_grid_destroy(global.grd_dia);
global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep(CHAR_AILE,true);
global.grd_dia[# DIA_TXT,SV_i] = "Big sis!";
global.grd_dia[# DIA_FOCUS_L,SV_i] = true;

SV_i = scr_dia_newStep(CHAR_ARI,false);
global.grd_dia[# DIA_TXT,SV_i] = "*Gasp* Holy crap! Aile, is that you?";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Awwww, you even got some of my costume parts! You're so freakin' adorb girl!";

SV_i = scr_dia_newStep(CHAR_AILE,true);
global.grd_dia[# DIA_TXT,SV_i] = "A-ah, yeah, I can't believe I finally found you- oh!";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "You changed some of your outfit though, what happened?";

SV_i = scr_dia_newStep(CHAR_ARI,false);
global.grd_dia[# DIA_TXT,SV_i] = "Aha, shoulda known you'd catch that right away, you always did have an eye for detail.";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Ehehe... you're looking at Unite's newest Flex! Like the uniform? I got to pick the colors at least!";

SV_i = scr_dia_newStep(CHAR_AILE,true);
global.grd_dia[# DIA_TXT,SV_i] = "U... nite?";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep(CHAR_ARI,false);
global.grd_dia[# DIA_TXT,SV_i] = "Ack... even you haven't heard of 'em, huh?";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "W-well! That's another one of my roles on the team too!";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "As a streamer, I'll be spreading the word of the next big thing to hit Babel XR!";

SV_i = scr_dia_newStep(CHAR_AILE,true);
global.grd_dia[# DIA_TXT,SV_i] = "Oh, I see, I guess you won't have time to play with us then...";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep(CHAR_ARI,false);
global.grd_dia[# DIA_TXT,SV_i] = "Don't be silly! What kind of big sis couldn't make time for her little protege?";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "But uh, I do gotta make sure you're not tripping over yourself if I'm gonna run with you. Don't wanna look like a babysitter, y'know?";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Just uh, consider it a test! If you wanna use my outfit, you gotta be able to walk the walk!";

SV_i = scr_dia_newStep(CHAR_AILE,true);
global.grd_dia[# DIA_TXT,SV_i] = "I-I'll do it! I can walk the walk!";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep(CHAR_ARI,false);
global.grd_dia[# DIA_TXT,SV_i] = "Attagirl! Don't worry, it's nothing crazy...";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_home_endDia;