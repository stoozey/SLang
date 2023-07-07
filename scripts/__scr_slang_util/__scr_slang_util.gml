function __slang_print()
{
	var _string = "########## SLang: ";
    var _i = 0;
    repeat(argument_count)
    {
        _string += string(argument[_i]);
        ++_i;
    }
    
    show_debug_message(_string);
}

function __slang_localizer_get(_language)
{
	var _localizer = global.__slang_localizers[$ _language];
	if (_localizer != undefined) return _localizer;
	
	var _filename = (SLANG_DIRECTORY + _language + "." + __SLANG_FILE_EXTENSION);
	if (!file_exists(_filename))
	{
		if (_language == SLANG_LANGUAGE_CODE_DEFAULT)
			throw ("Default language (" + _language + " @" + _filename + ") doesn't exist");
		
		__slang_print("SLang file not found for language code \"", _language, "\"--using default");
		return __slang_localizer_get(SLANG_LANGUAGE_CODE_DEFAULT);
	}
	
	__slang_print("loading localizer for language: ", _language);
	var _localizer = new Localizer();
	_localizer.load(_filename);
	global.__slang_localizers[$ _language] = _localizer;
	
	return _localizer;
}