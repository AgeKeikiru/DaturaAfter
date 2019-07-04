///@arg src
///@arg slot

var
SV_src = argument0,
SV_slot = argument1,
SV_x = 640 + (380 * (SV_slot + -1)),
SV_y = 380,
SV_r = instance_create_depth(SV_x,SV_y,0,obj_dungeon_battleMember);

SV_r.image_alpha = 0;
SV_r.src = scr_data_getMap(global.grd_chars,SV_src);

scr_trace(SV_src);

SV_r.allyParty = global.grd_party_enemy;
SV_r.enemyParty = global.grd_party_player;
scr_cEvent(SV_r,EVENT_BATTLM_INIT);
SV_r.enemyWait = UNIVERSAL_COOLDOWN;
SV_r.enemyWaitMax = SV_r.enemyWait;

global.grd_party_enemy[# SV_slot,0] = SV_r;

return SV_r;