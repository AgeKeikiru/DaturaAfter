ds_grid_destroy(global.grd_dia);
global.grd_dia = ds_grid_create(8,0);

var SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "UGH!";
global.grd_dia[# DIA_FOCUS_L,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "I can't STAND when she does that shit! So high-and-mighty, it drives me insane!";

SV_i = scr_dia_newStep(CHAR_PAPRIKA,false);
global.grd_dia[# DIA_TXT,SV_i] = "Take it easy! We're gonna get into that tournament, we're gonna win, and then we're gonna show that drama queen what for!";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "...Hmph, of course. We'll smash her dumb face in, but how do we damage her? Our attacks didn't make a dent.";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep(CHAR_AILE,false);
global.grd_dia[# DIA_TXT,SV_i] = "It's our equipment. Babel XR derives stat progression from 3 types of chips: Weapons, Armor, and Classes.";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Weapon chips are the primary way to deal damage - their attacks are usually basic but cost little energy to use, and help speed up energy recovery.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Armor chips boost more than just defense - there's a chip for every basic stat, and they also affect your elemental resistances.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Class chips are the most important - they provide a mix of large stat increases and unique attacks that come with special properties.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Different class chips are designed to help players fill specific roles.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Your class, Evoker, excels in dealing damage and status effects. My class, Angel, is flexible to balance the party as needed. And Paprika's, Chef, is durable and does well supporting allies.";

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "Right, so long story short we need better stuff.";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Weapons and armor sound simple enough, but classes might take some getting used to. Most of the games I play don't do the whole... role thing.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "???";
global.grd_dia[# DIA_TXT,SV_i] = "Indeed, class chips are not a topic to dive into blindly. Thankfully, I should be able to be of assistance.";
global.grd_dia[# DIA_FOCUS_L,SV_i] = false;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "???";
global.grd_dia[# DIA_TXT,SV_i] = "Advisory unit AU-9DV-TSHW, designation: Tear. I am your assigned operator for your time in Babel XR - I look forward to working with you.";
global.grd_dia[# DIA_FOCUS_R,SV_i] = true;
global.grd_dia[# DIA_SPR_R,SV_i] = spr_npc_tear;
global.grd_dia[# DIA_REFR_R,SV_i] = true;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Tear";
global.grd_dia[# DIA_TXT,SV_i] = "I will handle mission relay and client negotiations. In addition I can augment your chips, which would be the most direct way to improve your combat ability.";

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "Alright Tear, so you give us the jobs, we make some money, upgrade our gear, and then I'll be on even terms with Blaze?";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_NAME,SV_i] = "Tear";
global.grd_dia[# DIA_TXT,SV_i] = "Mm. Your first assignment is already waiting for you. You can find me in the Mission Center whenever you want to accept a mission or upgrade your chips.";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep(CHAR_IMOLEI,true);
global.grd_dia[# DIA_TXT,SV_i] = "Straightforward, I like it.";
CS_SWITCHDIAFOCUS;

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_TXT,SV_i] = "Well what're we waiting for? These chips aren't gonna upgrade themselves, let's get a move on.";

SV_i = scr_dia_newStep();
global.grd_dia[# DIA_SCR,SV_i] = scr_home_endDia;