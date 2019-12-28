/// @description set_layer_depth(layer,depth);
/// @arg layer
/// @arg depth

var _depth = argument1;
var lay = layer_get_id(argument0);
if layer_exists(lay)
{
	if layer_get_depth(lay) != _depth
	{
		layer_depth(lay, _depth);
	}
}