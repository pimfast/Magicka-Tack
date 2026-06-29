/// @desc

if (fadeType == 0) {
	image_alpha -= fadeSpeed;
	if (image_alpha <= 0) {
		instance_destroy();
	}
}
if (fadeType == 1) {
	image_alpha += fadeSpeed;
	if (image_alpha >= 1) {
		audio_group_set_gain(ag_mus,1,0);
		room_goto(destination);
	}
}