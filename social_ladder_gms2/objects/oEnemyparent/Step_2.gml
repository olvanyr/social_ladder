/// @desc

// Inherit the parent event
event_inherited();

if once = true && state == "death"
{
	
	set_enemies_array();
	
	// save 
	var json = save_instances();
	var file_name = file_text_open_write("save.json");

	file_text_write_string(file_name, json);
	file_text_close(file_name);
}