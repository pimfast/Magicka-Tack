/// @desc bounce balls

var _deflectForce = 1; //force multiplier when attacking in the opposite direction of the ball
var _extraForce = 1.5; //force multiplier when attacking in the direction of the ball

var _baseSpeed = 1.8 //minimum speed

var _hitBall = instance_place(x,y,obj_ball);
if (_hitBall) && (!array_contains(ballsTouched,_hitBall.id)) {
	if ((instance_number(obj_brickparent_vulnerable) >= 1)) {
		array_push(ballsTouched,_hitBall.id);
		switch (dir) {
			case "north":
				if (sign(_hitBall.vsp) == 1) {
					_hitBall.vsp *= -_deflectForce;
				} else {
					//minimum speed
					if (_hitBall.vsp >= -_baseSpeed) {
						_hitBall.vsp = -_baseSpeed;
					} else {
						//apply bonus speed
						_hitBall.vsp *= _extraForce;
					}
				}
				break;
			case "south":
				if (sign(_hitBall.vsp) == 1) {
					//minimum speed
					if (_hitBall.vsp <= _baseSpeed) {
						_hitBall.vsp = _baseSpeed;
					} else {
						//apply bonus speed
						_hitBall.vsp *= _extraForce;
					}
				} else {
					_hitBall.vsp *= -_deflectForce;
				}
				break;
			case "east":
				if (sign(_hitBall.hsp) == 1) {
					//minimum speed
					if (_hitBall.hsp <= _baseSpeed) {
						_hitBall.hsp = _baseSpeed;
					} else {
						//apply bonus speed
						_hitBall.hsp *= _extraForce;
					}
				} else {
					_hitBall.hsp *= -_deflectForce;
				}
				break;
			case "west":
				if (sign(_hitBall.hsp) == 1) {
					_hitBall.hsp *= -_deflectForce;
				} else {
					//minimum speed
					if (_hitBall.hsp >= -_baseSpeed) {
						_hitBall.hsp = -_baseSpeed;
					} else {
						//apply bonus speed
						_hitBall.hsp *= _extraForce;
					}
				}
				break;
		}
	} else {
		//there's no bricks anymore. we will now smash the ball
		audio_play_sound(sfx_crack,0,0);
		obj_game.pnts += 25
		for (var _i = 0; _i < 100; _i++) { 
			instance_create_layer(_hitBall.x,_hitBall.y,"Instances",obj_balldebris);
		}
		instance_destroy(_hitBall);
	}
}

//destroy self when finished
if (image_index >= image_number -1) {
	instance_destroy();
}