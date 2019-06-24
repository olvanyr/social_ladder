//show_debug_message(state);

switch (state)
{
	#region idle
		case "idle":
			set_state_sprite(idle,idle_spd,0);
			state = choose("chase","cast");
			timer = 0;
			image_xscale = sign(oPlayer.x - x);
			
			//if hp <= (max_hp/4)*3 && once1
			if hp <= max_hp - 1 && once1
			{
				
				once1 = false;
				
				hp = (max_hp/4)*3;
				
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
				/*
				image_xscale = sign(oPlayer.x - x);
				
				if abs(oPlayer.x - x) < 2 image_xscale = 0
				if (image_xscale == 0) image_xscale = 1;
				var direction_facing = image_xscale;
				move_and_collide(direction_facing * chase_speed, 0);
				*/
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
		
			if timer <= casting_time
			{
				//creat projectile
			}else state = "idle";
		break;
	#endregion
	#region speak
		case "speak":
			set_state_sprite(idle,idle_spd,0);
			text_boss("idle");
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