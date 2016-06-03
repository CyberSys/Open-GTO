/*

	About: skin admin command
	Author: ziggi

*/

#if defined _admin_cmd_skin_included
	#endinput
#endif

#define _admin_cmd_skin_included

COMMAND:skin(playerid, params[])
{
	if (!IsPlayerHavePrivilege(playerid, PlayerPrivilegeModer)) {
		return 0;
	}

	new
		subcmd[4],
		subparams[32],
		skin;

	if (sscanf(params, "s[4]s[32]I(-1)", subcmd, subparams, skin)) {
		SendClientMessage(playerid, -1, _(ADMIN_COMMAND_SKIN_HELP));
		return 1;
	}

	new
		targetid = INVALID_PLAYER_ID;

	if (strcmp(subparams, "all", true) == 0) {
		targetid = -1;
	} else if (sscanf(subparams, "u", targetid) || targetid == INVALID_PLAYER_ID) {
		SendClientMessage(playerid, -1, _(ADMIN_COMMAND_SKIN_TARGET_ERROR));
		return 1;
	}

	new
		string[MAX_LANG_VALUE_STRING],
		targetname[MAX_PLAYER_NAME + 1],
		playername[MAX_PLAYER_NAME + 1];

	GetPlayerName(playerid, playername, sizeof(playername));

	if (targetid != -1) {
		GetPlayerName(targetid, targetname, sizeof(targetname));
	}

	if (strcmp(subcmd, "set", true) == 0) {
		if (skin == -1) {
			SendClientMessage(playerid, -1, _(ADMIN_COMMAND_SKIN_HELP));
			return 1;
		}

		if (targetid == -1) {
			foreach (new id : Player) {
				SetPlayerSkin(id, skin);
			}

			format(string, sizeof(string), _(ADMIN_COMMAND_SKIN_SET_ALL), playername, playerid, skin);
			SendClientMessageToAll(-1, string);
		} else {
			SetPlayerSkin(targetid, skin);

			format(string, sizeof(string), _(ADMIN_COMMAND_SKIN_SET_PLAYER), playername, playerid, skin);
			SendClientMessage(targetid, -1, string);

			format(string, sizeof(string), _(ADMIN_COMMAND_SKIN_SET_SELF), targetname, targetid, skin);
			SendClientMessage(playerid, -1, string);
		}
	} else if (strcmp(subcmd, "get", true) == 0) {
		if (!IsPlayerConnected(targetid)) {
			SendClientMessage(playerid, -1, _(ADMIN_COMMAND_SKIN_TARGET_ERROR));
			return 1;
		}

		skin = GetPlayerSkin(targetid);

		format(string, sizeof(string), _(ADMIN_COMMAND_SKIN_GET), targetname, targetid, skin);
		SendClientMessage(playerid, -1, string);
	} else {
		SendClientMessage(playerid, -1, _(ADMIN_COMMAND_SKIN_HELP));
	}

	return 1;
}
