if keyboard_check_pressed(ord("W"))
{
	showing = !showing;
}

if showing
{
	display_set_gui_size(global.ideal_width,global.ideal_height);
	draw_rectangle_color(0,0,rec_height,rect_width,c,c,c,c,false);

	for (var i = 0; i < 3; i++)
	{
		var space = (marge * i) + (in_rect_height * i)
		draw_rectangle_color(marge,marge + space, marge + in_rect_width,marge + space + in_rect_height,in_c,in_c,in_c,in_c,false);
	
		if mouse_detection_gui(marge,marge + space, marge + in_rect_width,marge + space + in_rect_height)
		{
			//show_debug_message("zone : " + string(i));
		
			if mouse_check_button(mb_left)
			{
				inputing = "zone : " + string(i)
			}
		}
	
	

	}

	switch (inputing)
	{
	case "zone : 0": 

		//show_debug_message(inputing);
		if keyboard_check_pressed(vk_anykey)
		{
			if keyboard_check_pressed(vk_backspace)
			{
				var length = string_length(x_coord);
				x_coord = string_copy(x_coord,1,length - 1)
			}else
			{
				if keyboard_check_pressed(vk_lshift) || keyboard_check_pressed(vk_rshift) ||  keyboard_check_pressed(vk_enter)
				{}else
				{
					x_coord += keyboard_lastchar;
				}
			}
		}
	break;
	case "zone : 1": 

		//show_debug_message(inputing);
		if keyboard_check_pressed(vk_anykey)
		{
			if keyboard_check_pressed(vk_backspace)
			{
				var length = string_length(y_coord);
				y_coord = string_copy(y_coord,1,length - 1)
			}else
			{
				if keyboard_check_pressed(vk_lshift) || keyboard_check_pressed(vk_rshift) ||  keyboard_check_pressed(vk_enter)
				{}else
				{
					y_coord += keyboard_lastchar;
				}
			}
		}

	break;
	case "zone : 2": 

		//show_debug_message(inputing);
		if keyboard_check_pressed(vk_anykey)
		{
			if keyboard_check_pressed(vk_backspace)
			{
				var length = string_length(room_to_go);
				room_to_go = string_copy(room_to_go,1,length - 1)
			}else
			{
				if keyboard_check_pressed(vk_lshift) || keyboard_check_pressed(vk_rshift) ||  keyboard_check_pressed(vk_enter)
				{}else
				{
					room_to_go += keyboard_lastchar;
				}
			}
		}

	break;
	}

	draw_text_ext_color(marge + 10,marge + 10 + (marge * 0) + (in_rect_height * 0),"x : " + string(x_coord),5,in_rect_width,c_blue,c_blue,c_blue,c_blue,1);
	draw_text_ext_color(marge + 10,marge + 10 + (marge * 1) + (in_rect_height * 1),"y : " + string(y_coord),5,in_rect_width,c_blue,c_blue,c_blue,c_blue,1);
	draw_text_ext_color(marge + 10,marge + 10 + (marge * 2) + (in_rect_height * 2),"next_room : " + string(room_to_go),5,in_rect_width,c_blue,c_blue,c_blue,c_blue,1);


	if keyboard_check_pressed(vk_enter) && x_coord != "" && y_coord != "" && room_to_go != ""
	{

			var room_index = asset_get_index(room_to_go)
			if room_exists(room_index)
			{
				oPlayer.state = "wait";
				with instance_create_layer(0,0,"Effects", oTransition)
				{
					next_room = asset_get_index(other.room_to_go);
					x_next = other.x_coord;
					y_next = other.y_coord;
					global.new_music = sBack_to_styria_1;
				}
			}
	}
}

/*
	switch (inputing)
	{
	case "zone : 0": 

		show_debug_message(inputing);
		if inputing != last_inputing
		{
			keyboard_string = "";
			last_inputing = inputing;
		}
		x_coord = keyboard_string;
		
		
	break;
	case "zone : 1": 

		show_debug_message(inputing);
		if inputing != last_inputing
		{
			keyboard_string = "";
			last_inputing = inputing;
		}
		y_coord = keyboard_string;

	break;
	case "zone : 2": 

		show_debug_message(inputing);
		if inputing != last_inputing
		{
			keyboard_string = "";
			last_inputing = inputing;
		}
		room_to_go = keyboard_string;

	break;
	}
