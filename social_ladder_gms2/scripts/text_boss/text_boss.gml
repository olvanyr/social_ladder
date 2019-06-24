///@ description do the hand righting things and make multiple lines
/// @arg next_state

letters_count += letter_speed;
line_part = string_copy(line,1,letters_count);

if letters_count >= string_length(line) + time_bettween_line && next_line < array_length_1d(lines) -1 || (letters_count >= string_length(line) && next_line < array_length_1d(lines) -1 && oInput.attack)
{
	letters_count = 0;
	next_line ++;
}

if next_line >= array_length_1d(lines) -1
{
	
	if instance_exists(oPlayer) oPlayer.state = "move";
	
	next_line = 0;
	letters_count = 0;
	state = argument0;
	
}

line = lines[next_line];
