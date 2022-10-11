#macro SLANG_LANGUAGE_CODE_DEFAULT "en"		// The default language code used, this also means if a string is not found in another language then this one's string will be used instead
#macro SLANG_DIRECTORY ""					// if you aren't using the default, then this must end with a slash!

#macro SLANG_FILE_COMMENT_PREFIX "//"			// What must come at the start of a line to be considered a comment
#macro SLANG_FILE_TEXT_SEPARATOR ":"			// What must come inbetween the key and the text itself
#macro SLANG_FILE_INSERT_PREFIX "%"				// What is used to signify a variable being placed here (e.g "Hello %0")

#macro SLANG_REMOVE_NULL_TERMINATOR true	// When reading from a file there is an invisible character which serves no purpose inside of GM, this removes it from the final string

#macro SLANG_AUTO_LOAD_FILES true	// Automatically load all .slang files from SLANG_DIRECTORY upon project start

/*
	if no text can be found in the default language, this is what gets displayed instead
	if this is undefined, an error will be thrown instead
*/
#macro SLANG_NO_TEXT "MISSING TEXT"