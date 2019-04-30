switch (state)
{
	#region idle
		case "idle":
			set_state_sprite(idle,0.2,0);
			state_idle();
		break;
	#endregion
	#region Chase
		case "chase":
			set_state_sprite(walk,walk_animation_speed,0);
			state_chase();
		break;
	#endregion
	#region Attack
		case "attack":
			set_state_sprite(attack,0.6,0);
			
			if animation_hit_frame(attack1_frame)
			{
				//audio_play_sound(aMiss,3,0);
				create_hitbox(x, y, self, attack1_mask, 3, 3, 5, -image_xscale);
			}
			
			if animation_end()
			{
				state = "chase";
			}	
		break;
	#endregion	
	#region shot
		case "shot":
			set_state_sprite(shot,0.7,0);
			
			if animation_hit_frame(shot_frame)
			{
				//audio_play_sound(aMiss,3,0);
				with instance_create_layer(x + (sign(image_xscale)* -9),y - 36,"Effects", oProjectile)
				{
					creator = other;
				}
			}
			
			if animation_end()
			{
				state = "chase";
			}	
		break;
	#endregion	
	#region Knockback
		case "knockback":
			knockback_state(knockback_sprite, "stunt");
			alarm[1] = stunt_time;
		break;

	#endregion
	#region Stunt
		case "stunt":
			set_state_sprite(knockback_sprite,0,1);
		break;
	#endregion
	#region Death
		case "death":
			death_state(die);
		break;
	#endregion
	#region Dead
		case "dead":
			dead_state(die);
		break;
	#endregion
}

//endle gravity 
event_inherited();