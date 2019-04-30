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
			//jump on top of one block
			
			if instance_exists(oPlayer)
			{
				if oPlayer.grounded && grounded && oPlayer.y + 5 < y && oPlayer.y + 50 > y 
				{
					vsp = -7;
				}
			}
			
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
			set_state_sprite(attack,0.4,0);
			
			if animation_hit_frame(attack1_frame)
			{
				//audio_play_sound(aMiss,3,0);
				create_hitbox(x, y, self, attack1_mask, 3, 2, 5, image_xscale);
			}
			
			if animation_hit_frame(attack2_frame)
			{
				//audio_play_sound(aMiss,3,0);
				create_hitbox(x, y, self, attack2_mask, 3, 2, 5, image_xscale);
			}
			
			if animation_end()
			{
				state = "chase";
			}	
		break;
	#endregion	
	#region Charge
		case "charge":
			set_state_sprite(attack_charge,0.45,0);
			
			move_and_collide(charge_speed * image_xscale,0);
			if animation_hit_frame(7)
			{
				//audio_play_sound(aMiss,3,0);
				create_hitbox(x, y, self, attack_charge_mask, 3, 2, 5, image_xscale);
			}
			
			if animation_hit_frame(7)
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