event_inherited();

enBase *= 20;
cdBase = room_speed * (DEBUG ? 5 : 30);
cdAdd = cdBase;
cdMax = cdBase;
cdCurr = cdBase;
cdRate = 0;

sa_inflict[| CHAR_SA_PAR] = 2;
sa_chance[| CHAR_SA_PAR] = 0.5;