function Localizer() constructor
{
	static load = function(_filename)
	{
		__text = { };
		
		var _commentPrefixLength = string_length(SLANG_FILE_COMMENT_PREFIX);
		var _whitespaceCharsLength = string_length(__SLANG_WHITESPACE_CHARACTERS);
		var _file = file_text_open_read(_filename);
			while (!file_text_eof(_file))
			{
				var _text = file_text_readln(_file);
				_text = string_replace_all(_text, "\n", "");
				_text = string_replace_all(_text, "\\n", "\n");
				
				if (SLANG_REMOVE_NULL_TERMINATOR)
					_text = string_copy(_text, 1, string_length(_text) - 1);
				
				if ((_text == "") || (string_copy(_text, 1, _commentPrefixLength) == SLANG_FILE_COMMENT_PREFIX)) continue;
				
				var _keySplitterPos = string_pos_ext(SLANG_FILE_TEXT_SEPARATOR, _text, 1);
				var _keyLength = (_keySplitterPos - 1);
				var _key = string_copy(_text, 1, _keyLength);
				var i = 0;
				repeat (_whitespaceCharsLength)
					_key = string_replace_all(_key, string_char_at(__SLANG_WHITESPACE_CHARACTERS, ++i), "");
				
				var _messagePos = (_keySplitterPos + 1);
				var _messageLength = (string_length(_text) - _messagePos + 1);
				var _message = string_copy(_text, _messagePos, _messageLength);
				while ((string_length(_message) > 1) && (string_pos(string_char_at(_message, 1), __SLANG_WHITESPACE_CHARACTERS) != 0))
				{
					_message = string_delete(_message, 1, 1);
				}
				
				__text[$ _key] = _message;
			}
		file_text_close(_file);
	}
	
	static get_text = function(_key)
	{
		return __text[$ _key];
	}
	
	__text = { };
}