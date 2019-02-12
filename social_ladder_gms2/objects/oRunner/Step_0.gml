switch (state)
{
		#region idle
		case "idle":
			set_state_sprite(sRunner_idle,0.2,0);
			chase_idle_triger();
		break;
	#endregion
	#region Chase
		case "chase":
			set_state_sprite(sRunner_walk,0.2,0);
			chase_idle_triger();
			chase_state();
			

		break;
	#endregion
	#region Attack
		case "attack":
			
				
		break;
	#endregion
	#region Knockback
		case "knockback":
			knockback_state(sRunner_knockback, "stunt");
			alarm[1] = 20;
		break;

	#endregion
	#region Stunt
		case "stunt":
			set_state_sprite(sRunner_knockback,0,1);
		break;
	#endregion
	#region Death
		case "death":
			death_state(sRunner_die);
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