ds_grid_destroy(global.grd_dia);

global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep(CHAR_AILE,true);
global.grd_dia[# DIA_TXT,SV_i] = "Biosensors are clear!";
global.grd_dia[# DIA_FOCUS_L,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Scylla";
global.grd_dia[# DIA_TXT,SV_i] = "Yes, it would appear we've routed them, for now.";
global.grd_dia[# DIA_SPR_R,SV_i] = spr_npc_scylla;
global.grd_dia[# DIA_REFR_R,SV_i] = true;
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Now then, I must regroup with my squadron so we can search for any stragglers and other civillians that were unable to make their way here-";

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "Hold it!";
global.grd_dia[# DIA_REFR_L,SV_i] = true;
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "I told you I wanted your gratitude in person - don't you think that many enemies would've been way too much to handle alone?";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Scylla";
global.grd_dia[# DIA_TXT,SV_i] = "And I told you, you are grossly underestimating the ability of a Knight of Layered.";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "...However.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "I suppose that has no bearing on the fact that you did still fight most admirably.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "I cannot endorse such reckless behavior, but the fact that you actually made it here is a testament to your abilities.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "I would reccomend seeking out a local squireship, you could make something of yourself.";

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "Ha, no thanks, knights aren't really my style-";
global.grd_dia[# DIA_SPR_R,SV_i] = noone;
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Hey! Quit walking away! I'm not done with you!";

SV_i = scr_dia_newStep(CHAR_PAPRIKA,false);
global.grd_dia[# DIA_TXT,SV_i] = "A squireship, huh? Being a Knight looks pretty cool I think!";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "\"Incoming transmission from HQ? You need me to save the president? Roger that, beginning the mission now!\"";

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "Ugh, not if you have to be that uppity.";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "I haven't gotten a headache this bad since talking to a certain somebody...";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_dungeon_endDia;