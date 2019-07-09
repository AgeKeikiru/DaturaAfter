with obj_handler_dungeon{
    scr_trace("test" + string(state_boss));
}

instance_destroy(obj_handler_dialogue);
global.playerControl = false;
state_event = true;