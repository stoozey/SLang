var _guiWidth = display_get_gui_width();
var _guiHeight = display_get_gui_height();
draw_set_colour(__SLANG_DEMO_BACKGROUND_COLOUR);
	draw_rectangle(0, 0, _guiWidth, _guiHeight, false);
draw_set_colour(__SLANG_DEMO_TEXT_COLOUR);
draw_set_halign(fa_center);
	var _textX = (_guiWidth * 0.5);
	var _textY = (_guiHeight * 0.33);
	
	draw_text(_textX, _textY, slang("demo_text_title"));
	draw_text(_textX, (_textY + __SLANG_DEMO_TEXT_HEIGHT * 1), slang("demo_text_subtitle"));

	var _languageCode = slang_get_language();
	var _codeIndex = (__languageCodeIndex + 1);
	var _totalCodes = array_length(__languageCodes);
	var _inserts = [ _languageCode, _codeIndex, _totalCodes ];
	draw_text(_textX, (_textY + __SLANG_DEMO_TEXT_HEIGHT * 3), slang("demo_text_insert_info"));
	draw_text(_textX, (_textY + __SLANG_DEMO_TEXT_HEIGHT * 4), slang("demo_text_insert", _inserts));

	draw_text(_textX, (_textY + __SLANG_DEMO_TEXT_HEIGHT * 6), slang("demo_text_1"));
	draw_text(_textX, (_textY + __SLANG_DEMO_TEXT_HEIGHT * 7), slang("demo_text_2"));
draw_set_colour(c_white);