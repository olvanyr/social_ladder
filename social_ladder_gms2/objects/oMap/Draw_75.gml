
if !pause exit;

var gwidth = global.view_width, gheight = global.view_height;

switch tab
{
	#region Map
	case pause_tab.map:
			
			
			
			draw_rectangle_color(-100,-100,gwidth + 100, gheight + 100,c_background,c_background,c_background,c_background,false);

			
			h_move += (input.right_cam - input.left_cam) * move_speed;
			v_move += (input.down_cam - input.up_cam) * move_speed;
			
			if v_move < 0 v_move = 0;
			if h_move < 0 h_move = 0;
			//draw map page
			for ( var i = 0; i < room_last + 1; i++)
			{
				var room_id = room_get_name(i);
				if ds_map_exists(global.save,room_id)
				{
					if global.save[? room_id] == 0
					{
						var sprite = string("sMap_") + string(room_id);
					}else
					{
						var sprite = string("sMap_red_") + string(room_id);
					}
					
					sprite = asset_get_index(sprite);
					
					var color = c_white;
					if room_id == room_get_name(room) color = c_gray;
					
					if sprite_exists(sprite)
					{
						draw_sprite_ext(sprite,0,0 + h_move,0 + v_move,1,1,0,color,1);
						//show_debug_message(string(sprite));
					}
				}
			}
		
	break;
	#endregion

	#region Settings
	case pause_tab.settings:
		
		//draw setting page
		global.view_width	= camera_get_view_width(view_camera[0]) * 4;
		global.view_height	= camera_get_view_height(view_camera[0]) * 4;

		display_set_gui_size(global.view_width, global.view_height);

		var ds_ = menu_pages[page], ds_height = ds_grid_height(ds_); // I actualy just need the current grid that y draw
		var y_buffer = 50, x_buffer = 16; //how far away the element are from each other or from the divide line
		var start_y = (gheight/2) - ((((ds_height-1)/2)*y_buffer)), start_x = gwidth/2; // where I start to draw the text, so it is half the amout of space that I need from the center
		var ltx = start_x - x_buffer, lty, c, xo; //left text exposition ltx

		//Draw Pause Menu "Back"
		draw_rectangle_color(-10,-10,gwidth, gheight, c_background,c_background,c_background,c_background, false);

		#region Draw elements on Left Side
		draw_set_font(fMenu);
		draw_set_valign(fa_middle);
		draw_set_halign(fa_right);

		var yy = 0; repeat(ds_height)
		{
			lty = start_y + (yy*y_buffer);
			c = c_black;
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

		draw_sprite_ext(sMenu_button,0,gwidth,gheight,2,2,0,c_white,1);

		//Draw Dividing Line
		c = c_black;
		draw_rectangle_color(start_x, start_y - y_buffer, start_x + 2, lty + y_buffer,c,c,c,c,false);


		// draw image on the control page
		if page == menu_pause_page.controls
		{
			draw_sprite_ext(sGamepad,-1,gwidth/2,gheight/2,2,2,0,c_white,1);
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
					c = c_black;
			
					if(current_val == 0) left_shift = "";
					if(current_val == array_length_1d(ds_[# 4, yy])-1) right_shift = "";
			
					if(inputting and yy == menu_option[page]){ c = c_yellow; }
					draw_text_color(rtx, rty, left_shift + current_val_words[current_val] + right_shift, c,c,c,c, 1); 

				break;
		
				case menu_element.slider:
					c = c_black;
					var len = 64;
					var current_val =(ds_[# 4, yy]);
					draw_line_width(rtx, rty, rtx + len, rty, 2);
			
					if(inputting and yy == menu_option[page]){ c = c_yellow; }
					draw_circle_color(rtx + (current_val * len), rty, 4, c,c, false);
					draw_text_color(rtx + (len*1.2), rty, string( floor(current_val*100) )+"%", c,c,c,c, 1);
			

				break;
		
				case menu_element.toggle:
					c = c_black;
					var current_val = ds_[# 3, yy];
					var c1, c2;
					if(inputting and yy == menu_option[page]){ c = c_aqua; }
			
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
				break;
			}
	
			yy++;
		}
		#endregion
	break;
#endregion

}
