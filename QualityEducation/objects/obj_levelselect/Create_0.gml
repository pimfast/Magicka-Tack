/// @desc

audio_group_stop_all(ag_mus);

//fade in
var _transition = instance_create_depth(0,0,-100,obj_transition);
_transition.image_alpha = 1;
_transition.fadeType = 0;

selectedlevel = instance_position(obj_player_levelselect.x,obj_player_levelselect.y,obj_level);
caninput = true;