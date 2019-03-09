text_w = string_width(text)/2;

/// @desc Prgoress text
var cam = view_camera[0];
var view_w = camera_get_view_width(cam);
var view_h = camera_get_view_height(cam);
display_set_gui_size(view_w * 2,view_h * 2);

/// @desc
var halfw = w *0.5;

//draw the box
draw_set_alpha(1);
nine_slice_box(sBox1,xpos-halfw-border + text_w, ypos-h-(border*2), xpos+halfw+border + text_w, ypos);

draw_set_alpha(1);

//draw text

draw_set_text(c_black,fText,fa_center,fa_top);

draw_text(xpos + text_w,ypos-h-border,text_current);


