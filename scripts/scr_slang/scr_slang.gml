#macro LOCALIZATION_LANGUAGE_DEFAULT "en"
#macro LOCALIZATION_FILE_EXT "sloz"
#macro LOCALIZATION_DIR (DIR_RESOURCES + "lang/")
#macro LOCALIZATION_DIR_WORKSHOP (DIR_STEAM_WORKSHOP + "lang/")

global.__language = LOCALIZATION_LANGUAGE_DEFAULT;
global.__localizers = { };
global.__languages_with_custom_fonts = ds_list_create();
ds_list_add(global.__languages_with_custom_fonts, "jp");

function font_name(_font, _language = CONFIG.language)
{
	if (ds_list_find_index(global.__languages_with_custom_fonts, _language) == -1) _language = LOCALIZATION_LANGUAGE_DEFAULT;

	return (_font + "_" + _language);
}

function font_get(_name, _language = CONFIG.language)
{
	return asset_get_index(font_name(_name, _language));
}

function localizer_get(_language)
{
	var _localizer = global.__localizers[$ _language];
	if (!is_undefined(_localizer)) return _localizer;
	
	var _filename = (LOCALIZATION_DIR + _language + "." + LOCALIZATION_FILE_EXT);
	if (!file_exists(_filename))
	{
		_filename = (LOCALIZATION_DIR_WORKSHOP + _language + "." + LOCALIZATION_FILE_EXT);
		if (!file_exists(_filename))
		{
			if (_language == LOCALIZATION_LANGUAGE_DEFAULT)
			throw ("Default language (" + _language + " @" + _filename + ") doesn't exist");
		
			return localizer_get(LOCALIZATION_LANGUAGE_DEFAULT);
		}
	}
	
	var _localizer = new Localizer();
	_localizer.load(_filename);
	global.__localizers[$ _language] = _localizer;
	
	return _localizer;
}


function gettext(_key, _language = CONFIG.language)
{
	var _localizer = localizer_get(_language);
	var _text = _localizer.get_text(_key);
	if (!is_undefined(_text)) return _text;
	
	if (_language == LOCALIZATION_LANGUAGE_DEFAULT)
		throw "Text (" + _key + ") doesn't exist";
	
	var _defaultLocalizer = localizer_get(LOCALIZATION_LANGUAGE_DEFAULT);
	return _defaultLocalizer.get_text(_key);
}

function Localizer() constructor
{
	static load = function(_filename)
	{
		text = { };
		
		var _file = file_text_open_read(_filename);
			while (!file_text_eof(_file))
			{
				var _text = file_text_readln(_file);
				_text = string_replace_all(_text, "\n", "");
				_text = string_replace_all(_text, "\\n", "\n");
				
				if ((_text == "") || (string_copy(_text, 1, 2) == "//")) continue;
				
				var _keySplitterPos = string_pos_ext(":", _text, 1);
				var _keyLength = (_keySplitterPos - 2);
				var _key = string_copy(_text, 1, _keyLength);
				
				var _messagePos = (_keySplitterPos + 2);
				var _messageLength = (string_length(_text) - _messagePos + 1);
				var _message = string_copy(_text, _messagePos, _messageLength);
				
				text[$ _key] = _message;
			}
		file_text_close(_file);
	}
	
	static cleanup = function()
	{
		delete text;
	}
	
	static get_text = function(_key)
	{
		return text[$ _key];
	}
	
	text = { };
}