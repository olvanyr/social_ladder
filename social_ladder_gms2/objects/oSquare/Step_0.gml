
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
show_debug_message("Square form : " + string(form));

switch (state)
{
	#region idle
		case "idle":
			dir = sign(oPlayer.x - x);;
			
			if form == "normal"
			{
				set_state_sprite(idle,idle_spd,0);
				if timer > idle_wait_time
				{
					state = choose("decomposing","chase");
					timer = 0;
				}
			}
			
			if form == "diamond"
			{
				set_state_sprite(idle_diamond,0,0);
				
				if timer > idle_wait_time
				{
					//state = choose("attack_pierces","attack_pierces","decomposing","squaring","attack_pierces_middle");
					state = choose("attack_pierces","attack_pierces_middle");
					timer = 0;
					
					if distance_to_object(oPlayer) < fov
					{
						state = choose(state,"attack_rotate");
					}
				}
			}
			
			if form == "square"
			{
				set_state_sprite(idle_square,idle_spd,0);
				if timer > idle_wait_time
				{
					//state = choose("squaring","up","up","attack_charge_middle","attack_charge",);
					state = choose("squaring");
					timer = 0;
				}
			}
			
			if position == "middle" && state = "attack_pierces_middle"
			{
				state = "attack_pierces"
			}
			
			if position == "middle" && state = "attack_charge_middle"
			{
				state = "attack_charge"
			}
			
			if position == "left" || position == "right"
			{
				if state = "attack_pierces"
				{
					state = choose("attack_pierces_middle","attack_pierces")
				}
				if state = "attack_charge"
				{
					state = choose("attack_charge_middle","attack_charge")
				}
			}
			
			if position == "left" || position == "right"
			{
				if state == "decomposing"
				{
					state = "idle";
					timer = idle_wait_time;
				}
			}
			
			if place_meeting(x,y+5,oWall)
			{
				if state = "up"
				{
					show_debug_message("state was up but wall");
					state = "idle";
					timer = idle_wait_time;
				}
			}
			
			if last_state == state
			{
				state = "idle";
				timer = idle_wait_time;
			}
			if state != "idle" last_state = state;
				
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
	#region Chase
		case "chase":
		
			set_state_sprite(walk,walk_anim_spd,0);
			
			if timer <= chassing_time
			{
				if place_meeting(x + image_xscale,y,oEnemy_wall)
				{
					image_xscale = -image_xscale;
				}
				var direction_facing = image_xscale;
				move_and_collide(direction_facing * chase_speed,0);
			}else 
			{
				state = "idle";
				timer = 0;
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
	#region decomposing
		case "decomposing":
		
			if form = "normal"
			{
				set_state_sprite(decomposing,decomposing_anim_spd,0);
				
				if animation_end()
				{
					image_speed = 0;
					state = "idle";
					form = "diamond";
				}
			}
			if form = "diamond"
			{
				set_state_sprite(recomposing,decomposing_anim_spd,0);
				
				if animation_end()
				{
					image_speed = 0;
					state = "idle";
					form = "normal";
				}
			}
		break;
	#endregion
	#region Squaring
		case "squaring":
			// a normal firstt attack
			if form = "diamond"
			{
				set_state_sprite(squaring,squaring_anim_spd,0);
				
				if animation_end()
				{
					image_speed = 0;
					state = "idle";
					form = "square";
				}
			}
			if form = "square"
			{
				set_state_sprite(diamonding,squaring_anim_spd,0);
				
				if animation_end()
				{
					image_speed = 0;
					state = "idle";
					form = "diamond";
				}
			}
		break;
	#endregion
	#region attack pierces
		case "attack_pierces":
			set_state_sprite(attack_pierces,attack_pierces_anim_spd,0);
					
			image_xscale = dir;
			
			if animation_hit_frame(3)
			{
				
				image_speed = 0
			}
			
			if dir == -1 
			{
				if x <= left_border
				{
					image_speed = attack_pierces_anim_spd;
					dir = -1;
					position = "left";
				}else x += dir * pierces_spd;
			}
			
			if dir == 1
			{
				if x >= right_border
				{
					image_speed = attack_pierces_anim_spd;
					dir = 1;
					position = "right";
				}else x += dir * pierces_spd;
			}
			
			if animation_end()
			{
				timer = 0;
				state = "idle";
			}
			
		break;
	#endregion
	#region attack pierces middle
		case "attack_pierces_middle":
			set_state_sprite(attack_pierces,attack_pierces_anim_spd,0);

			image_xscale = dir;
			
			if animation_hit_frame(3)
			{
				
				image_speed = 0
			}
			
			if dir == -1 
			{
				if x <= left_border + ((right_border - left_border) / 2)
				{
					image_speed = attack_pierces_anim_spd;
					dir = -1;
					position = "middle";
				}else x += dir * pierces_spd;
			}
			
			if dir == 1
			{
				if x >= left_border + ((right_border - left_border) / 2)
				{
					image_speed = attack_pierces_anim_spd;
					dir = 1;
					position = "middle";
				}else x += dir * pierces_spd;
			}
			
			if animation_end()
			{
				timer = 0;
				state = "idle";
			}
			
		break;
	#endregion
	#region attack charge
		case "attack_charge":
			set_state_sprite(attack_charge,attack_charge_anim_spd,0);
					
			image_xscale = dir;
			
			if animation_hit_frame(3)
			{
				
				image_speed = 0
			}
			
			if dir == -1 
			{
				if x <= left_border
				{
					image_speed = attack_charge_anim_spd;
					dir = -1;
					position = "left";
					timer = 0;
					state = "idle";
				}else x += dir * charge_spd;
			}
			
			if dir == 1
			{
				if x >= right_border
				{
					image_speed = attack_charge_anim_spd;
					dir = 1;
					position = "right";
					timer = 0;
					state = "idle";
				}else x += dir * charge_spd;
			}
			
		break;
	#endregion
	#region attack charge middle
		case "attack_charge_middle":
			set_state_sprite(attack_charge,attack_charge_anim_spd,0);

			image_xscale = dir;
			
			if animation_hit_frame(3)
			{
				
				image_speed = 0
			}
			
			if dir == -1 
			{
				if x <= left_border + ((right_border - left_border) / 2)
				{
					image_speed = attack_charge_anim_spd;
					dir = -1;
					position = "middle";
					timer = 0;
					state = "idle";
				}else x += dir * charge_spd;
			}
			
			if dir == 1
			{
				if x >= left_border + ((right_border - left_border) / 2)
				{
					image_speed = attack_charge_anim_spd;
					dir = 1;
					position = "middle";
					timer = 0;
					state = "idle";
				}else x += dir * charge_spd;
			}
		break;
	#endregion
	#region up/down
		case "up":
		if lvl == 0
		{
			if up_down == noone
			{
				up_down = "up";
			}
		}
		
		if lvl == 1 || lvl == 2
		{
			if up_down == noone
			{
				up_down = choose("up","down");
			}
		}
		
		if lvl == 3
		{
			if up_down == noone
			{
				up_down = "down";
			}
		}
		show_debug_message("square up_down : " + string(up_down));
		if up_down = "up"
		{
			set_state_sprite(up,up_anim_speed,0);
			
			if y > lvl_ground - ((lvl + 1)*lvl_height)
			{
				y -= up_spd;
			}else 
			{
				state = "idle";
				lvl ++;
				up_down = noone;
			}
		}
		

		if up_down = "down"
		{
			set_state_sprite(down,up_anim_speed,0);
			
			if y < lvl_ground - ((lvl - 1)*lvl_height)
			{
				y += up_spd;
			}else 
			{
				state = "idle";
				lvl --;
				up_down = noone;
			}
		}
		break;
	#endregion
	#region attack rotate
		case "attack_rotate":
		set_state_sprite(attack1,attack1_anim_spd,0);
		if animation_hit_frame(attack1_frame)
		{
			//audio_play_sound(aMiss,3,0);
			create_hitbox(x, y, self, attack1_mask, 3, 2, attack1_damage, image_xscale);
		}
		
		if animation_end()
		{
			state = choose("rotate_end","rotate_projectile");
			timer = 0;
		}
		break;
	#endregion
	#region rotate end
		case "rotate_end":
		set_state_sprite(rotate_end,rotate_end_anim_spd,0);
		
		if animation_end()
		{
			state = "idle";
			timer = 0;
		}
		break;
	#endregion
	#region rotate prokjectile
		case "rotate_projectile":
		set_state_sprite(rotate_projectile,rotate_end_anim_spd,0);
		dir = sign(oPlayer.x - x);;
		if animation_hit_frame(rotate_projectile_frame)
		{
			//audio_play_sound(aMiss,3,0);
			with instance_create_layer(x,y,"Effects",oSquare_projectile)
			{
				dir = other.dir;
				contact_damage = other.rotate_projectile_damage;
			}
		}
		
		if animation_end()
		{
			state = "idle";
			timer = 0;
		}
		break;
	#endregion
}


timer ++;