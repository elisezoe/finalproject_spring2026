if (abs(depth-target_depth) > 1)
{
	depth = lerp(depth,target_depth,0.1);
}
else{
depth = target_depth;
}

//set face based on index
if(face_index == 0) sprite_index = spr_yellow;
if(face_index == 1) sprite_index = spr_blue;
if(face_index == 2) sprite_index = spr_orange;

//show back if not face up
if(face_up == false) sprite_index = spr_card;

//draw sprite
draw_sprite(sprite_index, image_index,x,y);