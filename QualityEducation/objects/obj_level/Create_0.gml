/// @desc

sprite_index = asset_get_index("spr_level"+string(associatedlevel));

if (global.levelsunlocked >= associatedlevel) {
	if (global.levelsunlocked == associatedlevel) {
		//you just unlocked this level
		//play animation?
	}
} else {
	//you didn't unlock this level yet
	instance_destroy();
}