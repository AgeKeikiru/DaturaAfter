///@arg item
///@arg assetType

if(argument0 != undefined){
    switch argument1{
        case asset_object:
            return instance_exists(argument0);
        
        case asset_sprite:
            return sprite_exists(argument0);
            
        case asset_timeline:
            return timeline_exists(argument0);
            
        case asset_script:
            return script_exists(argument0);
    }
}

return false;