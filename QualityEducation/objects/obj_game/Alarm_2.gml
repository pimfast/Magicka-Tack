/// @desc tally balls

if (ballsRemaining >= 1) {
	ballsRemaining -= 1;
	pnts += 50;
	alarm[2] = (0.5 * game_get_speed(gamespeed_fps));
} else {
	alarm[1] = (0.5 * game_get_speed(gamespeed_fps));
}