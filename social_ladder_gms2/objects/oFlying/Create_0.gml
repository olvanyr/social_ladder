// Inherit the parent event
event_inherited();

hp = 8;
max_hp = hp;

direction = random(360);
speed = 0;

state = "idle";
fov = 150;
ybuffer = sprite_get_height(sPlayer_mask);
stun_time = 20;
experience = 1;

// save and load

once = true; //use to make the sav script happen only once when the enemy is dead


save_x = string(id) + string(save.x);
save_y = string(id) + string(save.y);
save_state = string(id) + string(save.state);


if global.save[?save_state] == "dead"
{
	state = global.save[?save_state];
	x = global.save[?save_x];
	y = global.save[?save_y];
}else set_enemies_map();