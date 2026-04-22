

switch(global.STATE)
{
case STATE.DEALING:
break;
case STATE.CHOOSE:
    if (in_player_hand)
    {
        if (position_meeting(mouse_x, mouse_y, id))
        {
            target_y = obj_manager.hand_y - 20;

            if (mouse_check_button_pressed(mb_left))
            {
                face_up = true;
                in_player_hand = false;
                obj_manager.player_choice = id;

                target_x = room_width/2 - 35;
                target_y = obj_manager.play_center_y + 50;
                target_depth = -1000;

                var _idx = ds_list_find_index(obj_manager.player_hand, id);
                if (_idx != -1)
                    ds_list_delete(obj_manager.player_hand, _idx);
            }
        }
        else
        {
            target_y = obj_manager.hand_y;
        }
    }
break;
case STATE.COMPARE:
break;
case STATE.RESOLVE:
break;
case STATE.RESHUFFLE:
break;	
}

//lerp to target position
if(abs(x-target_x) > 1)
{
	x = lerp(x,target_x,0.1);
}
else
{
	x = target_x;
}

if(abs(y-target_y) > 1)
{
	y = lerp(y,target_y,0.1);
}
else
{
	y = target_y;
}



