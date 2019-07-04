/// @description Insert description here
transCurr = ktk_scr_tween(transCurr,transTgt,4,.15);

for(var _i = 0;_i < 4;_i++){
    grd_ps_xDraw[# _i,0] = ktk_scr_tween(grd_ps_xDraw[# _i,0],grd_ps_xDraw[# _i,1],3,0);
}

ps_portX = ktk_scr_tween(ps_portX,ps_tgtPortX,3,-1);
ps_portY = ktk_scr_tween(ps_portY,ps_tgtPortY,3,-1);