/// @description Insert description here
// You can write your code in this editor

if(cdCurr > 0){
	cdCurr += -(100 + src.spd) / (1 + (src.ailment[CHAR_SA_SLW] > 0));
	cdCurr = max(cdCurr,0);
}