///@desc save the global.enemies into a file

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

var json = save_instances();
var file_name = file_text_open_write(slot);

file_text_write_string(file_name, json);
file_text_close(file_name);