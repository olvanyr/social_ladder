
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
			state = "chase";
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
	#region Dead
		case "dead":
			dead_state(sRunner_die);
		break;
	#endregion
}

//endle gravity 
event_inherited();