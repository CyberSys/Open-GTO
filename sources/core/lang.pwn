/*

	About: lang load system
	Author: ziggi

*/

#if defined _lang_included
	#endinput
#endif

#define _lang_included

/*
	Vars
*/

static
	gLang[Lang];

new
	Iterator:LangIterator<sizeof(gLang)>;

const
	LANGS_COUNT = sizeof(gLang);

/*
	Forwards
*/

forward Lang:_Lang_Load(const code[], const name[]);

/*
	OnGameModeInit
*/

Lang_OnGameModeInit()
{
	gLang[LangEN] = _Lang_Load("en", "English");
	gLang[LangRU] = _Lang_Load("ru", "Russian");

	Lang_SetDefaultLang(gLang[LangEN]);

	new rcon_command[9 + (MAX_LANG_CODE + 1) * sizeof(gLang) + 1] = "language ";
	strcat(rcon_command, Lang_ReturnCodes(.isuppercase = true));
	SendRconCommand(rcon_command);

	Log_Init("core", "Lang module init.");
}

stock Lang_ReloadAll()
{
	foreach (new Lang:lang : LangIterator) {
		Lang_Reload(lang);
		Log(mainlog, INFO, "SERVER: Language reloaded (%s).", Lang_ReturnName(lang));
	}
}

/*
	Lang functions
*/

static stock Lang:_Lang_Load(const code[], const name[])
{
	new
		Lang:lang,
		filename[MAX_LANG_FILENAME];

	lang = Lang_Add(code, name);
	if (lang == INVALID_LANG_ID) {
		return INVALID_LANG_ID;
	}

	Iter_Add(LangIterator, _:lang);

	for (new i = 0; name[i] != '\0'; i++) {
		filename[i] = tolower(name[i]);
	}
	format(filename, sizeof(filename), "%slang_%s" DATA_FILES_FORMAT, db_lang, filename);

	Lang_LoadFile(lang, filename);

	Log(mainlog, INFO, "SERVER: %s language loaded (id: %d, code: %s).", name, _:lang, code);
	return lang;
}
