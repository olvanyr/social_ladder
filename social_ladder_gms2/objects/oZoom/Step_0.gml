purcent += 0.01;
purcent = min(purcent,1);

if instance_exists(oCamera)
{	
	oCamera.view_w = lerp(camera_view_w,view_w,purcent);
	oCamera.view_h = lerp(camera_view_h,view_h,purcent);
}