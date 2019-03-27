
switch (state)
{
	#region idle
		case "idle":
			set_state_sprite(idle,0.1,0);
			chase_idle_triger();
		break;
	#endregion
	#region Chase
		case "chase":
			set_state_sprite(walk,walk_animation_speed,0);
			chase_idle_triger();
			chase_state();
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
				state = "stunt";
				alarm[1] = stunt_time;
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
			
			if attack_once == true
			{
				rng = irandom_range(0,2);
				attack_once = false;
			}
			if rng == 1
			{
				set_state_sprite(attack2,0.5,0);
			
				if animation_hit_frame(attack2_frame)
				{
					//audio_play_sound(aMiss,3,0);
					create_hitbox(x, y, self, attack2_mask, 3, 2, 5, image_xscale);
				}
				
			}else
			{
				death_state(die);
			}
			if animation_end()
			{
				state = "dead";
			}
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