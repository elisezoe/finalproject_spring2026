if (position_meeting(mouse_x, mouse_y, id))
{
    target_y = base_y + hover_offset;
}
else
{
    target_y = base_y;
}

y = lerp(y, target_y, 0.2);