if (enemy_choice == noone && ds_list_size(enemy_hand) > 0)
{
	audio_play_sound(cardsound, 1, false);
    var _pick = irandom(ds_list_size(enemy_hand) - 1); //random enemy card
    enemy_choice = ds_list_find_value(enemy_hand, _pick);
    ds_list_delete(enemy_hand, _pick);

	//play the selected card
    enemy_choice.face_up = false;
    enemy_choice.target_x = room_width/2 - 35;
    enemy_choice.target_y = play_center_y - 60;
    enemy_choice.target_depth = -1000;

    alarm[1] = 30;
}