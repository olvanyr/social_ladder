/// @description Ground hit play sound
audio_play_sound(aHit,2,0);

repeat(5)
{
	with (instance_create_layer(x,bbox_bottom,"Effects",oGround_effect))
	{
		vsp = 0;
	}
}
