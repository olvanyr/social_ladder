
var _vx = camera_get_view_x(view_camera[0]);
var _vy = camera_get_view_y(view_camera[0]);
var _vw = camera_get_view_width(view_camera[0]);
var _vh = camera_get_view_height(view_camera[0]);
instance_activate_all();

//instance_activate_region(_vx - 64, _vy - 64, _vw + 128, _vh + 128, true);
instance_deactivate_region(_vx - 64, _vy - 64, _vw + 128, _vh + 128, false, true);
instance_activate_object(oInput);
instance_activate_object(oDisplay_manager);
instance_activate_object(oHUD);
instance_activate_object(oCamera);
instance_activate_object(oTransition);
instance_activate_object(oJukebox);
instance_activate_object(oMap);
instance_activate_object(oCast);
instance_activate_object(oWall);
instance_activate_object(oPlatform);


//show_debug_message("player state : " + string(state));



//set new hp 
health_bar_width = max_health_bar_width * (((hp * global.difficulty)/(max_hp * global.difficulty)));

//track that the player is not on the groun
if vsp != 0 grounded = false;
			
//Hit ground sound
if !grounded alarm[0] = 3;


//timer
jump_timer = manage_timer(jump_timer);
roll_cooldown = manage_timer(roll_cooldown);
cast_cooldown = manage_timer(cast_cooldown);
invincibility = manage_timer(invincibility);

//fix the move and knockback against wall bug 
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


//adaptative dificulty

if death_counter > 0
{
	if death_memory != death_counter
	{
		death_memory = death_counter;
		death_timer = 0;
	}
	
	death_timer ++;
	
}else
{
	death_timer = 0;
}

if death_timer >= (60 * 5 * 60) // secondes * minutes * frames
{
	death_counter = 0;
	death_memory = 0;
}

switch death_counter
{
	case 2 :
	{
		global.difficulty = 1.05;
	}
	break;
	case 4 :
	{
		global.difficulty = 1.1;
	}
	break;
	case 5 :
	{
		global.difficulty = 1.2;
	}
	break;
	case 7 :
	{
		global.difficulty = 1.4;
	}
	break;
}


//set the damage for each attack
var damage_1 = 5 * global.difficulty, knockback_1 = 3;

var damage_2 = 6 * global.difficulty, knockback_2 = 3;

var damage_3 = 8 * global.difficulty, knockback_3 = 3;

var damage_down = 5 * global.difficulty, knockback_down = 3;

damage_cast = 5 * global.difficulty;
knockback_cast = 3;

			
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
			
			if wall_jump_timer >= 0
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
							audio_sound_pitch(aFootstep,choose(0.8,1.0,1.2));
							audio_play_sound(aFootstep,priority.low,0);
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
			var side_wall = place_meeting(x + (image_xscale), y - 5, oWall)
			
			if !grounded
			{
				platform = false;
				
				if vsp > 0
				{
					set_state_sprite(sPlayer_fall,0.2,0);
				}
				if vsp <= 0
				{
					set_state_sprite(sPlayer_jump,0.8,2);
					//if animation_end() image_speed = 0;
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
					
					if global.wall_jump jump_timer = jump_timer_max;
				}
			}
			
			if input.jump 
			{
				if input.down && place_meeting(x,y+1,oPlatform) && grounded
				{
					platform = true;
				}else
				{
					if jump_timer >=0 || jump_counter == 1
					{
						vsp = jump_speed;
					
						if global.double_jump
						{
							//the second jump is lower than the first
							var modified_jump_speed = jump_speed * 0.75;
							if jump_counter == 1 vsp = modified_jump_speed;
						
							jump_counter++;
						}else jump_counter += 2;

						if !grounded && side_wall && global.wall_jump
						{
						
							wall_jump_timer = wall_jump_timer_max;
							jump_direction = -image_xscale;
						}
					
						grounded = false;
					}
				}
			}
			
			
			
			
			
			
			//Cut jump
			if input.jump_released && vsp <= 0 && vsp <= cut_jump_speed
			{
				vsp = cut_jump_speed;
			}
			
			//Use health pack

			healthpack = min(healthpack,3);

			if input.use_healthpack && healthpack > 0 && hp != max_hp && !input.suicide_left
			{
				state = "heal";
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
			if input.cast && cast_cooldown <= 0 && global.cast
			{
				state = "cast";
			}
			
			//suicide
			if input.suicide_left && input.suicide_right
			{
				suicide_timer ++;
				if suicide_zoom < 0.2 
				{
					suicide_zoom += 0.002;
				}
				if instance_exists(oCamera)
				{
					oCamera.view_w = oCamera.view_w * (1-suicide_zoom);
					oCamera.view_h = oCamera.view_h * (1-suicide_zoom);
				}
				gamepad_set_vibration(0, 0.5, 0.5);
				instance_create_layer(x,y,"Effects",oSuicide_particle);
				
				if suicide_timer = 120
				{
					gamepad_set_vibration(0, 0.75, 0.75);
					state = "suicide";
				}
			}else 
			{	
				suicide_timer = 0;
				suicide_zoom = 0;
				gamepad_set_vibration(0, 0, 0);
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
			// if the player dosen't have an enemy in front but have one behind, flip the character
			if !place_meeting(x + (image_xscale * 30), y - (10), oEnemyParent1) && place_meeting(x + (-image_xscale * 25), y - (10), oEnemyParent1)
			{
				with instance_place(x + (-image_xscale * 25), y - (10), oEnemyParent1)
				{
					if state != "dead" && state != "death"
					{
						other.image_xscale = -other.image_xscale;
					}
				}
			}
			
			set_state_sprite(sPlayer_attack1,attack_animation_speed,0);
			
			if animation_hit_frame(3)
			{
				audio_sound_pitch(aMiss,choose(0.8,1.0,1.2));
				audio_play_sound(aMiss,priority.normal,0);
				gamepad_set_vibration(0, 1, 1);
				alarm[1] = 3;
				create_hitbox(x, y, self, sPlayer_attack1_mask, knockback_1, 2, damage_1, image_xscale);
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
				audio_sound_pitch(aMiss,choose(0.8,1.0,1.2));
				audio_play_sound(aMiss,priority.normal,0);
				gamepad_set_vibration(0, 1, 1);
				alarm[1] = 3;
				create_hitbox(x, y, self, sPlayer_attack2_mask,knockback_2, 2, damage_2, image_xscale);
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
				audio_sound_pitch(aMiss,choose(0.8,1.0,1.2));
				audio_play_sound(aMiss,priority.normal,0);
				gamepad_set_vibration(0, 1, 1);
				alarm[1] = 3;
				create_hitbox(x, y, self, sPlayer_attack3_mask, knockback_3, 2, damage_3, image_xscale);
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
				audio_sound_pitch(aMiss,choose(0.8,1.0,1.2));
				audio_play_sound(aMiss,priority.normal,0);
				gamepad_set_vibration(0, 1, 1);
				alarm[1] = 3;
				create_hitbox(x, y, self, sPlayer_dawn_hit_mask, knockback_down, 2, damage_down, image_xscale);
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
			var side_wall = place_meeting(x + (image_xscale), y, oWall);
		
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
					damage = other.damage_cast;
					knockback = other.knockback_cast;
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
	#region heal
		case "heal":
			set_state_sprite(sPlayer_pickup,0.4,0);
			if animation_hit_frame(3)
			{
				hp = max_hp;
				healthpack -= 1;
			}
			if animation_end()
			{
				state = "move";
			}
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
					global.new_music = mRoom0;
				}
			}
		break;
	#endregion
	#region wake_up
		case "wake_up":
			set_state_sprite(sPlayer_wake_up,0,0);
			
			if input.jump || input.left || input.right || input.attack
			{
				image_speed = 0.3;
			}
			if animation_end()
			{
				state = "move";
			}
		break;
	#endregion
	#region suicide
		case "suicide":
			set_state_sprite(sPlayer_down,0.3,0);
			//audio_play_sound(aMiss,3,0);
			hp = 0.01;
			if animation_end()
			{
				image_speed = 0;
				gamepad_set_vibration(0, 0, 0);
				with instance_create_layer(0,0,"Effects", oTransition)
				{
					next_room = global.start_room;
					x_next = global.start_x;
					y_next = global.start_y;
					hp = oPlayer.max_hp;
					global.new_music = mRoom0;
				}
			}
		break;
	#endregion
}


hit = false;


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