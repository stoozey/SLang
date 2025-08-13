var _xAxis = (keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left));
if (_xAxis == 0) exit;
    
var _index = (__languageCodeIndex + _xAxis);
var _totalCodes = array_length(__languageCodes);
if (_index >= _totalCodes)
    _index = 0;
else if (_index < 0)
    _index = (_totalCodes - 1);

__set_language_code(_index);