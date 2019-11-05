///@description draw_sprite_skew_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha, image_xskew, image_yskew);

var sprite = argument0;
var index = argument1;
var xx = argument2;
var yy = argument3;
var xscale = argument4;
var yscale = argument5;
var cos_angle = cos(degtorad(argument6));
var sin_angle = sin(degtorad(argument6));
var tint = argument7;
var alpha = argument8;
var hskew = argument9;
var vskew = argument10;
// Calculate dommon operation

var spr_tex = sprite_get_texture(sprite, index);
var spr_width = sprite_get_width(sprite);
var spr_height = sprite_get_height(sprite);
var spr_xorig = sprite_get_xoffset(sprite);
var spr_yorig = sprite_get_yoffset(sprite);

var tempx, tempy, temp_dir, temp_dist;

// Begin drawxing primitive
draw_primitive_begin_texture(pr_trianglestrip, spr_tex); 

// Top left corner
tempx = (-spr_xorig + (spr_yorig / spr_height) * hskew) * xscale;
tempy = (-spr_yorig + (spr_xorig / spr_width) * -vskew) * yscale;

draw_vertex_texture_color(xx + tempx * cos_angle - tempy * sin_angle, yy + tempx * sin_angle + tempy * cos_angle,0,0, tint, alpha);

//top right corner
tempx = (spr_width + (spr_yorig / spr_height) * hskew - spr_xorig) * xscale;
tempy = (-spr_yorig + (1 - spr_xorig / spr_width) * vskew) * yscale;

draw_vertex_texture_color(xx + tempx * cos_angle - tempy * sin_angle, yy + tempx * sin_angle + tempy * cos_angle,1,0, tint, alpha);

// bottom left corner
tempx = (-spr_xorig + (1 - spr_yorig / spr_height) * -hskew) * xscale;
tempy = (spr_height - spr_yorig + (spr_xorig / spr_width) * -vskew) * yscale;

draw_vertex_texture_color(xx + tempx * cos_angle - tempy * sin_angle, yy + tempx * sin_angle + tempy * cos_angle,0,1, tint, alpha);

// bottom right corner
tempx = (spr_width - spr_xorig + (1 - spr_yorig / spr_height) * -hskew) * xscale;
tempy = (spr_height - spr_yorig + (1 - spr_xorig / spr_width) * vskew) * yscale;

draw_vertex_texture_color(xx + tempx * cos_angle - tempy * sin_angle, yy + tempx * sin_angle + tempy * cos_angle,1,1, tint, alpha);

// Finish drawing primitive
draw_primitive_end();