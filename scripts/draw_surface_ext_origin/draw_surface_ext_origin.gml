///draw_surface_ext_origin
///@param surf
///@param x
///@param y
///@param xscale
///@param yscale
///@param rot
///@param col
///@param alpha
///@param originx
///@param originy
var _surf = argument0,
		_x = argument1,
		_y = argument2,
		_xscale = argument3,
		_yscale = argument4,
		_rot = argument5,
		_col = argument6,
		_alpha = argument7,
		_origin_x = argument8*_xscale,
		_origin_y = argument9*_yscale;


matrix_set(matrix_world, matrix_build(_x,_y,0,0,0,_rot,1,1,1));
					 
draw_surface_ext(_surf,-_origin_x,-_origin_y,_xscale,_yscale,0,_col,_alpha);
matrix_set(matrix_world,matrix_build_identity());