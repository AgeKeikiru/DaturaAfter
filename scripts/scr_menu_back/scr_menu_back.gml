///@arg *refreshNextWindow
///@arg *playsfx

io_clear();

var SV_ui = instance_find(obj_handler_menuUI,0);

if(ds_stack_size(global.stk_menu) > 1 || (instance_exists(SV_ui) && SV_ui.ps_baseMenuIndex >= 0)){	
	if(argument_count <= 1 || argument[1]){
		scr_playSfx(sfx_back);
	}
	
	instance_destroy(ds_stack_pop(global.stk_menu));
	global.playerControl = false;
	
	if(instance_exists(SV_ui) && SV_ui.ps_baseMenuIndex == ds_stack_size(global.stk_menu)){
		with SV_ui{
			if(SV_ui.ps_baseMenuIndex == ds_stack_size(global.stk_menu)){
				timeline_index = tl_menuUI_ps_close;
				timeline_position = 0;
				timeline_loop = false;
				timeline_running = true;
			}
		}
	}else{
		if(SV_ui.ps_baseMenuIndex + 1 == ds_stack_size(global.stk_menu)){
			with(SV_ui){
				instance_destroy(ps_portEquip);
				instance_destroy(ps_portStatus);
				
				for(var SV_i = 0;SV_i < ds_list_size(lst_ps_slots);SV_i++){
				    lst_ps_slots[| SV_i].tgt_alpha = 1;
				}
				
				txt_desc = "";
				txt_descLabel = "";
				txt_title = "PARTY";
				txt_titleDesc = "Adjust party settings";
				txt_ctrl[2] = "";
			}
		}
		
		if(ds_stack_size(global.stk_menu) > 0){
			with ds_stack_top(global.stk_menu){
				alarm[0] = 1;
				
				if(argument_count == 0 || argument[0]){
					alarm[0] = 10;
					btn_draw = false;
					visible = true;
					
					with link_panel{
						image_xscale = 0;
						image_yscale = 0;
					}
				}
			}
		}
	}
}else if(room == rm_home){
	with SV_ui{
		if(txt_title != "HOME"){
			if(argument_count <= 1 || argument[1]){
				scr_playSfx(sfx_back);
			}
			
			scr_menu_nextMenu();
		}
	}
}

var SV_m = ds_stack_top(global.stk_menu);

if(scr_exists(SV_m,asset_object) && !SV_m.submenu){
	with SV_ui{
		instance_destroy(soc_formation);
	}
}