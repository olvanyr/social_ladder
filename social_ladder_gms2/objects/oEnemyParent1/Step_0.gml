if self.object_index == oFist
{
	roll_cooldown = manage_timer(roll_cooldown);
}


switch (state)
{
	#region idle
		case "idle":
			set_state_sprite(idle,idle_spd,0);
			state_idle();
		break;
	#endregion
	#region Chase
		case "chase":
			set_state_sprite(walk,walk_anim_spd,0);
			state_chase();
			
			if self.object_index == oFist || self.object_index == oSword || self.object_index == oScratcher
			{
				//jump on top of one block
				if instance_exists(oPlayer)
				{
					if oPlayer.grounded && grounded && oPlayer.y + 5 < y && oPlayer.y + 50 > y 
					{
						vsp = -7;
					}
				}
			}
		break;
	#endregion
	#region Attack
		case "attack":
			if self.object_index == oRunner || self.object_index == oRunnerII || self.object_index == oMimic
			{
				state = "chase";
			}
			
			if self.object_index == oFist || self.object_index == oSword || self.object_index == oScratcher || self.object_index == oSlug || self.object_index == oDistance || self.object_index == oLegs
			{
				// a normal firstt attack
				set_state_sprite(attack1,attack1_anim_spd,0);
				if animation_hit_frame(attack1_frame)
				{
					//audio_play_sound(aMiss,3,0);
					create_hitbox(x, y, self, attack1_mask, 3, 2, attack1_damage, image_xscale);
				}
				
				// a second attack within the first animation 
				if self.object_index == oFist || self.object_index == oScratcher
				{
					if animation_hit_frame(attack2_frame)
					{
						//audio_play_sound(aMiss,3,0);
						create_hitbox(x, y, self, attack2_mask, 3, 2, attack2_damage, image_xscale);
					}
				}
				
				if animation_end()
				{
					if self.object_index == oSlug
					{
						state = "stun";
						alarm[1] = stun_time;
					}else state = "chase";
				}	
			}
			
			if self.object_index == oWrath
			{
				if hp < max_hp/2
				{
					set_state_sprite(attack2,attack2_anim_spd,0);
				
					if animation_hit_frame(attack2_frame)
					{
						//audio_play_sound(aMiss,3,0);
						create_hitbox(x, y, self, attack2_mask, 3, 2, attack2_damage, image_xscale);
					}
				}else 
				{
					set_state_sprite(attack1,attack1_anim_spd,0);
			
					if animation_hit_frame(attack1_frame)
					{
						//audio_play_sound(aMiss,3,0);
						create_hitbox(x, y, self, attack1_mask, 3, 2, attack1_damage, image_xscale);
					}
				}
			
			
				if animation_end()
				{
					state = "chase";
				}
			}
		break;
	#endregion
	#region Knockback
		case "knockback":
			knockback_state(knockback_sprite, "stun");
			alarm[1] = stun_time;
		break;

	#endregion
	#region Stun
		case "stun":
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
			/*if self.object_index == oSlug
			{
				if animation_end()
				{
					state = "dead";
				}
				
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
						create_hitbox(x, y, self, attack2_mask, 3, 2, attack2_damage, image_xscale);
					}
				
				}else
				{
					death_state(die);
				}
				
			}else*/ dead_state(die);
		break;
	#endregion
	//mimic
	#region Show
		case "show":
			set_state_sprite(transformation, 0.4,0);
			if animation_end()
			{
				state = "chase";
			}
		break;
	#endregion
	#region Hide
		case "hide":
			set_state_sprite(transformation, -0.4,4);
			if image_index == 0
			{
				state = "idle";
			}
		break;
	#endregion
	//fist and sword
	#region Roll
		case "roll":
			set_state_sprite(roll,0.2,0);
			roll_state("chase");
		break;
	#endregion
	//scratcher
	#region Charge
		case "charge":
			set_state_sprite(charge,charge_anim_spd,0);
			
			move_and_collide(charge_speed * image_xscale,0);
			if animation_hit_frame(7)
			{
				//audio_play_sound(aMiss,3,0);
				create_hitbox(x, y, self, charge_mask, knockback_charge, 2, charge_damage, image_xscale);
			}
			
			if animation_hit_frame(7)
			{
				state = "chase";
			}	
		break;
	#endregion
	//distance
	#region shot
		case "shot":
			set_state_sprite(shot,shot_anim_spd,0);
			
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
}




// is the enemy on ground ?
if vsp != 0 grounded = false;

//Aplly gravity

vsp += gravity_speed;

//Re apply fractions
vsp += vsp_fraction;

//Store and Remove fractions
vsp_fraction = vsp - (floor(abs(vsp)) * sign(vsp));
vsp -= vsp_fraction;

move_and_collide(0,vsp);