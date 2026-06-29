/// @desc

//destroy self if outside room
if (x > room_width+sprite_width) || (x < 0-sprite_width) || (y > room_height+sprite_height) || (y < 0-sprite_height) {
	instance_destroy();
}

//bump sideways
var _collision = instance_place(x+hsp,y,obj_brickparent_omega);
if (_collision) {
	while (!place_meeting(x+sign(hsp),y,obj_brickparent_omega)) {
		x += sign(hsp);
	}
	audio_play_sound(sfx_select,0,0);
	hitbrick(dmg,_collision);
	hsp *= -1;
}
//bump vertical
_collision = instance_place(x,y+vsp,obj_brickparent_omega);
if (_collision) {
	while (!place_meeting(x,y+sign(vsp),obj_brickparent_omega)) {
		y += sign(vsp);
	}
	audio_play_sound(sfx_select,0,0,1,0,1.5);
	hitbrick(dmg,_collision);
	vsp *= -1;
}

//apply movement
x += hsp;
y += vsp;