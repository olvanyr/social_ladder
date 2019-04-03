
roll_cooldown = manage_timer(roll_cooldown);

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
			set_state_sprite(walk,0.6,0);
			
			chase_idle_triger();
			chase_state_fist();
			//jump on top of one block
			
			if instance_exists(oPlayer)
			{
				if oPlayer.grounded && grounded && oPlayer.y + 5 < y && oPlayer.y + 50 > y 
				{
					vsp = -7;
				}
			}
		break;
	#endregion
	#region Attack
		case "attack":
			set_state_sprite(attack,0.4,0);
			
			if animation_hit_frame(attack1_frame)
			{
				//audio_play_sound(aMiss,3,0);
				create_hitbox(x, y, self, attack1_mask, 3, 2, 5, image_xscale);
			}
			
			if self.object_index == oFist
			{
				if animation_hit_frame(attack2_frame)
				{
					//audio_play_sound(aMiss,3,0);
					create_hitbox(x, y, self, attack2_mask, 3, 2, 5, image_xscale);
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
	#region wait
		case "wait":
			alarm[1] = 30;
		break;
	#endregion
	#region Roll
		case "roll":
		roll_cooldown = 30;
			set_state_sprite(roll,0.2,0);
			roll_state("chase");
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