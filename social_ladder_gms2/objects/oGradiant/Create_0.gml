if !layer_exists("Gradiant")
{
	layer_create(depth_layer.gradiant,"Gradiant");
}
layer_depth(layer_get_id("Gradiant"), depth_layer.gradiant);
layer = layer_get_id("Gradiant");

