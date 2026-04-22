
var _spr;

switch (face_index)
{
    case 0: _spr = spr_harry; break;
    case 1: _spr = spr_liam; break;
    case 2: _spr = spr_niall; break;
    case 3: _spr = spr_zayn; break;
    case 4: _spr = spr_louis; break;
    default: _spr = spr_card; break;
}

if (!face_up)
{
    _spr = spr_card;
}

draw_sprite(_spr, 0, x, y);