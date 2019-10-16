
visible = false;
persistent = true;

ds_list_add(global.lst_listeners,id);

global.tempInt = id;

with object_index{
    if(id != global.tempInt){
        instance_destroy();
    }
}