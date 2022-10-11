show_debug_message("SLang v" + __SLANG_VERSION + " - https://github.com/stoozey/SLang - by @stoozey_");

global.__slang_language_code = SLANG_LANGUAGE_CODE_DEFAULT;
global.__slang_localizers = { };

if (SLANG_AUTO_LOAD_FILES)
{
	var _file = file_find_first((SLANG_DIRECTORY + "*." + __SLANG_FILE_EXTENSION), fa_directory);
	while (_file != "")
	{
		var _languageCode = string_replace_all(_file, "." + __SLANG_FILE_EXTENSION, "");
	    __slang_localizer_get(_languageCode);
	
	    _file = file_find_next();
	}
    
	file_find_close();
}