/// @desc is argumentà an enemy ?
/// @arg the object to check

var object = argument0;


var array = global.enemy_list;
var length = array_length_1d(array);
for (var i = 0; i < length; i++)
{
	if object == array[i]
	{
		return true;
	}
}