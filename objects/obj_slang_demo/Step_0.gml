var _xAxis = (keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left));
if (_xAxis != 0)
{
	__languageCodeIndex += _xAxis;
	var _totalCodes = array_length(__languageCodes);
	if (__languageCodeIndex >= _totalCodes)
		__languageCodeIndex = 0;
	else if (__languageCodeIndex < 0)
		__languageCodeIndex = (_totalCodes - 1);
	
	__set_language_code();
}