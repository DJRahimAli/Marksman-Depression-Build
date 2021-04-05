draw_self();

if instance_exists(oPlayer)
{
	if (oPlayer.flash > 0)
	{
		shader_set(shWhite);
		draw_self();
		shader_reset();
	}
}
