global.view_width	= camera_get_view_width(view_camera[0]);
global.view_height	= camera_get_view_height(view_camera[0]);

display_set_gui_size(global.view_width, global.view_height);

var gwidth = global.view_width, gheight = global.view_height;


var ds_ = menu_pages[page], ds_height = ds_grid_height(ds_); // I actualy just need the current grid that y draw
var y_buffer = 32, x_buffer = 16; //how far away the element are from each other or from the divide line
var start_y = (gheight/2) - ((((ds_height-1)/2)*y_buffer)), start_x = gwidth/2; // where I start to draw the text, so it is half the amout of space that I need from the center
var ltx = start_x - x_buffer, lty, c, xo; //left text exposition ltx

//Draw Background

//draw_sprite_ext(sBackround,0,0,0,global.view_width/sprite_get_width(sBackgroundMenu),global.view_height/sprite_get_height(sBackgroundMenu),0,c_white,1);

//Draw Pause Menu "Back"
var c = c_gray;
draw_rectangle_color(0,0,gwidth, gheight, c,c,c,c, false);

#region Draw elements on Left Side
draw_set_font(fMenu);
draw_set_valign(fa_middle);
draw_set_halign(fa_right);

var yy = 0; repeat(ds_height)
{
	lty = start_y + (yy*y_buffer);
	c = c_white;
	xo = 0;
	
	if(yy == menu_option[page]) 
	{
		c = make_color_rgb(158,11,15);	
		xo = -x_buffer/2;
	}
	draw_text_color(ltx + xo, lty, ds_[# 0, yy], c,c,c,c, 1);
	yy++;
}
#endregion
#region draw other element
if page != menu_page.start && page != menu_page.slots
{
	draw_sprite(sMenu_button,0,gwidth,gheight);

	//Draw Dividing Line
	c = c_white;
	draw_rectangle_color(start_x, start_y - y_buffer, start_x + 2, lty + y_buffer,c,c,c,c,false);
}

if page == menu_page.slots
{
	draw_sprite(sMenu_button_erase,0,gwidth,gheight);
}

// draw image on the control page
if page == menu_page.controls
{
	draw_sprite(sGamepad,-1,gwidth - sprite_get_width(sGamepad) - 64,gheight - sprite_get_height(sGamepad) - 64);
}

//draw the presse start things
if page == menu_page.start
{
	draw_sprite(sMenu_start,-1,gwidth/2,gheight/2);
}

if toggle == true
{
	draw_sprite(sErase,0,gwidth/2,gheight/2);
}
#endregion
#region Draw Options on Right Side
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
			c = c_white;
			
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
			if(inputting and yy == menu_option[page]){ c = c_aqua; }
			
			if(current_val == 0){ c1 = c; c2 = c_dkgray; }
			else				{ c1 = c_dkgray; c2 = c; }
			
			draw_text_color(rtx, rty, "ON", c1,c1,c1,c1, 1);
			draw_text_color(rtx + 64, rty, "OFF", c2,c2,c2,c2, 1);

		break;
		
		case menu_element.slots:
			
			c = c_white;
			var len = 64;
			if yy == menu_option[page] 
			{
				variable_global_set(ds_[# 3, menu_option[page]], ds_[# 4, menu_option[page]]);
				ds_map_clear(global.save);
				load_map();
				if global.date != 0 draw_text_color(rtx, rty, "last time played " + string(global.date), c,c,c,c, 1);
				switch (global.slot)
				{
					case 1: 
						var slot = "save1.json";
					break;
					case 2: 
						var slot = "save2.json";
					break;
					case 3: 
						var slot = "save3.json";
					break;
				}
						
				if input.erase && file_exists(slot)
				{
					if toggle == true
					{
						file_delete(slot);
						alarm[0] = 2
					}
					toggle = true;
				}
			}
			
		break;
	}
	
	yy++;
}
#endregion
