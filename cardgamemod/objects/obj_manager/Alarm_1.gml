
for (var i = ds_list_size(center_pile) - 1; i >= 0; i--)
{
    var _card = ds_list_find_value(center_pile, i);
    ds_list_add(return_queue, _card);
}
ds_list_clear(center_pile);


if (current_card != noone)
{
    ds_list_add(return_queue, current_card);
    current_card = noone;
}

//discard
for (var i = ds_list_size(discard) - 1; i >= 0; i--)
{
    var _card = ds_list_find_value(discard, i);
    ds_list_add(return_queue, _card);
}
ds_list_clear(discard);

return_stack_index = 0;
alarm[2] = 10;