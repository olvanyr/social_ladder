if other.input.use && new_ability
{
	variable_global_set(ability,true);
	global.save[? string(ability)] = variable_global_get(ability);
	new_ability = false;
	showcase = true;
	ability = noone;
	//save_map();
}