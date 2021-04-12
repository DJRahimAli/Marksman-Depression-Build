/// @desc Move player towards center
layer_x(layerid, min(layer_get_x(layerid)+1.50,RES_W * 0.5 - 306));

//Progress Text
letters += spd;
text = string_copy(endtext[currentline],1,floor(letters));

//Next Line
if (letters >= length) && (keyboard_check_pressed(vk_anykey))
{
	if (currentline+1 == array_length_1d(endtext))
	{
		SlideTransition(TRANS_MODE.RESTART);
	}
	else
	{
		currentline++
		letters = 0;
		length = string_length(endtext[currentline]);
	}
}
