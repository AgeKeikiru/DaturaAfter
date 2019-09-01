var
SV_grd_w = 80,
SV_grd_h = 80,
SV_start_x = irandom_range(2,8),
SV_start_y = irandom_range(5,SV_grd_h + -5),
SV_end_x = SV_grd_w + -irandom_range(2,8),
SV_end_y = irandom_range(5,SV_grd_h + -5),
SV_branches = [
    ds_list_create(),
    ds_list_create()
],
SV_str = "";

ds_grid_resize(global.grd_dMap_terrain,SV_grd_w,SV_grd_h);
ds_grid_clear(global.grd_dMap_terrain,-1);

//start/end points
var
SV_start_point = scr_pgm_newChamber(SV_start_x,SV_start_y,4,6),
SV_end_point = scr_pgm_newChamber(SV_end_x,SV_end_y,4,6);

//main path
var
SV_lst = SV_branches[0],
SV_len = 20,
SV_break = false;

ds_list_add(SV_lst,SV_start_point);

do{
    var
    SV_p1 = SV_lst[| ds_list_size(SV_lst) + -1],
    SV_dir = random_range(-90,90),
    SV_x = SV_p1[0] + lengthdir_x(SV_len,SV_dir),
    SV_y = SV_p1[1] + lengthdir_y(SV_len,SV_dir);
    
    while(clamp(SV_y,0,SV_grd_h) != SV_y){
        SV_dir += 10;
        
        if(SV_dir >= 90){
            SV_dir += -170;
        }
        
        SV_x = SV_p1[0] + lengthdir_x(SV_len,SV_dir);
        SV_y = SV_p1[1] + lengthdir_y(SV_len,SV_dir);
    }
    
    var SV_p2 = scr_pgm_newChamber(SV_x,SV_y,4,8,false,irandom_range(2,5));
    
    ds_list_add(SV_lst,SV_p2);
    
    if(SV_p2[0] + SV_len >= SV_end_point[0]){
        SV_break = true;
    }
    
    scr_pgm_newHall(SV_p1,SV_p2);
}until(SV_break);

scr_pgm_newHall(SV_lst[| ds_list_size(SV_lst) + -1],SV_end_point);

ds_list_add(SV_lst,SV_end_point);

//1st deviation
var SV_lst2 = SV_branches[1];

while(ds_list_empty(SV_lst2)){
    for(var SV_i = 0;SV_i + 1 < ds_list_size(SV_lst);SV_i++){
        var
        SV_p1 = SV_lst[| SV_i],
        SV_dir = random(359),
        SV_len = irandom_range(10,30),
        SV_x = SV_p1[0] + lengthdir_x(SV_len,SV_dir),
        SV_y = SV_p1[1] + lengthdir_y(SV_len,SV_dir);
        
        if(clamp(SV_x,0,SV_grd_w) == SV_x && clamp(SV_y,0,SV_grd_h) == SV_y){
            var SV_p2 = scr_pgm_newChamber(SV_x,SV_y,1,8,false,irandom_range(2,5));
            
            scr_pgm_newHall(SV_p1,SV_p2);
            
            ds_list_add(SV_lst2,SV_p2);
        }
    }
}

//trace map result
for(var SV_y = 0;SV_y < SV_grd_h;SV_y++){
    for(var SV_x = 0;SV_x < SV_grd_w;SV_x++){
        SV_str += (global.grd_dMap_terrain[# SV_x,SV_y] == -1) ? " " : "#";
    }
    
    SV_str += "\n";
}

scr_trace(SV_str);