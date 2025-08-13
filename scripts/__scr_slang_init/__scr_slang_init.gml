show_debug_message("SLang v" + __SLANG_VERSION + " - https://github.com/stoozey/SLang - by @stoozey_");

// slash char
var _slashChar = ((os_type == os_windows) ? "\\" : "/");
global.__slang_slash_char = _slashChar;

// cache slang directory ensuring it ends with a slash
var _slangDirectory = SLANG_DIRECTORY;
if ((SLANG_AUTO_INSERT_DIRECTORY_SLASH) && (_slangDirectory != "") && (!string_ends_with(_slangDirectory, _slashChar))) {
    _slangDirectory = string_insert(_slashChar, _slangDirectory, string_length(_slangDirectory));
}

__slang_print($"slang directory is {_slangDirectory}");
global.__slang_directory = _slangDirectory;

// localizers
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