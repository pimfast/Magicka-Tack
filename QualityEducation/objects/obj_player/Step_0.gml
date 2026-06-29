/// @desc

image_speed = 0;

if (dash == true) {
	walkSpd = 1.5
} else {
	walkSpd = defWalkSpd;
}

var _up = 0;
var _down = 0;
var _left = 0;
var _right = 0;
var _attack = 0;
var _strafe = 0;
var _launch = 0;
if (caninput) {
	if (canmove) {
		_up = keyboard_check(vk_up);
		_down = keyboard_check(vk_down);
		_left = keyboard_check(vk_left);
		_right = keyboard_check(vk_right);
		_strafe = keyboard_check(vk_lshift);
	}
	if (canhit) {
		_attack = keyboard_check(vk_space);
		if (!_attack) {
			_attack = keyboard_check(vk_enter);
		}
		if (!_attack) {
			_attack = keyboard_check(ord("Z"));
		}
	}
	if (canball) {
		_launch = keyboard_check_pressed(ord("B"));
	}
}

//launch ball
if (_launch) && (obj_game.ballsRemaining >= 1) {
	var _newBall = instance_create_layer(x+(sprite_width/2),y+(sprite_height/2),"Instances",obj_ball);
	
	//choose between going left or right so nothing goes exactly straight
	var _leftorright = irandom(1);
	if (_leftorright) {
		_newBall.hsp = random_range(-1.5,-0.1);
		_newBall.vsp = random_range(-1.5,-0.1);
	} else {
		_newBall.hsp = random_range(0.1,1.5);
		_newBall.vsp = random_range(0.1,1.5);
	}
	
	if (dir == "north") {
		_newBall.vsp = -1.8;
	}
	if (dir == "south") {
		_newBall.vsp = 1.8;
	}
	if (dir == "east") {
		_newBall.hsp = 1.8;
	}
	if (dir == "west") {
		_newBall.hsp = -1.8;
	}
	
	obj_game.ballsRemaining -= 1;
}

//100% friction
hsp = 0;
vsp = 0;

//move & change directions & animate
if (_strafe) && (global.skills[1] == true) {
	if (_up) {
		vsp -= walkSpd;
		image_speed = 1;
	}
	if (_down) {
		vsp += walkSpd;
		image_speed = 1;
	}
	if (_left) {
		hsp -= walkSpd;
		image_speed = 1;
	}
	if (_right) {
		hsp += walkSpd;
		image_speed = 1;
	}
} else {
	if (_up) {
		dir = "north";
		vsp -= walkSpd;
		sprite_index = spr_knight_north;
		image_speed = 1;
	}
	if (_down) {
		dir = "south";
		vsp += walkSpd;
		sprite_index = spr_knight_south;
		image_speed = 1;
	}
	if (_left) {
		dir = "west";
		hsp -= walkSpd;
		sprite_index = spr_knight_west;
		image_speed = 1;
	}
	if (_right) {
		dir = "east";
		hsp += walkSpd;
		sprite_index = spr_knight_east;
		image_speed = 1;
	}
}

//bump sideways
var _collision = instance_place(x+hsp,y,obj_collision);
if (_collision) {
	while (!place_meeting(x+sign(hsp),y,obj_collision)) {
		x += sign(hsp);
	}
	hsp = 0;
}
//bump vertical
_collision = instance_place(x,y+vsp,obj_collision);
if (_collision) {
	while (!place_meeting(x,y+sign(vsp),obj_collision)) {
		y += sign(vsp);
	}
	vsp = 0;
}

x += hsp;
y += vsp;

//attack
if (_attack) && (global.skills[0] == true) {
	if (alarm[1] == -1) && (dash == false) && (currentlyattacking == false) {
			if (canattack) {
			var _newSlash = instance_create_layer(x+sprite_width/2,y+sprite_height/2,"Instances",obj_slash);
			switch (dir) {
				case "north":
					_newSlash.sprite_index = spr_slash_north;
					_newSlash.dir = "north";

					break;
				case "south":
					_newSlash.sprite_index = spr_slash_south;
					_newSlash.dir = "south";

					break;
				case "east":
					_newSlash.sprite_index = spr_slash_east;
					_newSlash.dir = "east";

					break;
				case "west":
					_newSlash.sprite_index = spr_slash_west;
					_newSlash.dir = "west";

					break;
			}
			canattack = false;
			canmove = false;
			canball = false;
			alarm[0] = (0.3 * game_get_speed(gamespeed_fps));
			if (global.skills[2] == true) {
				alarm[1] = (0.3 * game_get_speed(gamespeed_fps));
			}
		}
	}
	currentlyattacking = true;
} else {
	alarm[1] = -1;
	currentlyattacking = false;
	dash = false;
}