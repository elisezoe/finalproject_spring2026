//show_debug_message(global.difficulty);

switch (global.STATE)
{
    case STATE.PLAYING:
{
   //misclick
    if (mouse_check_button_pressed(mb_left))
    {
        
        if (point_distance(mouse_x, mouse_y, play_center_x, play_center_y) < 100)
        {

            if (current_card != noone && current_card.face_index != 0)
            {
               // show_debug_message("MISCLICK");
                global.enemy_score++;
                audio_play_sound(roundlose, 1, false);

             //   round_active = false;
             //   global.STATE = STATE.RESET;
             // alarm[1] = 120;
            }
        }
    }
}
break;

   case STATE.JACK_REVEALED:
{
    if (!round_active) break;

    //player win
    if (mouse_check_button_pressed(mb_left))
    {
        if (point_distance(mouse_x, mouse_y, play_center_x, play_center_y) < 100)
        {
           // show_debug_message("PLAYER WINS");
            global.player_score++;
			audio_play_sound(roundwin, 1, false);

            round_active = false;
            global.STATE = STATE.RESET;
            alarm[1] = 120;

            exit;
        }
    }

    
    reaction_timer--;
    enemy_react_time--;

    //enemy win
    if (enemy_react_time <= 0)
    {
      //  show_debug_message("ENEMY WINS");
        global.enemy_score++;
		
		
		audio_play_sound(roundlose, 1, false);
		
		enemy_slap_timer = 30;

		if (current_card != noone)
		{
		enemy_slap_x = current_card.x + 30;
		enemy_slap_y = current_card.y;
		}

        round_active = false;
        global.STATE = STATE.RESET;
        alarm[1] = 120;

        exit;
    }

    //no winner
    if (reaction_timer <= 0)
    {
     //   show_debug_message("TOO SLOW");
        global.enemy_score++;
		audio_play_sound(roundlose, 1, false);

        round_active = false;
        global.STATE = STATE.RESET;
        alarm[1] = 120;

        exit;
    }
}
break;

    case STATE.RESET:
        
    break;
}


if (enemy_slap_timer > 0)
{
    enemy_slap_timer--;
}