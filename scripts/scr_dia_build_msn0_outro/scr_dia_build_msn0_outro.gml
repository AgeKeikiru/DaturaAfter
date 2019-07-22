ds_grid_destroy(global.grd_dia);
global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep(CHAR_BLAZE,false);
global.grd_dia[# DIA_TXT,SV_i] = "Alright, bored now.";
global.grd_dia[# DIA_FOCUS_R,SV_i] = true;
global.grd_dia[# DIA_REFR_R,SV_i] = true;
global.grd_dia[# DIA_REFR_L,SV_i] = true;
global.grd_dia[# DIA_SPR_L,SV_i] = spr_imo_neutral;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "I can't hang out all day, I've got troubleshooting to do y'know.";

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "Tch, where do you think you're going...";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "I'm... not done yet!";

SV_i = scr_dia_newStep(CHAR_BLAZE,false);
global.grd_dia[# DIA_TXT,SV_i] = "Hah? You've never played an MMO have you?";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "You CAN'T beat me - you've got no gear, no skills, you literally can't even damage me right now.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Level up a bit, there's a PvP tournament coming up for endgame players in eeeh about a month or so.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Winner gets a crack at me, so if you can get through that I'll know you wont waste my time.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "And more importantly: we'll have a nice audience. No point in kicking your ass for it's own sake, I already knew I could do that.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Get strong, sis.";

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "Damnit, I said wait!";
global.grd_dia[# DIA_SPR_R,SV_i] = noone;
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Fucker!";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_dia_build_msn0_outro_fade;

with obj_handler_dungeon{
    missionComplete = false;
}