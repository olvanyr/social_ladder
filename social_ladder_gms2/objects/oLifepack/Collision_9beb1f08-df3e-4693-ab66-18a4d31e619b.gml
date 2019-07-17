if other.input.use && other.healthpack < 3
{
	other.healthpack += healthpack;
	other.healthpack = min(other.healthpack,3);
	healthpack = 0;
}

draw = true;