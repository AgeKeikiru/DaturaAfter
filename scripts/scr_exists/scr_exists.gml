///@arg item
///@arg *assetType

var _type = argument_count > 1 ? argument[1] : asset_object;

if(argument[0] != undefined){
    switch _type{
        case asset_object:
            return instance_exists(argument[0]);
        
        case asset_sprite:
            return sprite_exists(argument[0]);
            
        case asset_timeline:
            return timeline_exists(argument[0]);
            
        case asset_script:
            return script_exists(argument[0]);
    }
}

return false;