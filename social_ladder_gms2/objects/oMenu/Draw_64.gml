global.view_width	= camera_get_view_width(view_camera[0]);
global.view_height	= camera_get_view_height(view_camera[0]);

display_set_gui_size(global.view_width, global.view_height);

var gwidth = global.view_width, gheight = global.view_height;

//Draw Background

//draw_sprite_ext(sBackround,0,0,0,global.view_width/sprite_get_width(sBackgroundMenu),global.view_height/sprite_get_height(sBackgroundMenu),0,c_white,1);


//Draw Pause Menu "Back"
var c = c_black;
draw_rectangle_color(0,0,gwidth, gheight, c,c,c,c, false);


//Draw elements on Left Side
draw_set_font(fMenu);
draw_set_valign(fa_middle);
draw_set_halign(fa_right);

var ds_ = menu_pages[page], ds_height = ds_grid_height(ds_);
var y_buffer = 32, x_buffer = 16; 
var start_y = (gheight/2) - ((((ds_height-1)/2)*y_buffer)), start_x = gwidth/2;
var ltx = start_x - x_buffer, lty, c, xo;
var yy = 0; repeat(ds_height){
	lty = start_y + (yy*y_buffer);
	c = c_white;
	xo = 0;
	
	if(yy == menu_option[page]) {
		c = c_orange;	
		xo = -x_buffer/2;
	}
	draw_text_color(ltx + xo, lty, ds_[# 0, yy], c,c,c,c, 1);
	yy++;
}

//Draw Dividing Line
draw_rectangle_color(start_x, start_y - y_buffer, start_x + 2, lty + y_buffer,c_white,c_white,c_white,c_white,false);

//Draw Options on Right Side
draw_set_halign(fa_left);
var rtx = start_x + x_buffer, rty;

yy = 0; repeat(ds_height){
	rty = start_y + (yy*y_buffer);
	
	switch(ds_[# 1, yy]){
		case menu_element.shift:
			var current_val = ds_[# 3, yy];
			var current_val_words = ds_[# 4, yy];
			var left_shift = "<< ";
			var right_shift = " >>";
			var c = c_white;
			
			if(current_val == 0) left_shift = "";
			if(current_val == array_length_1d(ds_[# 4, yy])-1) right_shift = "";
			
			if(inputting and yy == menu_option[page]){ c = c_yellow; }
			draw_text_color(rtx, rty, left_shift + current_val_words[current_val] + right_shift, c,c,c,c, 1); 

		break;
		
		case menu_element.slider:
			c = c_white;
			var len = 64;
			var current_val =(ds_[# 4, yy]);
			draw_line_width(rtx, rty, rtx + len, rty, 2);
			
			if(inputting and yy == menu_option[page]){ c = c_yellow; }
			draw_circle_color(rtx + (current_val * len), rty, 4, c,c, false);
			draw_text_color(rtx + (len*1.2), rty, string( floor(current_val*100) )+"%", c,c,c,c, 1);
			

		break;
		
		case menu_element.toggle:
			c = c_white;
			var current_val = ds_[# 3, yy];
			var c1, c2;
			if(inputting and yy == menu_option[page]){ c = c_yellow; }
			
			if(current_val == 0){ c1 = c; c2 = c_dkgray; }
			else				{ c1 = c_dkgray; c2 = c; }
			
			draw_text_color(rtx, rty, "ON", c1,c1,c1,c1, 1);
			draw_text_color(rtx + 64, rty, "OFF", c2,c2,c2,c2, 1);

		break;
		
		case menu_element.input:
			var current_val = ds_[# 3, yy];
			switch(current_val){
				case vk_up:		current_val = "UP KEY"; break;
				case vk_left:	current_val = "LEFT KEY"; break;
				case vk_right:	current_val = "RIGHT KEY"; break;
				case vk_down:	current_val = "DOWN KEY"; break;
				case vk_space:	current_val = "SPACE"; break;
				case vk_escape:	current_val = "ESCAPE"; break;
				case vk_enter:	current_val = "ENTER"; break;
				default:		current_val = chr(current_val); 
			}
			c = c_white;
			if(inputting and yy == menu_option[page]){ c = c_yellow; }
			draw_text_color(rtx, rty, current_val, c,c,c,c, 1);
			//draw_sprite(sGamepad,-1,global.view_width - sprite_get_width(sGamepad) - 64,global.view_height - sprite_get_height(sGamepad) - 64);

		break;
	}
	
	yy++;
}
