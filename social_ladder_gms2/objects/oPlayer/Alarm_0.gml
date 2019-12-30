/// @description Ground hit play sound
audio_sound_pitch(aHit,choose(0.8,1.0,1.2));
audio_play_sound(aHit,priority.low,0);

repeat(5)
{
	if !layer_exists("Effects")
	{
		layer_create(depth_layer.effects,"Effects");
	}
	with (instance_create_layer(x,bbox_bottom,"Effects",oGround_effect))
	{
		vsp = 0;
	}
}
