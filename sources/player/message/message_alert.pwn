/*

	About: player alert system
	Author:	ziggi

*/

#if defined _pl_alert_included
	#endinput
#endif

#define _pl_alert_included


/*
 * Macros
 */

#define ALERT_POS_X     479.5
#define ALERT_POS_Y     286.5
#define ALERT_WIDTH     144

#define MAX_CACHE_ALERT 6


/*
 * Enums
 */

enum e_Alerts_Info {
	bool:e_aIsBusy,
	e_aCaption[MAX_LANG_VALUE_STRING],
	e_aInfo[MAX_LANG_VALUE_STRING],
	e_aTime,
	e_aColor,
	bool:e_aWithSound,
}

enum (<<= 1) {
	MESSAGE_NOTVAR_ALL = -1,
	MESSAGE_NOTVAR_NONE = 0,
	MESSAGE_NOTVAR_CAPTION = 1,
	MESSAGE_NOTVAR_INFO,
}

/*
 * Vars
 */

static
	Text:td_background,
	PlayerText:td_strip[MAX_PLAYERS],
	PlayerText:td_header[MAX_PLAYERS],
	PlayerText:td_content[MAX_PLAYERS],

	timer_id[MAX_PLAYERS] = {0, ...},
	messages[MAX_PLAYERS][MAX_CACHE_ALERT][e_Alerts_Info];


/*
 * For public
 */

public OnGameModeInit()
{
	td_background = TextDrawCreate(ALERT_POS_X, ALERT_POS_Y, "alert_background");
	TextDrawLetterSize(td_background, 0.0, 1.02);
	TextDrawTextSize(td_background, ALERT_POS_X + ALERT_WIDTH, 0.0);
	TextDrawAlignment(td_background, 1);
	TextDrawColor(td_background, -2139062017);
	TextDrawUseBox(td_background, true);
	TextDrawBoxColor(td_background, 100);
	TextDrawSetShadow(td_background, 0);
	TextDrawSetOutline(td_background, 0);
	TextDrawBackgroundColor(td_background, 16777215);
	TextDrawFont(td_background, 1);

	#if defined AlertMsg_OnGameModeInit
		return AlertMsg_OnGameModeInit();
	#else
		return 1;
	#endif
}

#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif
#define OnGameModeInit AlertMsg_OnGameModeInit
forward OnGameModeInit();


public OnPlayerConnect(playerid)
{
	td_strip[playerid] = CreatePlayerTextDraw(playerid, ALERT_POS_X, ALERT_POS_Y + 15.0, "_");
	PlayerTextDrawLetterSize(playerid, td_strip[playerid], 0.0, -0.5);
	PlayerTextDrawTextSize(playerid, td_strip[playerid], ALERT_POS_X + ALERT_WIDTH, 0.0);
	PlayerTextDrawUseBox(playerid, td_strip[playerid], true);
	PlayerTextDrawBoxColor(playerid, td_strip[playerid], 0xFF0000FF);

	td_header[playerid] = CreatePlayerTextDraw(playerid, ALERT_POS_X, ALERT_POS_Y - 1.5, "Header");
	PlayerTextDrawLetterSize(playerid, td_header[playerid], 0.35, 1.45);
	PlayerTextDrawTextSize(playerid, td_header[playerid], ALERT_POS_X + ALERT_WIDTH, 0.0);
	PlayerTextDrawAlignment(playerid, td_header[playerid], 1);
	PlayerTextDrawColor(playerid, td_header[playerid], -5963521);
	PlayerTextDrawSetShadow(playerid, td_header[playerid], 0);
	PlayerTextDrawSetOutline(playerid, td_header[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, td_header[playerid], 51);
	PlayerTextDrawFont(playerid, td_header[playerid], 1);
	PlayerTextDrawSetProportional(playerid, td_header[playerid], 1);

	td_content[playerid] = CreatePlayerTextDraw(playerid, ALERT_POS_X, ALERT_POS_Y + 12.5, "Content");
	PlayerTextDrawLetterSize(playerid, td_content[playerid], 0.3, 1.3);
	PlayerTextDrawTextSize(playerid, td_content[playerid], ALERT_POS_X + ALERT_WIDTH, 0.0);
	PlayerTextDrawAlignment(playerid, td_content[playerid], 1);
	PlayerTextDrawColor(playerid, td_content[playerid], -1);
	PlayerTextDrawUseBox(playerid, td_content[playerid], true);
	PlayerTextDrawBoxColor(playerid, td_content[playerid], 100);
	PlayerTextDrawSetShadow(playerid, td_content[playerid], 0);
	PlayerTextDrawSetOutline(playerid, td_content[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, td_content[playerid], 51);
	PlayerTextDrawFont(playerid, td_content[playerid], 1);
	PlayerTextDrawSetProportional(playerid, td_content[playerid], 1);

	#if defined AlertMsg_OnPlayerConnect
		return AlertMsg_OnPlayerConnect(playerid);
	#else
		return 1;
	#endif
}

#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect AlertMsg_OnPlayerConnect
forward OnPlayerConnect(playerid);


/*
 * Public functions
 */

stock Message_Alert(playerid, caption[], info[], time = 4000, hcolor = -5963521, bool:with_sound = true, notvar_flags = MESSAGE_NOTVAR_NONE, lang_args<>)
{
	new id = GetFreeSlot(playerid);
	if (id == -1) {
		Log(systemlog, DEBUG, "player_alert.inc: Free slot not found. Increase MAX_CACHE_ALERT value.");
		return id;
	}

	static
		Lang:lang;

	lang = Lang_GetPlayerLang(playerid);

	if (!isnull(caption)) {
		if (!(notvar_flags & MESSAGE_NOTVAR_CAPTION)) {
			Lang_GetText(lang, caption, messages[playerid][id][e_aCaption], MAX_LANG_VALUE_STRING);
		} else {
			strcpy(messages[playerid][id][e_aCaption], caption, MAX_LANG_VALUE_STRING);
		}
	}

	if (!(notvar_flags & MESSAGE_NOTVAR_INFO)) {
		Lang_GetText(lang, info, messages[playerid][id][e_aInfo], MAX_LANG_VALUE_STRING);
	} else {
		strcpy(messages[playerid][id][e_aInfo], info, MAX_LANG_VALUE_STRING);
	}

	Lang_format(messages[playerid][id][e_aInfo], MAX_LANG_VALUE_STRING, messages[playerid][id][e_aInfo], lang_start<7>);

	messages[playerid][id][e_aIsBusy] = true;
	messages[playerid][id][e_aTime] = time;
	messages[playerid][id][e_aColor] = hcolor;
	messages[playerid][id][e_aWithSound] = with_sound;

	if (!Message_Alert_IsShowed(playerid)) {
		Message_AlertCached(playerid, id);
	}
	return id;
}

stock Message_Alert_IsShowed(playerid)
{
	if (timer_id[playerid] != 0) {
		return 1;
	}
	return 0;
}

forward Message_AlertHide(playerid);
public Message_AlertHide(playerid)
{
	timer_id[playerid] = 0;

	TextDrawHideForPlayer(playerid, td_background);
	PlayerTextDrawHide(playerid, td_strip[playerid]);

	PlayerTextDrawHide(playerid, td_header[playerid]);
	PlayerTextDrawHide(playerid, td_content[playerid]);

	SetTimer("Message_AlertBusy", 200, 0);
}


/*
 * Private functions
 */

static stock Message_AlertCached(playerid, id)
{
	if (strlen(messages[playerid][id][e_aCaption]) > 0) {
		PlayerTextDrawColor(playerid, td_header[playerid], messages[playerid][id][e_aColor]);
		PlayerTextDrawSetString(playerid, td_header[playerid], messages[playerid][id][e_aCaption]);

		PlayerTextDrawShow(playerid, td_header[playerid]);

		TextDrawShowForPlayer(playerid, td_background);

		PlayerTextDrawBoxColor(playerid, td_strip[playerid], messages[playerid][id][e_aColor]);
		PlayerTextDrawShow(playerid, td_strip[playerid]);
	} else {
		PlayerTextDrawHide(playerid, td_header[playerid]);
		PlayerTextDrawHide(playerid, td_strip[playerid]);
		TextDrawHideForPlayer(playerid, td_background);
	}

	if (strlen(messages[playerid][id][e_aInfo]) > 0) {
		PlayerTextDrawSetString(playerid, td_content[playerid], messages[playerid][id][e_aInfo]);

		PlayerTextDrawShow(playerid, td_content[playerid]);
	} else {
		PlayerTextDrawHide(playerid, td_content[playerid]);
	}

	if (messages[playerid][id][e_aWithSound]) {
		PlayerPlaySound(playerid, 45400, 0.0, 0.0, 0.0);
	}

	if (Message_Alert_IsShowed(playerid)) {
		KillTimer(timer_id[playerid]);
	}

	messages[playerid][id][e_aIsBusy] = false;
	messages[playerid][id][e_aCaption][0] = '\0';
	messages[playerid][id][e_aInfo][0] = '\0';

	timer_id[playerid] = SetTimerEx("Message_AlertHide", messages[playerid][id][e_aTime], 0, "d", playerid);
}

forward Message_AlertBusy(playerid);
public Message_AlertBusy(playerid)
{
	for (new i = 0; i < MAX_CACHE_ALERT; i++) {
		if (messages[playerid][i][e_aIsBusy]) {
			Message_AlertCached(playerid, i);
			break;
		}
	}
}

static stock GetFreeSlot(playerid)
{
	for (new i = 0; i < MAX_CACHE_ALERT; i++) {
		if (!messages[playerid][i][e_aIsBusy]) {
			return i;
		}
	}
	return -1;
}
