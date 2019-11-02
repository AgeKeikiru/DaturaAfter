var _off = 0;

#region //tutorial

    _off = 0;
    global.map_wiki[? WIKI_TUT] = en_wiki_tut.LENGTH;
    
    global.map_wiki[? WIKI_TUT + string(en_wiki_tut.stats + _off)] = [
        "Stats",
        
        "There are 12 basic stats used to evaluate the strengths and weaknesses of each character. Studying the stats of both ally and enemy is the foundation of any and all strategy when tackling missions.\n\n" +
        "HP: Hit Points. Defeated when dropped to 0.\n\n" +
        "EN: Energy. Required to use Weapon Chips and most Class Skills. Will recover gradually over time and is actively generated when the user lands an attack with a Weapon Chip.\n\n",
        
        "M-ATK/DEF: Melee Attack/Defense. The primary stats that affect damage from Weapon Chips and Class Skills related to martial arts and close combat.\n\n" +
        "F-ATK/DEF: Firearm Attack/Defense. The primary stats that affect damage from Weapon Chips and Class Skills related to ranged weapons and high-tech gear.\n\n" +
        "S-ATK/DEF: Spell Attack/Defense. The primary stats that affect damage from Weapon Chips and Class Skills related to scrolls and the arcane.",
        
        "ACC/EVA: Accuracy/Evasion. The primary stats that affect the probability of attacks landing successfully.\n\n" +
        "SPD: Speed. Determines how quickly Act Slots recover from cooldown.\n\n" +
        "MISC: Miscellaneous. A vague stat with no concrete effects, but is rumored to impact critical rate and damage variance."
    ];
    
    global.map_wiki[? WIKI_TUT + string(en_wiki_tut.elements + _off)] = [
        "Elements",
        
        "In addition to the basic stats, each character has resistances or weaknesses to each of the 6 primary elements. Resistances affect damage taken as well as the likelihood of receiving each element's related status effect.\n\n" +
        "FIR: Fire. Causes Burn status (adds recoil to all attacks, has a chance to spread to allies when hit).\n\n" +
        "ICE: Ice. Causes Slow status (drastically reduces speed, negates ability to dodge attacks).\n\n",
        
        "NAT: Nature. Causes Silence status (elemental attacks are disabled, buff duration is decreased).\n\n" +
        "ELC: Electric. Causes Paralyze status (disables Stance Acts, negates ability to dodge attacks).\n\n" +
        "LGT: Light. Causes Blind status (attacks have a fixed chance of missing, crits are disabled).\n\n" +
        "DRK: Dark. Causes Poison status (gradually lose health over time, non-status debuff duration is increased).\n\n"
    ];
    
    global.map_wiki[? WIKI_TUT + string(en_wiki_tut.wepChip + _off)] = [
        "Weapon Chips",
        
        "TBA"
    ];
    
    global.map_wiki[? WIKI_TUT + string(en_wiki_tut.armChip + _off)] = [
        "Armor Chips",
        
        "TBA"
    ];
    
    global.map_wiki[? WIKI_TUT + string(en_wiki_tut.clsChip + _off)] = [
        "Class Chips",
        
        "TBA"
    ];
    
    global.map_wiki[? WIKI_TUT + string(en_wiki_tut.actProperties + _off)] = [
        "Act Properties",
        
        "Weapon Chips and Active Class Skills have sets of properties that distinguish them from one another. Like character stats, knowledge of these properties is critical to understanding their proper use. A small number of these properties are shared by Armor Chips as well.\n\n" +
        "RANK: Exclusive to Weapon/Armor Chips, Rank is one of the broadest measures of overall value. The scale ranges from 0 to 6, with R6 Weapon Chips being the rarest and most sought after, often containing weapons with extraordinary additional effects as well as unrivaled general performance.\n\n",
        
        "PLUS: Exclusive to Weapon/Armor Chips, the Plus rating of a chip denotes smaller, incremental upgrades. The scale ranges from +0 to +10, and +10 chips can be reforged into a chip of a higher Rank, though this process resets the chip's Plus rating to +0.\n\n" +
        "TGT: Target Type. Denotes whether an Act affects the user only (SELF), a single unit (SINGLE), all units in the target party (WIDE), or units of the target party at random (RANDOM).\n\n",
        
        "PWR: Power. The base stat used to determine the damage/potency of an Act.\n\n" +
        "ACC: Accuracy. The base stat used to determine the likelihood that the Act will be successful.\n\n" +
        "COST: How much Energy is required to use the Act.\n\n" +
        "CD: Cooldown. Determines how long before an Act can be used again.\n\n",
        
        "TYP: Damage Scaling Type. Denotes which ATK stat and which DEF stat is used by the attacker and target during damage calculation, respectively. For example, \"FvS\" means the damage will receive a bonus based on the attacker's F-ATK, and a penalty based on the target's S-DEF.\n\n" +
        "ELE: Element. Acts with an element value will use the target's relevant elemental resistance during damage calculation. NOTE: an Act having an element value does NOT mean it has a chance to inflict the related status effect.\n\n",
        
        "STANCE ACT: Acts with the STANCE property are special buffs that provide unique bonuses to the user. A user can only have 1 stance active at a time, and cannot have an active Stance while paralyzed.\n\n" +
        "AGILE ACT: Acts with the AGILE property are not affected by the universal cooldown caused by normal Act use.\n\n" +
        "X ACT: Acts with the X ACT property are very powerful, but do not cooldown passively. Instead, their cooldown will only decrease by a fixed amount each time a specific condition is met - killing enemies, taking damage, etc."
    ];
    
    global.map_wiki[? WIKI_TUT + string(en_wiki_tut.explore + _off)] = [
        "Exploration",
        
        "TBA"
    ];
    
    global.map_wiki[? WIKI_TUT + string(en_wiki_tut.combat + _off)] = [
        "Combat",
        
        "TBA"
    ];
    
    global.map_wiki[? WIKI_TUT + string(en_wiki_tut.missionRank + _off)] = [
        "Mission Rank",
        
        "TBA"
    ];

#endregion

#region //chars

    _off = 0;
    global.map_wiki[? WIKI_CHAR] = en_chars.slime;
    
    for(var _i = 0;_i < en_chars.slime;_i++){
        global.map_wiki[? WIKI_CHAR + string(_i)] = [
            "???",
            
            "TBA"
        ];
    }
    
    global.map_wiki[? WIKI_CHAR + string(en_chars.imolei + _off)] = [
        "Imo'lei Nari",
        
        "A brash, impudent girl who started playing Babel XR purely to beat her sister at it.\n\n" +
        "Having a bit of an inferiority complex due to her sister's achievements, Imo is quick to brag about her own victories and hates taking help from others.\n\n" +
        "Her journey begins to a rough start as, unfamiliar with MMOs, she gets a rude awakening to the difference in power between herself and her end-game geared, max level sister.",
        
        "Likes: \n- Physical activity \n- Competition\n\n" +
        "Hates: \n- Being underestimated \n- Scheming\n\n" +
        "Favorite Movie Genre: Samurai Cinema"
    ];
    
    global.map_wiki[? WIKI_CHAR + string(en_chars.aile + _off)] = [
        "Aile Ferrox",
        
        "A studious, shy girl who started playing Babel XR to stay in touch with her older sister, Ari.\n\n" +
        "She gained interest after watching Ari's streams of the game and, due to analyzing a mix of streamed gameplay and wiki info, has an extraordinary knowledge of Babel XR's world and systems considering her lack of any first-hand experience.\n\n" +
        "That said, she still chose angel as her starting class to follow in her sister's footsteps - a suitable but inoptimal class for her penchant to stay on the backlines.",
        
        "Likes: \n- White noise \n- Wiki-diving\n\n" +
        "Fears: \n- Rushing \n- \"Crossing the rubicon\"\n\n" +
        "Favorite Cat: Maine Coon"
    ];
    
    global.map_wiki[? WIKI_CHAR + string(en_chars.paprika + _off)] = [
        "Paprika",
        
        "A plucky but slightly enigmatic young girl who somehow managed to barge her way into Imo's party when she first began playing. Her real name is unknown.\n\n" +
        "A devout fan of Witchy - one of the members of MPx - when she heard Imo's plan to beat MPx at the upcoming PvP invitational, she figured it was her best chance at meeting and befriending Witchy in person.\n\n" +
        "Easy to please, and with a straightforward view on life, Paprika is simply here to have fun and is untroubled by the complexities of Imo's journey.",
        
        "Likes: \n- Nature \n- Meeting strangers\n\n" +
        "Hates: \n- Being challenged \n- Physical books\n\n" +
        "Favorite Food: Beef Stew"
    ];
    
    global.map_wiki[? WIKI_CHAR + string(en_chars.blaze + _off)] = [
        "Blaze Nari",
        
        "Community Manager and known edgelord, Blaze was the brainchild behind the original concept for the first \"Exceed Reality\" MMO known as Babel XR.\n\n" +
        "Blaze and the other members of her 3-man raid group \"MPx\" are usually seen during seasonal events showing off new gear and just generally making a spectacle of themselves.\n\n" +
        "Despite her cold exterior, Blaze tends to be very agreeable and avoids conflict as much as possible. And doubly despite her true personality, she will almost instinctually turn to a bombastic villain-esque persona when approached in-game.",
        
        "Likes: \n- Technology \n- Acting\n\n" +
        "Hates: \n- Drama about other people \n- Being unprepared\n\n" +
        "Favorite Weapon Type: Shotgun"
    ];
    
    global.map_wiki[? WIKI_CHAR + string(en_chars.ari + _off)] = [
        "Ari Ferrox",
        
        "A cheerful girl that began streaming Babel XR full-time in hopes that XRMMOs will gain popularity, as this is the first game to incorporate physical motion in a way she has found captivating.\n\n" +
        "Ari is incredibly free-spirited and not afraid to speak her mind, often to a fault. This translates to a highly aggressive playstyle, however since she often takes stray hits from not paying attention, she is incapable of spec-ing as a glass cannon.\n\n",
        
        "As a result, she has found herself gravitating towards the highly flexible Angel and Ace classes, typically filling a multirole position when playing in groups, and can easily handle most content solo.",
        
        "Likes: \n- Exercise \n- Comics\n\n" +
        "Hates: \n- Talking politics \n- Plain food\n\n" +
        "Favorite Cat: Lynx"
    ];

#endregion

#region //orgs

    _off = 0;
    global.map_wiki[? WIKI_ORG] = en_wiki_org.LENGTH;
    
    global.map_wiki[? WIKI_ORG + string(en_wiki_org.hp + _off)] = [
        "Zikade-G",
        
        "Zikade Global has built a strong foothold in the adventurer market by supporting novices early on with training programs as well as affordable, beginner-friendly armor that focuses on survivability and ease of use.\n\n" +
        "While some adventurers eventually switch to armor that better fits their playstyle, many stick with Zikade products out of a sense of loyalty or simply familiarity."
    ];
    
    global.map_wiki[? WIKI_ORG + string(en_wiki_org.en + _off)] = [
        "Quisar Ind.",
        
        "Quisar Industries works primarily in infrastructure work, with a specialization in electrical engineering that has led to them designing almost all current power supplying infrastructure in the world.\n\n" +
        "As adventuring became a burgeoning market, Quisar began to invest in retooling some of their patented energy conversion technology for use in incredibly energy efficient adventuring gear."
    ];
    
    global.map_wiki[? WIKI_ORG + string(en_wiki_org.acc + _off)] = [
        "Kurtzfelt Tech",
        
        "TBA"
    ];
    
    global.map_wiki[? WIKI_ORG + string(en_wiki_org.eva + _off)] = [
        "AIDR",
        
        "Advanced Investigation Development/Research is dedicated to providing equipment primarily designed for land surveyors, archaeologists, and other jobs that benefit greatly from ease of movement.\n\n" +
        "These ergonomic designs are also preferred by adventurers that rely on dexterity and out-maneuvering their enemies."
    ];
    
    global.map_wiki[? WIKI_ORG + string(en_wiki_org.atk + _off)] = [
        "Ashe & Iris",
        
        "TBA"
    ];
    
    global.map_wiki[? WIKI_ORG + string(en_wiki_org.def + _off)] = [
        "Zikade-L",
        
        "Zikade's Loewi branch has slowly seperated itself from the Global branch, but continues to use the Zikade name for brand recognition, much to the Global branch's chagrin. Zikade-L has a much more cutthroat focus on profit, and does not share Global's emphasis on forging bonds with adventurers.\n\n" +
        "The name confusion between the two companies has negatively impacted Zikade-G's public image several times, and they have expressed their intention of forcing the Loewi branch to cut its association with Zikade eventually."
    ];
    
    global.map_wiki[? WIKI_ORG + string(en_wiki_org.spd + _off)] = [
        "Leosocial Adv.",
        
        "Leosocial Advancements is an up-and-coming armor developer that pushes its fashionable and speed-oriented equipment with trendy marketing campaigns and frequent promotional giveaways.\n\n" +
        "Known to pull PR stunts that have earned the ire of competing manufacturers, but is far and away the most popular equipment provider for younger and more casual players, as well as members of the RP community."
    ];
    
    global.map_wiki[? WIKI_ORG + string(en_wiki_org.misc + _off)] = [
        "Xerion Ltd.",
        
        "Not much is known of this company - its primary operating center, mission statement, and benefits of its products are all shrouded in mystery.\n\n" +
        "Has been suspected of bootlegging and counterfeiting competing products on multiple occasions."
    ];
    
    global.map_wiki[? WIKI_ORG + string(en_wiki_org.null + _off)] = [
        "Scrap",
        
        "A hastily repaired second-hand armor chip. Impossible to trace back to its original manufacturer, and barely functions."
    ];

#endregion