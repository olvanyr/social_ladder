switch (state)
{
	#region idle
		case "idle":
			set_state_sprite(idle,0.2,0);
			chase_idle_triger();
		break;
	#endregion
	#region Chase
		case "chase":
			set_state_sprite(walk,walk_animation_speed,0);
			
			chase_idle_triger();
			chase_state_distance();
			
			if !grounded
			{
				if vsp <= 0 
				{
					set_state_sprite(sScratcher_up,0,0);
				}
				if vsp >= 0 
				{
					set_state_sprite(sScratcher_up,0,1);
				}
			}
		break;
	#endregion
	#region Attack
		case "attack":
			set_state_sprite(attack,0.6,0);
			
			if animation_hit_frame(attack1_frame)
			{
				//audio_play_sound(aMiss,3,0);
				create_hitbox(x, y, self, attack1_mask, 3, 2, 5, image_xscale);
			}
			
			if animation_end()
			{
				state = "wait";
			}	
		break;
	#endregion	
	#region shot
		case "shot":
			set_state_sprite(shot,0.4,0);
			
			if animation_hit_frame(shot_frame)
			{
				//audio_play_sound(aMiss,3,0);
				show_debug_message("creat projectile")
			}
			
			if animation_end()
			{
				state = "wait";
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
	#region Show
		case "show":
			set_state_sprite(transformation, 0.4,0);
			if animation_end()
			{
				state = "chase";
			}
		break;
	#endregion
	#region wait
		case "wait":
		set_state_sprite(sDistance_hiden,0,0);
		if instance_exists(oPlayer)
		{
			if distance_to_object(oPlayer) >= fov
			{
				state = "show";
			}
		}
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