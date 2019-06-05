transTgt = 1;

ds_stack_clear(global.stk_menu);

switch(menuNext){
	case 0: //requestMission
		scr_menu_nextMenu_mission();
		
		break;
	case 2: //market
		scr_menu_nextMenu_market();
		
		break;
	default:
		scr_menu_nextMenu_home();
		
		break;
	
}