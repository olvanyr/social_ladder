///@desc load data

switch (global.slot)
{
case 1: 
	var slot = "save1.json";
break;
case 2: 
	var slot = "save2.json";
break;
case 3: 
	var slot = "save3.json";
break;

}

if file_exists(slot)
{
	var file = file_text_open_read(slot);
	var json = "";

	while(!file_text_eof(file))
	{
		json += file_text_readln(file);
	}

	file_text_close(file);

	load_instances(json);
}else 
{
	global.date = 0;
	global.experience = 0;
	global.play_time = 0;
	
	global.double_jump = 0;
	global.wall_jump = 0;
	global.cast = 0;
	
	global.key = noone;

}