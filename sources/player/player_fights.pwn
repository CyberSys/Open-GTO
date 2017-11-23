/*

	About: fight styles change system
	Author: ziggi

*/

#if defined _player_fights_included
	#endinput
#endif

#define _player_fights_included

static
	gPlayerStyleUsed[MAX_PLAYERS char],
	bool:gPlayerLearnedStyles[MAX_PLAYERS][MAX_FIGHTS char];

DialogCreate:PlayerFights(playerid)
{
	static
		temp[MAX_LANG_VALUE_STRING],
		string[MAX_LANG_VALUE_STRING * MAX_FIGHTS];

	string[0] = '\0';

	for (new id = 0; id < GetFightTeachersCount(); id++) {
		if (!IsPlayerFightStyleLearned(playerid, id)) {
			continue;
		}

		GetFightTeacherNameForPlayer(playerid, id, temp);

		strcat(string, temp);
		strcat(string, "\n");
	}

	Dialog_Open(playerid, Dialog:PlayerFights, DIALOG_STYLE_LIST,
	            "FIGHT_TEACHER_PLAYER_CAPTION",
	            string,
	            "FIGHT_TEACHER_DIALOG_BUTTON_OK", "FIGHT_TEACHER_PLAYER_BUTTON1");
}

DialogResponse:PlayerFights(playerid, response, listitem, inputtext[])
{
	if (!response) {
		Dialog_Show(playerid, Dialog:PlayerMenu);
		return 0;
	}

	new
		teacherid,
		styleid,
		teacher_name[MAX_LANG_VALUE_STRING];

	teacherid = listitem;

	for (new id = 0; id < GetFightTeachersCount(); id++) {
		if (!IsPlayerFightStyleLearned(playerid, id)) {
			teacherid++;
			continue;
		}

		if (teacherid == id) {
			break;
		}
	}

	styleid = GetFightTeacherStyleID(teacherid);

	SetPlayerFightStyleUsed(playerid, styleid);
	GetFightTeacherNameForPlayer(playerid, teacherid, teacher_name);

	Dialog_Open(playerid, Dialog:PlayerReturnMenu, DIALOG_STYLE_MSGBOX,
	            "FIGHT_TEACHER_PLAYER_CAPTION",
	            "FIGHT_TEACHER_PLAYER_USED_STYLE",
	            "FIGHT_TEACHER_PLAYER_BUTTON1", "FIGHT_TEACHER_PLAYER_BUTTON2",
	            teacher_name);
	return 1;
}

stock GetPlayerFightStyleUsed(playerid)
{
	return gPlayerStyleUsed{playerid};
}

stock SetPlayerFightStyleUsed(playerid, styleid)
{
	gPlayerStyleUsed{playerid} = styleid;
	SetPlayerFightingStyle(playerid, styleid);
}

stock UpdatePlayerFightStyleUsed(playerid)
{
	SetPlayerFightingStyle(playerid, GetPlayerFightStyleUsed(playerid));
}

stock IsPlayerFightStyleLearned(playerid, teacherid)
{
	if (!IsHaveFightTeacher(teacherid)) {
		return 1;
	}

	return _:gPlayerLearnedStyles[playerid]{teacherid};
}

stock SetPlayerFightStyleLearned(playerid, teacherid, bool:islearned)
{
	if (!IsTeacherValid(teacherid)) {
		return 0;
	}

	gPlayerLearnedStyles[playerid]{teacherid} = islearned;
	return 1;
}
