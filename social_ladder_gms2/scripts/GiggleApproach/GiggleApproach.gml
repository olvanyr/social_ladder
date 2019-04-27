/// @description approach(current,target,amount)
/// @arg current
/// @arg target
/// @arg amount

// exemple use : x = approach(x, taget_x, 2);

var current = argument0;
var target = argument1;
var amount = argument2;

if (current < target)
{
	current = min(current + amount, target);
}else
{
	current = max(current - amount, target);
}
return current;