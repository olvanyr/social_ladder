
roll_cooldown = manage_timer(roll_cooldown);
switch (state)
{
	#region idle
		case "idle":
			set_state_sprite(sFist_idle,0.2,0);
			chase_idle_triger();
		break;
	#endregion
	#region Chase
		case "chase":
			set_state_sprite(sFist_walk,0.6,0);
			chase_idle_triger();
			chase_state_fist();
			//jump on top of one block
			
			if instance_exists(oPlayer)
			{
				if oPlayer.grounded && oPlayer.y + 5 < y && grounded
				{
					vsp = -7;
				}
			}
		break;
	#endregion
	#region Attack
		case "attack":
			set_state_sprite(sFist_attack,0.4,0);
			
			if animation_hit_frame(3)
			{
				//audio_play_sound(aMiss,3,0);
				create_hitbox(x, y, self, sFist_attack1_mask, 3, 2, 5, image_xscale);
			}
		
			if animation_end()
			{
				state = "chase";
			}	
		break;
	#endregion
	#region Knockback
		case "knockback":
			knockback_state(sFist_knockback, "stunt");
			alarm[1] = 10;
		break;

	#endregion
	#region Stunt
		case "stunt":
			set_state_sprite(sFist_knockback,0,1);
		break;
	#endregion
	#region Roll
		case "roll":
		roll_cooldown = 30;
			set_state_sprite(sFist_slide,0.2,0);
			roll_state("chase");
		break;
	#endregion
	#region Death
		case "death":
			death_state(sFist_die);
		break;
	#endregion
	#region Dead
		case "dead":
			dead_state(sFist_die);
		break;
	#endregion
}

//endle gravity 
event_inherited();