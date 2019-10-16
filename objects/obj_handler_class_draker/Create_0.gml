/// @description Insert description here
// You can write your code in this editor

event_inherited();

name = "Draker";
desc = "Warriors that channel the might of dragons to slay their foes. A majority of Drakers' benefits are reaped from their Draco Install stance and thus must be wary of avoiding paralysis.";
cName = "DRAK_" + string(global.cid++);

ms_name = "Draco Mastery";
ms_desc = "While <Draco Install> is active, landing hits extend its duration by Lv*0.01%.";
ms_icon = spr_icon_stanceUp;

ss_name = "S-DEF+ (s)";
ss_desc = "Slightly increase base Spell Defense.";
ss_icon = spr_icon_sDefUp;
ss_toolTip = "S-DEF: !";

stat_di_base = 9;
stat_di_rate = 3;

reinstall = false;

#region //tier 1

    var
    _ix = 0,
    _iy = 0;

    grd_skillName[# _ix,_iy] = "M-ATK+";
    grd_skillDesc[# _ix,_iy] = "Increase base Melee Attack.";
    grd_skillTooltip[# _ix,_iy] = "M-ATK: !";
    grd_skillIcon[# _ix,_iy] = spr_icon_mAtkUp;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "EN+";
    grd_skillDesc[# _ix,_iy] = "Increase base EN.";
    grd_skillTooltip[# _ix,_iy] = "EN: !";
    grd_skillRate[# _ix,_iy] = 200;
    grd_skillIcon[# _ix,_iy] = spr_icon_enUp;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "S-ATK+";
    grd_skillDesc[# _ix,_iy] = "Increase base Spell Attack.";
    grd_skillTooltip[# _ix,_iy] = "S-ATK: !";
    grd_skillIcon[# _ix,_iy] = spr_icon_sAtkUp;

#endregion

#region //tier 2

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Draco Claw";
    grd_skillDesc[# _ix,_iy] = "Usable while <Draco Install> is active. A fierce series of melee strikes with a high chance of reducing the target's defenses.";
    grd_skillTooltip[# _ix,_iy] = "Debuff Effect: !%";
    grd_skillRate[# _ix,_iy] = -0.06;
    grd_skillAct[# _ix,_iy] = create(obj_handler_act_drak_dClaw);
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceSlashEnemy;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Draco Install";
    grd_skillDesc[# _ix,_iy] = "Charges by taking damage. Take the form of a dragon for a limited time, increasing aggro and base stats.";
    grd_skillTooltip[# _ix,_iy] = "Duration: !sec\nAggro: @";
    grd_skillRate[# _ix,_iy] = 1;
    grd_skillAct[# _ix,_iy] = create(obj_handler_act_drak_install);
    grd_skillIcon[# _ix,_iy] = spr_icon_stance;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Drake's Vigor";
    grd_skillDesc[# _ix,_iy] = "Recover EN faster while <Draco Install> is active.";
    grd_skillTooltip[# _ix,_iy] = "EN Rec: !%";
    grd_skillRate[# _ix,_iy] = 0.5;
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceUp;

#endregion

#region //tier 3

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Draco Burst";
    grd_skillDesc[# _ix,_iy] = "Usable while <Draco Install> is active. An intense spray of fire breath that deals high spell damage to all enemies and has a high chance of inflicting Burn.";
    grd_skillTooltip[# _ix,_iy] = "Power: !";
    grd_skillRate[# _ix,_iy] = 30;
    grd_skillAct[# _ix,_iy] = create(obj_handler_act_drak_dBurst);
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceBrt;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Uproar";
    grd_skillDesc[# _ix,_iy] = "Unleash a thunderous roar that stuns enemies and draws their attention. Decreases enemy ATK if <Draco Install> is active.";
    grd_skillTooltip[# _ix,_iy] = "";
    grd_skillAct[# _ix,_iy] = create(obj_handler_act_drak_uproar);
    grd_skillIcon[# _ix,_iy] = spr_icon_cycle;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Drake's Regen";
    grd_skillDesc[# _ix,_iy] = "Recover HP while <Draco Install> is active.";
    grd_skillTooltip[# _ix,_iy] = "Recovery: !/sec";
    grd_skillRate[# _ix,_iy] = 5;
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceUp;

#endregion

#region //tier 4

    _ix++;
    _iy = 0;

    grd_skillName[# _ix,_iy] = "Draco Finish";
    grd_skillDesc[# _ix,_iy] = "Usable while <Draco Install> is active. Deal severe melee damage to a target using both M-ATK and S-ATK stats. Ends <Draco Install> immediately.";
    grd_skillTooltip[# _ix,_iy] = "S-ATK Add: !%";
    grd_skillRate[# _ix,_iy] = 0.2;
    grd_skillAct[# _ix,_iy] = create(obj_handler_act_drak_finish);
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceGntBrtEnemy;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Reinstall";
    grd_skillDesc[# _ix,_iy] = "Add a chance for <Draco Install> to reactivate immediately upon expiration. Can only proc once per activation.";
    grd_skillTooltip[# _ix,_iy] = "Proc Rate: !%";
    grd_skillRate[# _ix,_iy] = 0.2;
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceUp;
    
    _iy++;
    
    grd_skillName[# _ix,_iy] = "Drake's Aura";
    grd_skillDesc[# _ix,_iy] = "While <Draco Install> is active, gain a high resistance to status effects, and greatly reduce their duration.";
    grd_skillTooltip[# _ix,_iy] = "Status Resist: !%";
    grd_skillRate[# _ix,_iy] = 0.1;
    grd_skillIcon[# _ix,_iy] = spr_icon_stanceUp;

#endregion