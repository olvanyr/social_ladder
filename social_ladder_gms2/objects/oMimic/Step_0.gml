switch (state)
{
	#region idle
		case "idle":
			set_state_sprite(idle,0,0);
			chase_mimic_triger();
		break;
	#endregion
	#region Chase
		case "chase":
			set_state_sprite(walk,walk_animation_speed,0);
			idle_mimic_triger();
			chase_state();
		break;
	#endregion
	#region Show
		case "show":
			set_state_sprite(transformation, 0.4,0);
			if animation_end()
			{
				state = "chase";
			}
		break;
	#endregion
	#region Hide
		case "hide":
			set_state_sprite(transformation, -0.4,4);
			if image_index == 0
			{
				state = "idle";
			}
		break;
	#endregion
	#region Attack
		case "attack":
			state = "chase";
		break;
	#endregion
	#region Knockback
		case "knockback":
			knockback_state(knockback_sprite, "stunt");
			alarm[1] = stunt_time;
		break;
	#endregion
	#region Stunt
		case "stunt":
			set_state_sprite(knockback_sprite,0,1);
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

//endle gravity 
event_inherited();















event_inherited();

