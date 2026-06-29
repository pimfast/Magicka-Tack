function hitbrick(damageAmount,targetBrick){
	if (targetBrick.object_index != obj_brick_invincible) && (targetBrick.object_index != obj_blockbrick_invincible) {
		targetBrick.hp -= damageAmount;
		obj_game.pnts += 10
		if (targetBrick.hp <= 0) {
			instance_destroy(targetBrick);
		} else {
			targetBrick.image_index -= 1;
		}
	}
}