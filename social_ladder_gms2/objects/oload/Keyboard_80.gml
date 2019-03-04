/// @description load data

var file = file_text_open_read("save.json");
var json = "";

while(!file_text_eof(file))
{
	json += file_text_readln(file);
}

file_text_close(file);

load_instances(json);