#macro __SLANG_DEMO_TEXT_HEIGHT 20
#macro __SLANG_DEMO_TEXT_COLOUR 0x6cfe2e
#macro __SLANG_DEMO_BACKGROUND_COLOUR 0x491f2e

draw_set_font(fnt_slang_demo);

__languageCodeIndex = 0;
__languageCodes = slang_get_language_codes();

__set_language_code = function()
{
	var _languageCode = __languageCodes[__languageCodeIndex];
	slang_set_language(_languageCode);
}

__set_language_code();