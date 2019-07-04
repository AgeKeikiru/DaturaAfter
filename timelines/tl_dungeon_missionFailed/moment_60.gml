
globalvar G_tmp;
G_tmp = 6;

with map_results[? MCS_BG]{
    tweenSpd = G_tmp;
    tgt_yPos = 0;
    tgt_yScale = room_height;
}

with map_results[? MCS_TITLE]{
    //tweenSpd = G_tmp;
    tgt_xPos += -400;
    tgt_alpha = 0;
}