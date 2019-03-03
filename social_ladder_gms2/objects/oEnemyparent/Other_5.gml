ident = id;

//set ennemy state
var array;

array[save.state] = state;
array[save.x] = x;
array[save.y] = y;
//array[save.room] = room_id;

global.enemies[?ident] = array;


// save 

var json = save_instances();
var file_name = file_text_open_write("save.json");

file_text_write_string(file_name, json);
file_text_close(file_name);