///@desc The same as slang_raw, but with optional variable insert support
///@param {string} key The key used in the localization file
///@param {array} [inserts An array of variables to be inserted (using the SLANG_FILE_INSERT_PREFIX operator)
///@param {string} languageCode] Overrides the current active language code
function slang(_key, _inserts = undefined, _languageCode = global.__slang_language_code)
{
	var _raw = slang_raw(_key, _languageCode);
	if (_inserts == undefined) return _raw;
	
	var _insertPrefixLength = string_length(SLANG_FILE_INSERT_PREFIX);
	var _totalInserts = array_length(_inserts);
	
	var _insertIndex = 0;
	var _pos = string_pos(SLANG_FILE_INSERT_PREFIX, _raw);
	while ((_pos != 0) && (_pos <= string_length(_raw)))
	{
		var _slashPos = (_pos - 1);
		if (string_char_at(_raw, _slashPos) == "\\")
		{
			_raw = string_delete(_raw, _slashPos, 1);
		}
		else
		{
			var _insert = ((_insertIndex < _totalInserts) ? string(_inserts[_insertIndex++]) : "");
			_raw = string_delete(_raw, _pos, _insertPrefixLength);
			_raw = string_insert(_insert, _raw, _pos);
		}
		
		_pos = string_pos_ext(SLANG_FILE_INSERT_PREFIX, _raw, _pos);
	}
	
	return _raw;
}

///@desc Finds a string from the .slang file by key
///@param {string} key The key used to represent the text data in the .slang file
///@param {string} [languageCode] Overrides the current active language code
function slang_raw(_key, _languageCode = global.__slang_language_code)
{
	var _localizer = __slang_localizer_get(_languageCode);
	var _text = _localizer.get_text(_key);
	if (_text != undefined) return _text;
	
	if (_languageCode == SLANG_LANGUAGE_CODE_DEFAULT)
	{
		if (SLANG_NO_TEXT == undefined)
			throw "Text (" + _key + ") doesn't exist";
		
		return SLANG_NO_TEXT;
	}
	
	var _defaultLocalizer = __slang_localizer_get(SLANG_LANGUAGE_CODE_DEFAULT);
	return _defaultLocalizer.get_text(_key);
}