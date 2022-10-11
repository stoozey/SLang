var _guiWidth = display_get_gui_width();
var _guiHeight = display_get_gui_height();
draw_set_colour(__SLANG_DEMO_BACKGROUND_COLOUR);
	draw_rectangle(0, 0, _guiWidth, _guiHeight, false);
draw_set_colour(__SLANG_DEMO_TEXT_COLOUR);
	var _textX = (_guiWidth * 0.5);
	var _textY = (_guiHeight * 0.33);
	draw_set_halign(fa_center);
	
	draw_text(_textX, _textY, slang("demo_text_title"));
	draw_text(_textX, (_textY + __SLANG_DEMO_TEXT_HEIGHT * 1), slang("demo_text_subtitle"));

	draw_text(_textX, (_textY + __SLANG_DEMO_TEXT_HEIGHT * 3), slang("demo_text_insert_info"));
	draw_text(_textX, (_textY + __SLANG_DEMO_TEXT_HEIGHT * 4), slang("demo_text_insert", [ slang_get_language_code() ]));

	draw_text(_textX, (_textY + __SLANG_DEMO_TEXT_HEIGHT * 6), slang("demo_text_1"));
	draw_text(_textX, (_textY + __SLANG_DEMO_TEXT_HEIGHT * 7), slang("demo_text_2"));
draw_set_colour(c_white);