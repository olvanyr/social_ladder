
if hp <= (max_hp/4)*3 && once1
{
	hp = (max_hp/4)*3;
}

if hp <= (max_hp/4)*1 && once2
{			
	hp = (max_hp/4)*1;
}

show_debug_message("deer state : " + string(state));

switch (state)
{
	#region idle
		case "idle":
			set_state_sprite(idle,idle_spd,0);
			if !collision_line(x,y,oPlayer.x,oPlayer.y,oWall,0,0)
			{
				if(distance_to_object(oPlayer) < fov) 
				{
					if !instance_exists(oDeer_ondulation)
					{
						if instance_number(oDeer_caster) >= 2
						{
							state = choose("chase","ondulation");
						}else state = choose("chase","ondulation","cast");
					}
					
					timer = 0;
				}
			}
				
			image_xscale = - sign(oPlayer.x - x);
			
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
			}else state = "idle";
			
		break;
	#endregion
	#region cast
		case "cast":
			set_state_sprite(shot,shot_anim_spd,0);
			if animation_hit_frame(shot_frame)
			{
				with(instance_create_layer(x, y, "Effects", oDeer_caster))
				{
					creator = other;
					image_xscale = other.image_xscale;
				}
			}
			if animation_end()
			{
				state = "idle";
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
	#region ondulation
		case "ondulation":
			// a normal firstt attack
				set_state_sprite(attack1,attack1_anim_spd,0);
				
				if animation_hit_frame(attack1_frame)
				{
					with instance_create_layer(x,y,"Walls",oDeer_ondulation)
					{
						creator = other;
					}
				}
				
				if animation_end()
				{
					image_speed = 0;
				}
		break;
	#endregion
}


timer ++;

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