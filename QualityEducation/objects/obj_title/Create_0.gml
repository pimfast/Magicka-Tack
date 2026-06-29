/// @desc

audio_group_stop_all(ag_mus);

//fade in
var _transition = instance_create_depth(0,0,-100,obj_transition);
_transition.image_alpha = 1;
_transition.fadeType = 0;

audio_play_sound(mus_fireplace,0,1);

if (global.levelsunlocked >= 2) {
	selectedoption = 0;
} else {
	selectedoption = 2;
}
caninput = true;