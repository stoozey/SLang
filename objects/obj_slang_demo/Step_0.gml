var _xAxis = (keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left));
if (_xAxis != 0)
{
	languageCodeIndex += _xAxis;
	var _totalCodes = array_length(languageCodes);
	if (languageCodeIndex >= _totalCodes)
		languageCodeIndex = 0;
	else if (languageCodeIndex < 0)
		languageCodeIndex = (_totalCodes - 1);
	
	var _languageCode = languageCodes[languageCodeIndex];
	slang_set_language_code(_languageCode);
}