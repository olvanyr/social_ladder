
if !instance_exists(oPlayer) exit;

if hp <= (max_hp/4)*3 && once1
{
	hp = (max_hp/4)*3;
}

if hp <= (max_hp/4)*1 && once2
{			
	hp = (max_hp/4)*1;
}

show_debug_message("Horn state : " + string(state));
//show_debug_message("Square form : " + string(form));

switch (state)
{
	#region Start
		case "start":
		
			set_state_sprite(idle,idle_spd,0);
			
			if distance_to_object(oPlayer) <= fov
			{
				state = "idle";
				timer = 0;
			}
			
		break;
	#endregion
	#region idle
		case "idle":
			dir = sign(oPlayer.x - x);;
			
			if(instance_exists(oPlayer))
			{
				// get the absolute distance to the player
				var distance_to_player = point_distance(x, y, oPlayer.x, oPlayer.y);
				
				if timer > idle_wait_time
				{
					if form == "invisible"
					{
						set_state_sprite(disparition,0,image_number - 1);
						x = choose(520,580);
						switch (x)
						{
							case 520 : //this is an exemple
								y = 447;
							break;
							case 580 : //this is an exemple
								y = 447;
							break
						}
					}
					state = choose("transform");
					timer = 0;
					
					if form == "visible"
					{
						set_state_sprite(idle,idle_spd,0);
						if distance_to_player <= attack_range && oPlayer.y > y - 10 && oPlayer.y < y + 10 
						{
							state = "attack1";
							timer = 0;
						}
					}
				}
			}
				
			#region speak init
			if hp <= (max_hp/4)*3 && once1
			{
				
				once1 = false;
				
				hp = (max_hp/4)*3;
				
				state = "speak";
				
				if instance_exists(oPlayer)
				{
					oPlayer.state = "wait";
				}				
				lines[0] = "text 1 ligne 1";
				lines[1] = "text 1 ligne 2";
				lines[2] = "text 1 ligne 3";
			}
			
			if hp <= (max_hp/4)*1 && once2
			{
				
				once2 = false;
				
				hp = (max_hp/4)*1;
				
				state = "speak";
				
				if instance_exists(oPlayer)
				{
					oPlayer.state = "wait";
				}				
				lines[0] = "text 2 ligne 1";
				lines[1] = "text 2 ligne 2";
				lines[2] = "text 2 ligne 3";
				lines[3] = "ligne 4";
			}
			#endregion
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
	#region Death
		case "death":
			death_state(die);
			if instance_exists(oDoor)
			{
				oDoor.door_status = "open"
			}
		break;
	#endregion
	#region Dead
		case "dead":
			dead_state(die);
		break;
	#endregion
	#region transform
		case "transform":
		
			if form = "visible"
			{
				set_state_sprite(disparition,apparition_anim_spd,0);
				
				if animation_end()
				{
					image_speed = 0;
					state = "idle";
					form = "invisible";
					timer = 0;
				}
			}
			if form = "invisible"
			{
				set_state_sprite(apparition,apparition_anim_spd,0);
				
				if animation_end()
				{
					image_speed = 0;
					state = "idle";
					form = "visible";
					timer = 0;
				}
			}
		break;
	#endregion
	#region Attack 1
		case "attack1":			
			// a normal firstt attack
			set_state_sprite(attack1,attack1_anim_spd,0);

			
			if animation_hit_frame(attack1_frame)
			{
				//audio_play_sound(aMiss,3,0);
				create_hitbox(x, y, self, attack1_mask, attack1_knockback, 3, attack1_damage, image_xscale);
			}
			
			if animation_end()
			{
				image_speed = 0;
				state = "idle";
			}	
			
			/*
			if timer > attack1_timer
			{
				state = choose("attack2","chase");
				timer = 0;
			}*/
		break;
	#endregion
}


timer ++;