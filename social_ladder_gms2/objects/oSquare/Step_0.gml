
if hp <= (max_hp/4)*3 && once1
{
	hp = (max_hp/4)*3;
}

if hp <= (max_hp/4)*1 && once2
{			
	hp = (max_hp/4)*1;
}

show_debug_message("Square state : " + string(state));

switch (state)
{
	#region idle
		case "idle":
			dir = sign(oPlayer.x - x);;
			
			if form == "diamond"
			{
				set_state_sprite(idle2,0,0);
				if timer > idle_wait_time
				{
					//state = choose("attack_pierces","recomposing","squaring","attack_pierces_middle");
					state = choose("attack_pierces","attack_pierces_middle");
					timer = 0;
				}
			}
			
			if form == "normal"
			{
				set_state_sprite(idle,idle_spd,0);
				if timer > idle_wait_time
				{
					state = choose("decomposing");
					timer = 0;
				}
			}
			
			if form == "square"
			{
				set_state_sprite(idle3,idle_spd,0);
				if timer > idle_wait_time
				{
					//state = choose("squaring","up");
					state = choose("up");
					timer = 0;
				}
			}
			if position == "middle" && state = "attack_pierces_middle"
			{
				state = "attack_pierces"
			}
			if position == "left" || position == "right"
			{
				if state = "attack_pierces"
				{
					state = "attack_pierces_middle"
				}
			}
			
			if !place_meeting(x,y+1,oWall)
			{
				if state == "recomposing"
				{
					state = "idle";
				}
			}
			
			if place_meeting(x,y+1,oWall)
			{
				if state = "up"
				{
					show_debug_message("state was up but wall");
					state = "idle";
					timer = idle_wait_time;
				}
			}
			
				
			//image_xscale = - sign(oPlayer.x - x);
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
			set_state_sprite(idle,idle_spd,0);
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
			// a normal firstt attack
				set_state_sprite(decomposing,decomposing_anim_spd,0);
				
				if animation_end()
				{
					image_speed = 0;
					state = "idle";
					form = "diamond";
				}
		break;
		case "recomposing":
			// a normal firstt attack
				set_state_sprite(recomposing,decomposing_anim_spd,0);
				
				if animation_end()
				{
					image_speed = 0;
					state = "idle";
					form = "normal";
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
	#region up/down
		case "up":
		
		
		if lvl == 1
		{
			if up_down == noone
			{
				up_down = "up";
			}
		}
		
		if lvl == 2 || lvl == 3
		{
			if up_down == noone
			{
				up_down = choose("up","down");
			}
		}
		
		if lvl == 4
		{
			if up_down == noone
			{
				up_down = "down";
			}
		}
		
		if up_down = "up"
		{
			set_state_sprite(up,up_anim_speed,0);
			
			if y >= lvl_ground - ((lvl + 1)*lvl_height)
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
			
			if y <= lvl_ground - ((lvl - 1)*lvl_height)
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
}


timer ++;