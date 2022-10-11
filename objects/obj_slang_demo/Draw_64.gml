draw_text(0, 0, slang("demo_text_title"));
draw_text(0, (__SLANG_DEMO_TEXT_HEIGHT * 1), slang("demo_text_subtitle"));

draw_text(0, (__SLANG_DEMO_TEXT_HEIGHT * 3), slang("demo_text_insert_info"));
draw_text(0, (__SLANG_DEMO_TEXT_HEIGHT * 4), slang("demo_text_insert", [ slang_get_language_code() ]));

draw_text(0, (__SLANG_DEMO_TEXT_HEIGHT * 6), slang("demo_text_1"));
draw_text(0, (__SLANG_DEMO_TEXT_HEIGHT * 7), slang("demo_text_2"));