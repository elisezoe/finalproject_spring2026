if (global.STATE != STATE.PLAYING) exit;

if (ds_list_size(deck) > 0)
{
   var _card = ds_list_find_value(deck, ds_list_size(deck) - 1);
ds_list_delete(deck, ds_list_size(deck) - 1);

audio_play_sound(cardsound, 1, false);

current_card = _card;


ds_list_add(center_pile, _card);


var _idx = ds_list_size(center_pile) - 1;

_card.target_x = play_center_x;
_card.target_y = play_center_y - (_idx * 2);

_card.depth = -1000 - _idx;

_card.face_up = true;

    //enemy's chance to click
    if (_card.face_index == 0)
    {
        show_debug_message("JACK!");

        global.STATE = STATE.JACK_REVEALED;

        reaction_timer = player_react_window;
		enemy_react_time = irandom_range(enemy_min_react, enemy_max_react);

        round_active = true;

        exit;
    }

    
    alarm[0] = 90;
}
else
{
    global.STATE = STATE.RESET;
    alarm[1] = 120;
}