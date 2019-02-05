
switch state
{
	#region Move State
		case "move":
		
			
		
			// Acceleration
			walk_speed += acceleration;
			if walk_speed > max_walk_speed walk_speed = max_walk_speed;
			
			//Move
			if input.right
			{
				move_and_collide(walk_speed,0);
				image_xscale = 1;
				sprite_index = sPlayer_walk;
				image_speed = 0.6;
			}
			if input.left
			{
				move_and_collide(-walk_speed,0);
				image_xscale = -1;
				sprite_index = sPlayer_walk;
				image_speed = 0.6;
			}

			if !input.right && !input.left || input.right && input.left 
			{
				sprite_index = sPlayer_idle;
				image_speed = 0.2;
				walk_speed = 0;
			}else
			{
				if grounded
				{
					if animation_hit_frame(2) || animation_hit_frame(5)
					{
						audio_play_sound(aFootstep,2,0);
					}
				}
			}
			
			
						
			//Jump
			
			jump_timer --;
			if jump_timer < -1 jump_timer = -1;
			
			if grounded
			{
				jump_timer = 4;
				jump_counter = 0;
			}
			
			
			//On air animation + wall jump
			var side_wall = place_meeting(x + (image_xscale * half_mask_width), y - mask_height, oWall);
			
			if !grounded
			{
				if vsp > 0
				{
					if side_wall 
					{
						sprite_index = sPlayer_wall_slide;
						image_speed = 0.2;
						vsp -= gravity_speed/3;
						jump_timer = 4;
					}else
					{
						sprite_index = sPlayer_fall;
						image_speed = 0.2;
					}
				}else
				{
					sprite_index = sPlayer_jump;
					image_speed = 0.2;
					if animation_end() image_speed = 0;
				}
			}
			
			
			
			if input.jump
			{
				if jump_timer >=0 || jump_counter = 1
				{
					vsp = jump_speed;
					grounded = false;
					jump_counter++;
				}
			}
			//Cut jump
			if input.jump_released && vsp <= 0 && vsp <= cut_jump_speed
			{
				vsp = cut_jump_speed;
			}

			//Hit ground sound
			if !grounded alarm[0] = 3;
			
			//roll
			if input.roll
			{
				state = "roll";
			}
			//attack
			if input.attack
			{
				if input.down && grounded == false
				{
					state ="attack_down";
				}else state = "attack_one";
			}
			
		break;
	#endregion
	#region Roll
		case "roll":
			set_state_sprite(sPlayer_slide_stand,0.3,0);
			
			if image_xscale == 1
			{
				move_and_collide(slide_speed,0);
			}
			if image_xscale == -1
			{
				move_and_collide(-slide_speed,0);
			}
			
			if animation_end()
			{
				state = "move";
			}
		break;
	#endregion
	#region Attack one
		case "attack_one":
			set_state_sprite(sPlayer_attack1,0.6,0);
			
			if animation_hit_frame(3)
			{
				audio_play_sound(aMiss,3,0);
				gamepad_set_vibration(0, 1, 1);
				alarm[1] = 3;
				create_hitbox(x, y, self, sPlayer_attack1_mask, 3, 2, 5, image_xscale);
			}
			if animation_end()
			{
				state = "move";
			}
			if input.attack && animation_hit_frame_range(3,5)
			{
				state = "attack_two";
			}
		break;
	#endregion
	#region Attack two
		case "attack_two":
			set_state_sprite(sPlayer_attack2,0.6,0);
			
			if animation_hit_frame(4)
			{
				audio_play_sound(aMiss,3,0);
				gamepad_set_vibration(0, 1, 1);
				alarm[1] = 3;
				create_hitbox(x, y, self, sPlayer_attack1_mask, 3, 2, 6, image_xscale);
			}
			if animation_end()
			{
				state = "move";
			}
			if input.attack && animation_hit_frame_range(4,6)
			{
				state = "attack_tree";
			}
						
		break;
	#endregion
	#region Attack tree
		case "attack_tree":
			set_state_sprite(sPlayer_attack3,0.6,0);
			
			if animation_hit_frame(4)
			{
				audio_play_sound(aMiss,3,0);
				gamepad_set_vibration(0, 1, 1);
				alarm[1] = 3;
				create_hitbox(x, y, self, sPlayer_attack1_mask, 3, 2, 8, image_xscale);
			}
			if animation_end()
			{
				state = "move";
			}			
		break;
	#endregion
	#region Attack down
		case "attack_down":
			set_state_sprite(sPlayer_dawn_hit,1,0);
			
			if animation_hit_frame(2)
			{
				audio_play_sound(aMiss,3,0);
				gamepad_set_vibration(0, 1, 1);
				alarm[1] = 3;
				create_hitbox(x, y, self, sPlayer_dawn_hit_mask, 3, 2, 5, image_xscale);
			}
			if animation_end()
			{
				state = "move";
			}
		break;
	#endregion
	#region Knockback
		case "knockback":
		knockback_state(sPlayer_knockback, "move");
	break;
	#endregion
	
}


//Aplly gravity

vsp += gravity_speed;

//Re apply fractions
vsp += vsp_fraction;

//Store and Remove fractions
vsp_fraction = vsp - (floor(abs(vsp)) * sign(vsp));
vsp -= vsp_fraction;

move_and_collide(0,vsp);


