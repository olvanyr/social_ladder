
var seconds = global.play_time;
var minutes = 0;
var hours = 0;

while seconds >= 60
{
	seconds -= 60;
	minutes += 1;
}
while minutes>= 60
{
	minutes -=60;
	hours+= 1;
}

return (string(hours) + "h " + string(minutes) + "m  " + string(round(seconds)) + "s");