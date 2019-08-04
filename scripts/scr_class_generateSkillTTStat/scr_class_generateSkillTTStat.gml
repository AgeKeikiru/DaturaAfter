///@arg stat1
///@arg stat2
///@arg percentage
///@arg firstLevel
///@arg *formatWidth
///@arg *suffix

var
SV_num = [argument[0],argument[1]],
SV_numStr = ["",""],
SV_cent = argument[2],
SV_first = argument[3],
SV_w = 0,
SV_suff = "";

if(argument_count > 4){
    SV_w = argument[4];
}

if(argument_count > 5){
    SV_suff = argument[5];
}

for(var SV_i = 0;SV_i < 2;SV_i++){
	SV_numStr[SV_i] = (SV_num[SV_i] > 0 ? "+" : "") + string_format(SV_num[SV_i] * (SV_cent ? 100 : 1),1,2);
}

if(!SV_first){
    SV_numStr[0] += (SV_cent ? "%" : SV_suff);
}else{
    SV_numStr[0] = "---";
}

return scr_stringGapFormat("",SV_numStr[0],SV_w) + "  >>  " + scr_stringGapFormat("",SV_numStr[1],SV_w + -SV_cent);