#region Depedencies
	if !instance_exists(oInput)
	{
		input = instance_create_layer(0,0,"Instances",oInput)
	}else input = oInput;
	if !instance_exists(oCamera)
	{
		with instance_create_layer(x,y,"Instances", oCamera)
		{
			follow = other;
		}
	}
	if !instance_exists(oHUD)
	{
		instance_create_layer(x,y,"Instances", oHUD)
	}
	
#endregion




//set new hp 

health_bar_width = max_health_bar_width * ((hp/max_hp));


if vsp != 0 grounded = false;
			
//Hit ground sound
if !grounded alarm[0] = 3;


//timer
jump_timer = manage_timer(jump_timer);
roll_cooldown = manage_timer(roll_cooldown);
cast_cooldown = manage_timer(cast_cooldown);
invincibility = manage_timer(invincibility);


			
switch state
{
	#region Move State
		case "move":
			// Acceleration
			walk_speed += acceleration;

			//Re apply fractions
			walk_speed += walk_speed_fraction;

			//Store and Remove fractions
			walk_speed_fraction = frac(walk_speed);
			walk_speed -= walk_speed_fraction;

			if walk_speed > max_walk_speed walk_speed = max_walk_speed;
			
			
			wall_jump_timer = manage_timer(wall_jump_timer);
			
			if wall_jump_timer >=0
			{
				move_and_collide(wall_jump_speed * jump_direction,0);
			}else
			{
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
			}
			
						
			//Jump			
			if grounded
			{
				jump_timer = jump_timer_max;
				jump_counter = 0;
			}
			
			
			//On air animation + wall jump
			var side_wall = place_meeting(x + (image_xscale), y, oWall)
			
			if !grounded
			{
				if vsp > 0
				{
					sprite_index = sPlayer_fall;
					image_speed = 0.2;
				}else
				{
					sprite_index = sPlayer_jump;
					image_speed = 0.2;
					if animation_end() image_speed = 0;
				}
				
				if side_wall 
				{
					//maybe I have to change gravity_slow back to gravity_speed/2
					var gravity_slow = gravity_speed * 0.8;
					
					sprite_index = sPlayer_wall_slide;
					image_speed = 0.2;
					if vsp > 0
					{
						vsp -= gravity_slow;
					}
					
					jump_timer = jump_timer_max;
				}
			}
			
			if input.jump
			{
				if jump_timer >=0 || jump_counter == 1
				{
					vsp = jump_speed;
					//the second jump is lower than the first
					var modified_jump_speed = jump_speed * 0.75;
					if jump_counter == 1 vsp = modified_jump_speed;
					
					jump_counter++;

					if !grounded && side_wall
					{
						
						wall_jump_timer = wall_jump_timer_max;
						jump_direction = -image_xscale;
					}
					
					grounded = false;
				}
			}
			
			
			
			
			
			
			//Cut jump
			if input.jump_released && vsp <= 0 && vsp <= cut_jump_speed
			{
				vsp = cut_jump_speed;
			}
			
			//Use health pack

			healthpack = min(healthpack,3);

			if input.use_healthpack && healthpack > 0 && hp != max_hp
			{
				hp = max_hp;
				healthpack -= 1;
			}
			
			//roll
			
			
			if input.roll && roll_cooldown <= 0
			{
				state = "roll";
			}
			//attack
			attack_down_cooldown = manage_timer(attack_down_cooldown);
			if input.attack
			{
				if input.down 
				{
					if grounded == false && attack_down_cooldown <= 0
					{
						state ="attack_down";
					}
				}else state = "attack_one";
			}
			
			//cast	
			if input.cast && cast_cooldown <= 0
			{
				state = "cast";
			}
	
		break;
	#endregion
	#region Roll
		case "roll":
			roll_cooldown = roll_cooldown_max;
			set_state_sprite(sPlayer_slide_stand,0.3,0);
			roll_state("move");
		break;
	#endregion
	#region Attack one
		case "attack_one":
			set_state_sprite(sPlayer_attack1,attack_animation_speed,0);
			
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
			if input.attack && animation_hit_frame_range(3,6)
			{
				state = "attack_two";
			}
		break;
	#endregion
	#region Attack two
		case "attack_two":
			set_state_sprite(sPlayer_attack2,attack_animation_speed,0);
			
			if animation_hit_frame(3)
			{
				audio_play_sound(aMiss,3,0);
				gamepad_set_vibration(0, 1, 1);
				alarm[1] = 3;
				create_hitbox(x, y, self, sPlayer_attack2_mask, 3, 2, 6, image_xscale);
			}
			if animation_end()
			{
				state = "move";
			}
			if input.attack && animation_hit_frame_range(3,6)
			{
				state = "attack_tree";
			}
						
		break;
	#endregion
	#region Attack tree
		case "attack_tree":
			set_state_sprite(sPlayer_attack3,attack_animation_speed,0);
			
			if animation_hit_frame(2)
			{
				audio_play_sound(aMiss,3,0);
				gamepad_set_vibration(0, 1, 1);
				alarm[1] = 3;
				create_hitbox(x, y, self, sPlayer_attack3_mask, 3, 2, 8, image_xscale);
			}
			if animation_end()
			{
				state = "move";
			}			
		break;
	#endregion
	#region Attack down
		case "attack_down":
			set_state_sprite(sPlayer_dawn_hit,0.6,0);
			if vsp > 0
			{
				vsp = vsp*0.6;
			}
			attack_down_cooldown = attack_down_cooldown_max;
			
			if animation_hit_frame(1)
			{
				audio_play_sound(aMiss,3,0);
				gamepad_set_vibration(0, 1, 1);
				alarm[1] = 3;
				create_hitbox(x, y, self, sPlayer_dawn_hit_mask, 3, 2, 5, image_xscale);
			}
			if hit == true
			{
				vsp = -5;
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
	#region cast
		case "cast":
			cast_cooldown = 120;
			set_state_sprite(sPlayer_cast,0.6,0);
			
			if animation_hit_frame(3)
			{
				with(instance_create_layer(x + (10*image_xscale), y - 17, "Effects", oCast))
				{
					creator = other;
					spd = 3.5;
					image_xscale = other.image_xscale;
				}
			}
			if animation_end()
			{
				state = "move";
			}
		break;
	#endregion
	#region wait
		case "wait":
			set_state_sprite(sPlayer_idle,0.2,0);
		break;
	#endregion
	#region death
		case "death":
			death_state(sPlayer_die);
			//audio_play_sound(aMiss,3,0);
			gamepad_set_vibration(0, 0.5, 0.5);
			if animation_end()
			{
				gamepad_set_vibration(0, 0, 0);
				
				with instance_create_layer(0,0,"Effects", oTransition)
				{
					next_room = global.start_room;
					x_next = global.start_x;
					y_next = global.start_y;
					hp = oPlayer.max_hp;
				}
			}
		break;
	#endregion
}


hit = false;

/*
// To be sure that you can not be set into orbit

if y < ystart - 6 && state != "death"
{
	y = ystart - 6;
}

if state == "death"
{
	ystart = global.start_y;
}else ystart = y;
*/


//Aplly gravity
vsp += gravity_speed;


//Re apply fractions
vsp += vsp_fraction;

//Store and Remove fractions
vsp_fraction = frac(vsp);
vsp -= vsp_fraction;


move_and_collide(0,vsp);