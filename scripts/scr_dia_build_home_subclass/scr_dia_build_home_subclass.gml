ds_grid_destroy(global.grd_dia);
global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_NAME,SV_i] = "Tear";
global.grd_dia[# DIA_TXT,SV_i] = "Good, you've made it back. I was waiting for you lot - I saw your encounter, and heard you have some questions about subclasses.";
global.grd_dia[# DIA_SPR_R,SV_i] = spr_npc_tear;
global.grd_dia[# DIA_FOCUS_L,SV_i] = false;
global.grd_dia[# DIA_FOCUS_R,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Imo'lei";
CS_SWITCHDIAFOCUS;
global.grd_dia[# DIA_TXT,SV_i] = "Just how long were you gonna keep that from me? I'm running out of time until the tournament and suddenly there's a whole other class I need to even have a fighting chance?";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Tear";
CS_SWITCHDIAFOCUS;
global.grd_dia[# DIA_TXT,SV_i] = "Just you, Imo'lei?";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Imo'lei";
CS_SWITCHDIAFOCUS;
global.grd_dia[# DIA_TXT,SV_i] = "Huh?";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Tear";
CS_SWITCHDIAFOCUS;
global.grd_dia[# DIA_TXT,SV_i] = "As your operator, it is my responsibility to monitor your progress as an adventurer, and I've noticed for a long time now that you are awfully ill-suited to the position of team leader that you've strong-armed yourself into.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "You cannot lead a party if you don't realize your teammates even exist.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Imo'lei";
CS_SWITCHDIAFOCUS;
global.grd_dia[# DIA_TXT,SV_i] = "Oh fuck this, I don't need a lecture on how to run *my* team from some AI. If you're not gonna tell me what I need to know then we're done here.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Tear";
CS_SWITCHDIAFOCUS;
global.grd_dia[# DIA_TXT,SV_i] = "Suit yourself. But how do you expect to obtain a subclass without proper authorization from both the guild and your *operator*?";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Imo'lei";
CS_SWITCHDIAFOCUS;
global.grd_dia[# DIA_TXT,SV_i] = "You...";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Tch, what do you want, then? If it's the only way I'm gonna have a shot at the tournament then I'm all ears, alright?";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Tear";
CS_SWITCHDIAFOCUS;
global.grd_dia[# DIA_TXT,SV_i] = "Understand, I only have your best interest in mind - I also want you to win the invitational, however in order to do that you will need to improve your leadership skills.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "The greatest adventuring teams all know how to move as one, and I am willing to help you reach that level of synchronicity.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Now, if you've calmed down and are ready to cooperate, the guild simply needs a sign of proof that you are ready to manage a second class. A fully levelled class chip should suffice.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Bring one to me in my lab, and I'll handle the rest. Don't worry, I just need to scan it and I'll hand it right back to you.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "As for your leadership skills, I will give you some advice as you continue to tackle missions so you can put it practice right away. I will not interfere with how you choose to continue, as long as you at least consider your party members more thoroughly, agreed?";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Imo'lei";
CS_SWITCHDIAFOCUS;
global.grd_dia[# DIA_TXT,SV_i] = "...Simple enough, fine. I don't party up with weaklings anyways, so I- ...err, *we*, are gonna keep smashing through these missions until you really know what you're dealing with.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Tear";
CS_SWITCHDIAFOCUS;
global.grd_dia[# DIA_TXT,SV_i] = "...";
global.grd_dia[# DIA_SPR_L,SV_i] = noone;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "(It's not always about strength, and yet...)";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "(You have a surprisingly keen eye for teammates nonetheless. There may be quite the leader in you after all...)";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_home_endDia;