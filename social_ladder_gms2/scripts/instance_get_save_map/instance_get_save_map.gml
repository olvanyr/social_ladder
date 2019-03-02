///@desc returns a map representing an instance

/// @arg instance

var instance = argument0;

var object = instance.object_index; // in case I want save multiple type of object, this two line of code make me "choose" between diferent "list" of array that I have defined into the save_meta script
var _layer = instance.layer;

var var_array = global.save_map_[?object];

var map = ds_map_create();

map[?"object_index"] = object; //just store the type of the object first
map[?"layer"] = _layer;

for( var i = 0; i < array_length_1d(var_array); i++)
{
	var name = var_array[i]; //get the name of the value we whant (like "x",...) this variale will be the actuel Key in the ds map and also used inside the variable_instance_get fonction to actualy get the current value of the var who have this name
	var value = variable_instance_get(instance, name);
	map[?name] = value; // inside the ds_map map, we sais that for the key "name" we whant to store the "value"
	// this three lines of code are sooooo clever 
}

return map;