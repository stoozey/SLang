#macro __SLANG_DEMO_TEXT_HEIGHT 20
#macro __SLANG_DEMO_TEXT_COLOUR 0x6cfe2e
#macro __SLANG_DEMO_BACKGROUND_COLOUR 0x491f2e

draw_set_font(fnt_slang_demo);

__languageCodeIndex = 0;
__languageCodes = slang_get_language_codes();

/*
 * if the number of languages codes is 0
 * that means on startup we must have never found any valid files (assuming SLANG_AUTO_LOAD_FILES is enabled)
 * for simplicity sake, just throw here if that happens
*/
if (array_length(__languageCodes) == 0) {
    throw "No language files loaded";
}

__set_language_code = function(_index)
{
    __languageCodeIndex = _index;
	var _languageCode = __languageCodes[__languageCodeIndex];
	slang_set_language(_languageCode);
}

__set_language_code(0);