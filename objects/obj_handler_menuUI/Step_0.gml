/// @description Insert description here
if(global.autoScrollDelay > 0){
	global.autoScrollDelay--;
}

if(
	!title
	&& instance_number(obj_handler_dungeon) == 0
	&& !scr_exists(link_load,asset_object)
	&& instance_number(obj_handler_dialogue) == 0)
{
	var _m = ds_stack_top(global.stk_menu);
	
	if(ds_stack_size(global.stk_menuDia) > 0){
		global.playerControl = false;
		
		with obj_handler_menu_parent{
			visible = false;
		}
		
		script_execute(ds_stack_pop(global.stk_menuDia));
		instance_create_depth(0,0,0,obj_handler_dialogue);
	}else if(ds_stack_size(global.stk_menuAlert) > 0 && scr_exists(_m,asset_object) && !_m.submenu){
		global.playerControl = false;
		
		script_execute(ds_stack_pop(global.stk_menuAlert));
	}
}

transCurr = ktk_scr_tween(transCurr,transTgt,4,.15);

for(var _i = 0;_i < 4;_i++){
    grd_ps_xDraw[# _i,0] = ktk_scr_tween(grd_ps_xDraw[# _i,0],grd_ps_xDraw[# _i,1],3,0);
}

ps_portX = ktk_scr_tween(ps_portX,ps_tgtPortX,3,-1);
ps_portY = ktk_scr_tween(ps_portY,ps_tgtPortY,3,-1);