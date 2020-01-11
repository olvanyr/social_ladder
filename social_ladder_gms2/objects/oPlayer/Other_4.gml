
if room != rLab{
	global.save[? "room"] = room;
	save_map();
}

#region Depedencies
	if !instance_exists(oInput)
	{
		input = instance_create_layer(0,0,"Instances",oInput)
	}else input = oInput;
	if !instance_exists(oCamera)
	{
		with instance_create_layer(x,y,"Instances", oCamera)
		{
			follow = other;
		}
	}
	if !instance_exists(oHUD)
	{
		instance_create_layer(x,y,"Instances", oHUD)
	}
	if !instance_exists(oMap)
	{
		instance_create_layer(x,y,"Instances", oMap)
	}
	
	if !instance_exists(oZoom)
	{
		instance_create_layer(x,y,"Instances", oZoom)
	}
	if !instance_exists(oWarp)
	{
		instance_create_layer(x,y,"Instances", oWarp)
	}
	
	//check if the layer are at the corecte position and if not move theme
	set_layer_depth("Front",depth_layer.front);
	set_layer_depth("Back",depth_layer.back);
	set_layer_depth("Paralax_back",depth_layer.paralax_back);
	set_layer_depth("Paralax_front",depth_layer.paralax_front);
	set_layer_depth("Background",depth_layer.background);
	set_layer_depth("Assets",depth_layer.grass_back);


#endregion