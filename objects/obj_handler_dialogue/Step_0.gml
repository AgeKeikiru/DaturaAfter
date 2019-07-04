/// @description Insert description here
// You can write your code in this editor

if(instance_exists(talkbox)){
	if(string_length(talkbox.txt[0]) < string_length(txt_tgt)){
		tb_strLen += global.set_txtSpeed / 4;
		talkbox.txt[0] = string_copy(txt_tgt,1,floor(tb_strLen));
	}
}