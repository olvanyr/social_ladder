if self.object_index == oFist || self.object_index == oSword || self.object_index == oSwordII
{
	roll_cooldown = manage_timer(roll_cooldown);
}

if place_meeting(x,y,oWall)
{
	if !place_meeting(x + 1,y,oWall)
	{
		x += 1
	}
	if !place_meeting(x - 1,y,oWall)
	{
		x -= 1
	}
}
if place_meeting(x,y,oWall)
{
	if !place_meeting(x,y - 1,oWall)
	{
		y -= 1
	}
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
			if self.object_index == oFist || self.object_index == oSword || self.object_index == oScratcher
			{
				//jump on top of one block
				if instance_exists(oPlayer)
				{
					if distance_to_object(oPlayer) < 50 && grounded && oPlayer.grounded && oPlayer.y + 5 < y
					{
						vsp = -7;
					}
				}
			}

			set_state_sprite(walk,walk_anim_spd,0);
			if self.object_index == oSwordII
			{
				// Follow the path if path exists
				if path_exists(path_building)
				{
				    follow_the_path(path_building);
				}

				if vsp == 0 grounded = true;

				move_and_collide(hsp,0);

				pathfinding_timer ++;

				if instance_exists(oPlayer)
				{
					if pathfinding_timer >= 10 && oPlayer.grounded
					{
						pathfinding_timer = 0;
						     if path_exists(path_building) {
					         path_delete (path_building);
					     }
					     path_point = 0 ;
					     action = 0 ;
					     jump_action = 0 ;

					    fill_the_grid(floor(x/oGrid.cell_width), floor(y/oGrid.cell_height), floor(oPlayer.x/oGrid.cell_width), floor(oPlayer.y/oGrid.cell_height));
					}
				}
				
				image_xscale = sign(hsp);
				if image_xscale == 0 image_xscale = 1;
				
				if hsp == 0
				{
					set_state_sprite(idle,idle_spd,0);
				}
				
				// get the absolute distance to the player
				var distance_to_player = point_distance(x, y, oPlayer.x, oPlayer.y);
				
				// if the player is close enought hit him
				if distance_to_player <= attack_range
				{
					state = "attack";
				}
				
				if distance_to_player <= attack_range + 5 && irandom(4) == 1 && roll_cooldown <= 0
				{
					state = "roll";
				}
				
				show_debug_message("SwordII state :" + string(state));
				
			}else state_chase();
		break;
	#endregion
	#region Attack
		case "attack":
			if self.object_index == oRunner || self.object_index == oRunnerII || self.object_index == oMimic
			{
				state = "chase";
			}
			
			if self.object_index == oFist || self.object_index == oSword || self.object_index == oSwordII || self.object_index == oScratcher || self.object_index == oSlug || self.object_index == oDistance || self.object_index == oLegs
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