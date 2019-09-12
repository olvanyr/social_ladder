text_w = string_width(text)/2;

/// @desc Prgoress text
var cam = view_camera[0];
var view_w = camera_get_view_width(cam);
var view_h = camera_get_view_height(cam);
display_set_gui_size(view_w * 2,view_h * 2);

//draw the box
draw_set_alpha(1);
nine_slice_box(sBox1,xpos-(sprite_get_width(sprite)/2), ypos-(sprite_get_height(sprite)/2), xpos+(sprite_get_width(sprite)/2), ypos+(sprite_get_height(sprite)/2));

draw_set_alpha(1);

//draw sprite
draw_sprite(sprite,0,xpos,ypos);


