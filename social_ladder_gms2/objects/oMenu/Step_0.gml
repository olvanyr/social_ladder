
if !instance_exists(oInput)
{
	input = instance_create_layer(0,0,"Instances",oInput)
}else input = oInput;

//make a simple way to go back
if(input.back) && toggle = false
{
	//audio 
	
	
	if(!inputting) && page != menu_page.main && page != menu_page.start
	{
		audio_play_sound(inputting_sound,5,false);
		if(page = menu_page.settings) || page = menu_page.slots
		{
			page = menu_page.main;
		}else page = menu_page.settings;
	}
}

if input.back toggle = false;



//Set every menu fonctionality depending of the page
var ds_ = menu_pages[page], ds_height = ds_grid_height(ds_);
	

if(inputting){
		
	switch(ds_[# 1, menu_option[page]]){
		case menu_element.shift:
			var hinput = input.menu_right - input.menu_left;
			if(hinput != 0){
				//audio
				
				ds_[# 3, menu_option[page]] += hinput;
				ds_[# 3, menu_option[page]] = clamp(ds_[# 3, menu_option[page]], 0, array_length_1d(ds_[# 4, menu_option[page]])-1);
			}
		break;
		
		case menu_element.slider:
			var hinput = input.menu_right - input.menu_left;
			if(hinput != 0){

				ds_[# 4, menu_option[page]] += hinput * 0.05;
				ds_[# 4, menu_option[page]] = clamp(ds_[# 4, menu_option[page]], 0, 1);
				variable_global_set(ds_[# 3, menu_option[page]], ds_[# 4, menu_option[page]]);
				change_volume(); //dynamicaly change the solume
				
				
			}
			
		break;
		
		case menu_element.toggle:
		var hinput = input.menu_right - input.menu_left;
			if(hinput != 0){
				//audio
				
				ds_[# 3, menu_option[page]] += hinput;
				ds_[# 3, menu_option[page]] = clamp(ds_[# 3, menu_option[page]], 0, 1);
			}
		break;
		
		case menu_element.slots:
			
			variable_global_set(ds_[# 3, menu_option[page]], ds_[# 4, menu_option[page]]);
			script_execute(ds_[# 2, menu_option[page]]);
			//audio
				
		break;
	}
	
} else 
{
	if toggle == false
	{
		var ochange = input.menu_down - input.menu_up;
		if(ochange != 0)
		{
			menu_option[page] += ochange;
			if(menu_option[page] > ds_height-1) { menu_option[page] = 0; }
			if(menu_option[page] < 0) { menu_option[page] = ds_height-1; }
		//audio
		audio_play_sound(down_up_sound,5,false);
		}
	}
}

if(input.enter){
	switch(ds_[# 1, menu_option[page]]){
		case menu_element.script_runner: script_execute(ds_[# 2, menu_option[page]]); break;
		case menu_element.page_transfer: page = ds_[# 2, menu_option[page]]; break;
		case menu_element.shift: 
		case menu_element.slider:
		case menu_element.toggle: if(inputting){ script_execute(ds_[# 2, menu_option[page]], ds_[# 3, menu_option[page]]); }
		case menu_element.input:
		case menu_element.slots:
			inputting = !inputting;
			alarm[1] = 1; // use to save the settings after they are edited
			break;
	}
	//audio
	audio_play_sound(inputting_sound,5,false);
	
}



#region save setting

if(save_setting)
{
	save_settings();
	save_setting = false;

}
#endregion
