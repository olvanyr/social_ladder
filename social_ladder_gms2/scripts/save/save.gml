///@desc save the global.enemies into a file
var json = save_instances();
var file_name = file_text_open_write("save.json");

file_text_write_string(file_name, json);
file_text_close(file_name);