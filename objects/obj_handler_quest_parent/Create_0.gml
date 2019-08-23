
visible = false;
persistent = true;

global.tempInt = id;

with object_index{
    if(id != global.tempInt){
        instance_destroy();
    }
}