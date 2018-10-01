/*

	About: player account login system
	Author:	ziggi

*/

#if defined _pl_account_included
	#endinput
#endif

#define _pl_account_included

/*
	Defines
*/

#if MAX_PLAYER_LOGIN_ATTEMPT > 255
	#error MAX_PLAYER_LOGIN_ATTEMPT should be lower than 255
#endif

/*
	Vars
*/

static
	gAccount[MAX_PLAYERS][e_Account_Info],
	bool:gIsAfterRegistration[MAX_PLAYERS],
	gLoginAttempt[MAX_PLAYERS char];

/*
	Config
*/

stock Account_LoadConfig(file_config)
{
	ini_getString(file_config, "Account_DB", db_account);
}

stock Account_SaveConfig(file_config)
{
	ini_setString(file_config, "Account_DB", db_account);
}

/*
	Save
*/

stock Account_Save(playerid)
{
	if (!IsPlayerLogin(playerid)) {
		return 0;
	}

	new
		playername[MAX_PLAYER_NAME + 1];

	GetPlayerName(playerid, playername, sizeof(playername));

	Account_SaveData(playername, gAccount[playerid]);
	return 1;
}

/*
	Register
*/

stock Account_Register(playerid, const password[])
{
	// set default data
	Account_SetPassword(playerid, password);
	Account_SetRegistrationTime(playerid, gettime());
	Account_SetLoginTime(playerid, gettime());
	Account_SetPlayedTime(playerid, 0);
	Account_SetAfterRegistration(playerid, true);
	Account_UpdateIP(playerid);

	new playername[MAX_PLAYER_NAME + 1];
	GetPlayerName(playerid, playername, sizeof(playername));

	// create account and player
	Account_SaveData(playername, gAccount[playerid]);
	Player_Create(playerid);

	// login
	Player_Login(playerid);

	Lang_SendText(playerid, "ACCOUNT_SUCCESS_REGISTER");
	Log(mainlog, INFO, "Player: account created for %s [id: %d]", playername, playerid);
	return 1;
}

/*
	Login
*/

stock Account_Login(playerid, const password[])
{
	new
		result[e_Account_Info],
		playername[MAX_PLAYER_NAME + 1],
		password_copy[MAX_PASS_LEN];

	GetPlayerName(playerid, playername, sizeof(playername));
	strcpy(password_copy, password);

	// get data
	Account_LoadData(playername, result);

	// check password
#if defined PASSWORD_ENCRYPT_ENABLED
	SHA256_PassHash(password, result[e_aPasswordSalt], password_copy, PASSWORD_HASH_LENGTH);
#endif

	if (strcmp(password_copy, result[e_aPassword], false)) {
		Log(mainlog, INFO, "Player: login failed, incorrect password by %s [id: %d]", playername, playerid);

		AddLoginAttempt(playerid);

		if (IsLoginAttemptsEnded(playerid)) {
			Lang_SendText(playerid, "ACCOUNT_AUTO_KICK");
			new reason[MAX_LANG_VALUE_STRING];
			Lang_GetPlayerText(playerid, "ACCOUNT_INCORRECT_PASSWORD", reason);
			KickPlayer(playerid, reason);
		} else {
			Dialog_Show(playerid, Dialog:AccountLogin);
		}
		return 0;
	}

	// set data
	Account_SetData(playerid, result);
	Account_SetLoginTime(playerid, gettime());
	Account_UpdateIP(playerid);

	// some actions
	ResetLoginAttempt(playerid);

	// login player
	Player_Login(playerid);
	return 1;
}

/*
	Account_SaveData
*/

stock Account_SaveData(const account_name[], const data[e_Account_Info])
{
	new
		file_account,
		filename_account[MAX_STRING];

	format(filename_account, sizeof(filename_account), "%s%s" DATA_FILES_FORMAT, db_account, account_name);

	if (ini_fileExist(filename_account)) {
		file_account = ini_openFile(filename_account);
	} else {
		file_account = ini_createFile(filename_account);
	}

	if (file_account < 0) {
		Log(systemlog, DEBUG, "Error <account:Account_SaveData>: account '%s' has not been opened (error code: %d).", account_name, file_account);
		return 0;
	}

	ini_setString(file_account, "Password", data[e_aPassword]);
#if defined PASSWORD_ENCRYPT_ENABLED
	ini_setString(file_account, "Password_Salt", data[e_aPasswordSalt]);
#endif
	ini_setString(file_account, "LastIP", data[e_aIP]);
	ini_setInteger(file_account, "Creation_Timestamp", data[e_aCreationTime]);
	ini_setInteger(file_account, "Login_Timestamp", data[e_aLoginTime]);
	ini_setInteger(file_account, "Played_Seconds", data[e_aPlayedSeconds]);
	ini_setInteger(file_account, "Premium_Timestamp", data[e_aPremiumTime]);
	ini_setString(file_account, "Language", data[e_aLanguage]);
	ini_setInteger(file_account, "Russifier", _:data[e_aRussifier]);

	ini_closeFile(file_account);
	return 1;
}

/*
	Account_LoadData
*/

stock Account_LoadData(const account_name[], result[e_Account_Info])
{
	new
		file_account,
		filename_account[MAX_STRING];

	format(filename_account, sizeof(filename_account), "%s%s"DATA_FILES_FORMAT, db_account, account_name);

	file_account = ini_openFile(filename_account);
	if (file_account < 0) {
		Log(systemlog, DEBUG, "Error <account:Account_LoadData>: account '%s' has not been opened (error code: %d).", account_name, file_account);
		return 0;
	}

#if defined PASSWORD_ENCRYPT_ENABLED
	ini_getString(file_account, "Password", result[e_aPassword], PASSWORD_HASH_LENGTH + 1);
	ini_getString(file_account, "Password_Salt", result[e_aPasswordSalt], PASSWORD_SALT_LENGTH + 1);
#else
	ini_getString(file_account, "Password", result[e_aPassword], MAX_PASS_LEN + 1);
#endif
	ini_getString(file_account, "LastIP", result[e_aIP], MAX_IP);
	ini_getInteger(file_account, "Creation_Timestamp", result[e_aCreationTime]);
	ini_getInteger(file_account, "Login_Timestamp", result[e_aLoginTime]);
	ini_getInteger(file_account, "Played_Seconds", result[e_aPlayedSeconds]);
	ini_getInteger(file_account, "Premium_Timestamp", result[e_aPremiumTime]);
	ini_getString(file_account, "Language", result[e_aLanguage], MAX_LANG_NAME);
	ini_getInteger(file_account, "Russifier", _:result[e_aRussifier]);

	ini_closeFile(file_account);
	return 1;
}

/*
	Dialogs
*/

DialogCreate:AccountRegister(playerid)
{
	new
		caption[MAX_LANG_VALUE_STRING],
		playername[MAX_PLAYER_NAME + 1];

	GetPlayerName(playerid, playername, sizeof(playername));
	Lang_GetPlayerText(playerid, "ACCOUNT_DIALOG_REGISTER_HEAD", caption, _, playername);

	Dialog_Open(playerid, Dialog:AccountRegister, DIALOG_STYLE_INPUT,
	            caption,
	            "ACCOUNT_DIALOG_REGISTER",
	            "ACCOUNT_DIALOG_REGISTER_BUTTON", "");
}

DialogResponse:AccountRegister(playerid, response, listitem, inputtext[])
{
	new pass_len = strlen(inputtext);
	if (pass_len >= MIN_PASS_LEN && pass_len <= MAX_PASS_LEN) {
		Account_Register(playerid, inputtext);
	} else {
		Dialog_Show(playerid, Dialog:AccountRegister);
	}
	return 1;
}

DialogCreate:AccountLogin(playerid)
{
	new
		caption[MAX_LANG_VALUE_STRING],
		playername[MAX_PLAYER_NAME + 1];

	GetPlayerName(playerid, playername, sizeof(playername));
	Lang_GetPlayerText(playerid, "ACCOUNT_DIALOG_LOGIN_HEAD", caption, _, playername);

	Dialog_Open(playerid, Dialog:AccountLogin, DIALOG_STYLE_PASSWORD,
	            caption,
	            "ACCOUNT_DIALOG_LOGIN",
	            "ACCOUNT_DIALOG_LOGIN_BUTTON", "",
	            GetLoginAttemptCount(playerid));
}

DialogResponse:AccountLogin(playerid, response, listitem, inputtext[])
{
	new pass_len = strlen(inputtext);
	if (pass_len >= MIN_PASS_LEN && pass_len <= MAX_PASS_LEN) {
		Account_Login(playerid, inputtext);
	} else {
		Dialog_Show(playerid, Dialog:AccountLogin);
	}
}

DialogCreate:AccountInformation(playerid)
{
	new caption[MAX_LANG_VALUE_STRING];
	Lang_GetPlayerText(playerid, "ACCOUNT_DIALOG_INFORMATION_CAPTION", caption, _, VERSION_STRING, VERSION_NAME);

	Dialog_Open(playerid, Dialog:AccountInformation, DIALOG_STYLE_MSGBOX,
	            caption,
	            "ACCOUNT_DIALOG_INFORMATION_TEXT",
	            "ACCOUNT_DIALOG_INFORMATION_BUTTON", "");
}

DialogResponse:AccountInformation(playerid, response, listitem, inputtext[])
{
	Dialog_Show(playerid, Dialog:AccountRegister);
}

DialogCreate:AccountLanguage(playerid)
{
	new
		lang_name[MAX_LANG_NAME],
		string[MAX_LANG_VALUE_STRING * LANGS_COUNT];

	foreach (new Lang:lang : LangIterator) {
		Lang_GetName(lang, lang_name);
		strcat(string, lang_name);
		strcat(string, "\n");
	}

	Dialog_Open(playerid, Dialog:AccountLanguage, DIALOG_STYLE_LIST,
	            "Language",
	            string,
	            "OK", "");
}

DialogResponse:AccountLanguage(playerid, response, listitem, inputtext[])
{
	new
		i;

	foreach (new Lang:lang : LangIterator) {
		if (i == listitem) {
			Account_SetLang(playerid, lang);
			break;
		}

		i++;
	}

	if (Lang_GetPlayerLang(playerid) == Lang_Get("ru")) {
		ShowPlayerRussifierSettings(playerid);
	} else {
		Dialog_Show(playerid, Dialog:AccountInformation);
	}
}

stock Account_OnPlayerRussifierSelect(playerid, bool:changed, RussifierType:type)
{
	Account_SetRussifier(playerid, changed ? type : RussifierType:0);
	Dialog_Show(playerid, Dialog:AccountInformation);
	return 1;
}

stock Account_ShowDialog(playerid)
{
	new
		filename_account[MAX_STRING],
		playername[MAX_PLAYER_NAME + 1];

	GetPlayerName(playerid, playername, sizeof(playername));
	format(filename_account, sizeof(filename_account), "%s%s"DATA_FILES_FORMAT, db_account, playername);

	if (ini_fileExist(filename_account)) {
		Dialog_Show(playerid, Dialog:AccountLogin);
	} else {
		Dialog_Show(playerid, Dialog:AccountLanguage);
	}

	Widestrip_ShowForPlayer(playerid);
	return 1;
}

/*
	Register functions
*/

stock Account_SetAfterRegistration(playerid, bool:status)
{
	gIsAfterRegistration[playerid] = status;
}

stock Account_IsAfterRegistration(playerid)
{
	return _:gIsAfterRegistration[playerid];
}

stock Account_SetRegistrationTime(playerid, timestamp)
{
	gAccount[playerid][e_aCreationTime] = timestamp;
}

stock Account_GetRegistrationTime(playerid)
{
	return gAccount[playerid][e_aCreationTime];
}

stock Account_SetPassword(playerid, const password[])
{
#if defined PASSWORD_ENCRYPT_ENABLED
	GenerateRandomString(gAccount[playerid][e_aPasswordSalt], PASSWORD_SALT_LENGTH, PASSWORD_SALT_LENGTH + 1);

	SHA256_PassHash(password, gAccount[playerid][e_aPasswordSalt], gAccount[playerid][e_aPassword], PASSWORD_HASH_LENGTH);
#else
	strcpy(gAccount[playerid][e_aPassword], password, MAX_PASS_LEN);
#endif
}

stock Account_GetPassword(playerid, password[], const size = sizeof(password))
{
	return strcpy(password, gAccount[playerid][e_aPasswordSalt], size);
}

/*
	Account data
*/

stock Account_SetData(playerid, const data[e_Account_Info])
{
	gAccount[playerid] = data;
}

stock Account_GetData(playerid, data[e_Account_Info])
{
	data = gAccount[playerid];
}

/*
	Account_UpdateIP
*/

stock Account_UpdateIP(playerid)
{
	Player_GetIP(playerid, gAccount[playerid][e_aIP], MAX_IP);
}

/*
	Login attempt
*/

static stock ResetLoginAttempt(playerid)
{
	gLoginAttempt{playerid} = 0;
}

static stock GetLoginAttemptCount(playerid)
{
	return MAX_PLAYER_LOGIN_ATTEMPT - gLoginAttempt{playerid};
}

static stock AddLoginAttempt(playerid, value = 1)
{
	gLoginAttempt{playerid} += value;
}

static stock IsLoginAttemptsEnded(playerid)
{
	return gLoginAttempt{playerid} >= MAX_PLAYER_LOGIN_ATTEMPT;
}

/*
	Login time
*/

stock Account_SetLoginTime(playerid, timestamp)
{
	gAccount[playerid][e_aLoginTime] = timestamp;
}

stock Account_GetLoginTime(playerid)
{
	return gAccount[playerid][e_aLoginTime];
}

/*
	Played time
*/

stock Account_SetPlayedTime(playerid, seconds)
{
	gAccount[playerid][e_aPlayedSeconds] = seconds;
}

stock Account_GetPlayedTime(playerid)
{
	return gAccount[playerid][e_aPlayedSeconds];
}

stock Account_GetCurrentPlayedTime(playerid)
{
	return Account_GetPlayedTime(playerid) + gettime() - Account_GetLoginTime(playerid);
}

/*
	Played time
*/

stock Account_SetPremiumTime(playerid, seconds)
{
	gAccount[playerid][e_aPremiumTime] = seconds;
}

stock Account_GetPremiumTime(playerid)
{
	return gAccount[playerid][e_aPremiumTime];
}

/*
	Language
*/

stock Account_LoadLanguage(playerid, playername[] = "", const size = sizeof(playername))
{
	new
		language[MAX_LANG_NAME],
		file_account,
		filename_account[MAX_STRING];

	if (isnull(playername)) {
		GetPlayerName(playerid, playername, size);
	}

	format(filename_account, sizeof(filename_account), "%s%s" DATA_FILES_FORMAT, db_account, playername);

	file_account = ini_openFile(filename_account);
	if (file_account < 0) {
		Log(systemlog, DEBUG, "Error <account:Account_LoadLanguage>: account '%s' has not been opened (error code: %d).", playername, file_account);
		return 0;
	}

	ini_getString(file_account, "Language", language);
	ini_closeFile(file_account);

	Account_SetLang(playerid, Lang_Get(.name = language));
	return 1;
}

stock Account_SetLang(playerid, Lang:lang)
{
	Lang_SetPlayerLang(playerid, lang);
	Lang_GetName(lang, gAccount[playerid][e_aLanguage], MAX_LANG_NAME);
	CallLocalFunction("OnAccountLanguageChanged", "ii", playerid, _:lang);
}

/*
	Russifier
*/

stock Account_SetRussifier(playerid, RussifierType:type)
{
	SetPlayerRussifierType(playerid, type);
	gAccount[playerid][e_aRussifier] = type;
}

stock RussifierType:Account_GetRussifier(playerid)
{
	return gAccount[playerid][e_aRussifier];
}
