if(instance_exists(obj_handler_dungeon) || title){
	scr_refreshShopList();
	
	title = false;
	ds_grid_set_region(grd_ps_xDraw,0,0,3,1,1);
	
	instance_destroy(obj_handler_dungeon);
	instance_destroy(obj_handler_mission_parent);
	
	scr_cEvent(EVENT_BATTLM_INIT);
	
	//reset music
	while(ds_list_size(global.lst_bgmStream) > 0){
		audio_destroy_stream(global.lst_bgmStream[| 0]);
		ds_list_delete(global.lst_bgmStream,0);
	}
	
	ds_list_add(global.lst_bgmStream,audio_create_stream("BGM/bgm_home.ogg"));
	ds_list_add(global.lst_bgmStream,audio_create_stream("BGM/bgm_mission.ogg"));
	
	scr_playBgm(global.lst_bgmStream[| 0],0);
	scr_playBgm(global.lst_bgmStream[| 1],1);
	
	global.bgmTrack_curr = 0;
	audio_sound_gain(global.bgmTrack[0],0,0);
	audio_sound_gain(global.bgmTrack[1],0,0);
	audio_sound_gain(global.bgmTrack[global.bgmTrack_curr],global.set_volBgm / 100,2000);
}

visible = true;

if(toTitle){
	toTitle = false;
	title = true;
	instance_destroy(obj_handler_menu_parent);
}

if(txt_title == "MISSION"){
	global.bgmTrack_curr = 0;
}

txt_title = "";
txt_titleDesc = "";
txt_desc = "";
txt_descLabel = "";

switch(menuNext){
	case 0: //request misison
		layer_background_sprite(global.ly_bg[0],bg_mission);
		global.bgmTrack_curr = 1;
		break;
	case 2: //market
		layer_background_sprite(global.ly_bg[0],bg_shop);
		break;
	case 3: //chip lab
		layer_background_sprite(global.ly_bg[0],bg_lab);
		break;
	case 4: //social
		layer_background_sprite(global.ly_bg[0],bg_social);
		break;
	default: //home
		layer_background_sprite(global.ly_bg[0],bg_city);
		break;
}

if(!title){
	audio_sound_gain(global.bgmTrack[global.bgmTrack_curr],global.set_volBgm / 100,500);
}

scr_bgManip_reset();

scr_cEvent_id(link_load,EVENT_FPO_FADEKILL);

for(var SV_i = 0;SV_i < ds_list_size(lst_link_loadExtra);SV_i++){
	var SV_o = lst_link_loadExtra[| SV_i];
	
	scr_cEvent_id(SV_o,EVENT_FPO_FADEKILL);
	
	switch SV_i{
		case 0:
			SV_o.tgt_yScale = 0;
			SV_o.tgt_xPos += -200;
			
			break;
		default:
			SV_o.tgt_xPos += -100;
	}
}

ds_list_clear(lst_link_loadExtra);