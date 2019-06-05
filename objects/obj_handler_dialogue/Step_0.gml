/// @description Insert description here
// You can write your code in this editor

if(instance_exists(talkbox)){
	repeat(global.set_txtSpeed){
		if(string_length(talkbox.txt[0]) < string_length(txt_tgt)){
			talkbox.txt[0] += string_char_at(txt_tgt,string_length(talkbox.txt[0]) + 1);
		}
	}
}