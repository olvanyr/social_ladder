if vsp != 0 grounded = false;

switch (state)
{
	#region idle
		case "idle":
			set_state_sprite(sFist_idle,0.6,0);
			chase_idle_triger();
		break;
	#endregion
	#region Chase
		case "chase":
			set_state_sprite(sFist_walk,0.6,0);
			chase_idle_triger();
			chase_state_fist();
		break;
	#endregion
	#region Attack
		case "attack":
			set_state_sprite(sFist_attack,0.4,0);
			
			if animation_hit_frame(3)
			{
				//audio_play_sound(aMiss,3,0);
				create_hitbox(x, y, self, sFist_attack1_mask, 3, 2, 5, image_xscale);
			}
		
			if animation_end()
			{
				state = "chase";
			}	
		break;
	#endregion
	#region Knockback
		case "knockback":
			knockback_state(sFist_knockback, "stunt");
			alarm[1] = 10;
		break;

	#endregion
	#region Stunt
		case "stunt":
			set_state_sprite(sFist_knockback,0,1);
		break;
	#endregion
	#region Roll
		case "roll":
			set_state_sprite(sFist_slide,0.3,0);
			
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
				state = "chase";
			}
		break;
	#endregion
	#region Death
		case "death":
			death_state(sFist_die);
		break;
	#endregion
}

if state == "chase" 
{
	if instance_exists(oPlayer)
	{
		if oPlayer.grounded && oPlayer.y + 5 < y && grounded
		{
			vsp = -7;
		}
	}
}
//Aplly gravity

vsp += gravity_speed;

//Re apply fractions
vsp += vsp_fraction;

//Store and Remove fractions
vsp_fraction = vsp - (floor(abs(vsp)) * sign(vsp));
vsp -= vsp_fraction;

move_and_collide(0,vsp);