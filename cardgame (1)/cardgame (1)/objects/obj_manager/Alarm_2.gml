//return
if (ds_list_size(return_queue) > 0)
{
    audio_play_sound(cardsound, 1, false);

    var _card = ds_list_find_value(return_queue, 0);
    ds_list_delete(return_queue, 0);

    var _idx = return_stack_index;

    
    _card.target_x = deck_x;
    _card.target_y = deck_y - (_idx * 2);
    _card.face_up = false;
    _card.depth = -_idx;

    return_stack_index++;

    alarm[2] = 10;
}
else
{
   //reshuffle
    ds_list_clear(deck);

    with (obj_card)
    {
        ds_list_add(other.deck, id);
    }

    ds_list_shuffle(deck);
//restack
    for (var i = 0; i < ds_list_size(deck); i++)
    {
        var _card = ds_list_find_value(deck, i);

        _card.target_x = deck_x;
        _card.target_y = deck_y - (i * 2);
        _card.face_up = false;
        _card.depth = -i;
    }

    //restart
    round_active = false;
    global.STATE = STATE.PLAYING;
    alarm[0] = 90;
}