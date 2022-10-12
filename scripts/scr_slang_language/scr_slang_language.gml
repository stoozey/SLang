///@desc Returns all the .slang language codes that are currently loaded in
///@returns {array} Array of language codes
function slang_get_language_codes()
{
	var _names = variable_struct_get_names(global.__slang_localizers);
	array_sort(_names, true);
	
	return _names;
}

///@desc Sets the currently active language code
function slang_set_language(_languageCode)
{
	global.__slang_language_code = _languageCode;
}

///@desc Returns the currently active language code
///@returns {string} Current language code
function slang_get_language()
{
	return global.__slang_language_code;
}