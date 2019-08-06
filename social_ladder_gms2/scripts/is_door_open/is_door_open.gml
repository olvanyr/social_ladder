/// @desc is argument an enemy ?
/// @arg the object to check

var ident = argument0;


var array = global.door;
var length = array_length_1d(array);
for (var i = 0; i < length; i++)
{
	if ident == array[i]
	{
		return true;
	}
}