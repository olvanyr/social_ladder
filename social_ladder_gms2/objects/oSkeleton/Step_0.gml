
if !instance_exists(oPlayer) exit;

if hp <= (max_hp/4)*3 && once1
{
	hp = (max_hp/4)*3;
}

if hp <= (max_hp/4)*1 && once2
{			
	hp = (max_hp/4)*1;
}


show_debug_message("Square state : " + string(state));


roll_cooldown = manage_timer(roll_cooldown);
chase_timer = manage_timer(chase_timer);

switch (state)
{
	#region idle
		case "idle":
			set_state_sprite(idle,idle_spd,0);
			
			if(instance_exists(oPlayer))
			{
				if !collision_line(x,y,oPlayer.x,oPlayer.y,oWall,0,0) && (distance_to_object(oPlayer) < fov) 
				{
					state = "chase";
				}
			}
		break;
	#endregion
	#region Chase
		case "chase":
			set_state_sprite(walk,walk_anim_spd,0);
			
			if !grounded 
			{
				jump_spd = 0;
			}else jump_spd = jump_spd_max;
			
			if(instance_exists(oPlayer))
			{
				// get the absolute distance to the player
				var distance_to_player = point_distance(x, y, oPlayer.x, oPlayer.y);
	
				if self.object_index == oSwordII || self.object_index == oSkeleton
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
				
					if vsp > 0
					{
						set_state_sprite(jump_up,0,1);
					}
					if vsp < 0
					{
						set_state_sprite(jump_up,0,0);
					}				
				}
	
				// if the player is close enought hit him
				if distance_to_player <= attack_range && oPlayer.y > y - 10 && oPlayer.y < y + 10 
				{
					state = "attack1";
				}
				
				
				if distance_to_player <= attack_range + 5 && irandom(4) == 1 && roll_cooldown <= 0
				{
					state = "roll";
				}
			}
			last_state = state;

		break;
	#endregion
	#region Attack 1
		case "attack1":			
			// a normal firstt attack
			set_state_sprite(attack1,attack1_anim_spd,0);

			
			if animation_hit_frame(attack1_frame)
			{
				//audio_play_sound(aMiss,3,0);
				create_hitbox(x + (image_xscale * 10), y, self, attack1_mask, attack1_knockback, 20, attack1_damage, image_xscale);
			}
			
			if image_index >= image_number / 2
			{
				attack_dash -= attack_dash_acceleration;
			}else attack_dash += attack_dash_acceleration;
			
			attack_dash = clamp(attack_dash,0,attack_dash_max_speed);
			
			var dir  = image_xscale;
			move_and_collide(attack_dash * dir,0);
			
			if animation_end()
			{
				state = choose("attack2","chase");
				image_speed = 0;
				last_state = state;
			}	
		break;
	#endregion
	#region Attack 2
		case "attack2":			
			// a normal firstt attack
			set_state_sprite(attack2,attack2_anim_spd,0);

			
			if animation_hit_frame(attack2_frame)
			{
				//audio_play_sound(aMiss,3,0);
				create_hitbox(x + (image_xscale * 10), y, self, attack2_mask, attack2_knockback, 20, attack2_damage, image_xscale);
			}
			
			if image_index >= image_number / 2
			{
				attack_dash -= attack_dash_acceleration;
			}else attack_dash += attack_dash_acceleration;
			
			attack_dash = clamp(attack_dash,0,attack_dash_max_speed);
			
			var dir  = image_xscale;
			move_and_collide(attack_dash * dir,0);
			
			if animation_end()
			{
				alarm[1] = 20;
				state = "wait";
				image_speed = 0;
				last_state = state;
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
			dead_state(die);
		break;
	#endregion
	#region Roll
		case "roll":
			set_state_sprite(roll,roll_anim_speed,0);
			roll_state("chase");
		break;
	#endregion
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
	#region speak
		case "speak":
		
			var idle_sprite = idle;
			
			if form == "normal"
			{
				idle_sprite = sSquare_idle;
			}
			if form == "square"
			{
				idle_sprite = sSquare_idle_square;
			}
			if form == "diamond"
			{
				idle_sprite = sSquare_idle_diamond;
			}
			
			set_state_sprite(idle_sprite,idle_spd,0);
			text_boss("stun");
			alarm[1] = stun_time * 3;
		break;
	#endregion
}




// is the enemy on ground ?
if vsp != 0 grounded = false;

//Aplly gravity

vsp += gravity_speed;

if vsp > 0
{
	//Re apply fractions
	vsp += vsp_fraction;

	//Store and Remove fractions
	vsp_fraction = frac(vsp);
	vsp -= vsp_fraction;
}

move_and_collide(0,vsp);