/// @desc Health Bar
draw_sprite_ext(
sHealthBarBackground,
0,
healthbarx,
healthbary,
2,
2,
0,
c_white,
1
);

drawnhp = lerp(drawnhp,currenthp,0.2);

draw_sprite_stretched_ext(
sHealthBar,
0,
healthbarx,
healthbary,
(drawnhp/hp)*healthbarwidth,
healthbarheight,
MakeColorHSVTransition(drawnhp, hp, 0, 100, 255, 255, 255, 255),
1
);

draw_sprite_ext(
sHealthBarBorder,
0,
healthbarx,
healthbary,
2,
2,
0,
c_white,
1
);
