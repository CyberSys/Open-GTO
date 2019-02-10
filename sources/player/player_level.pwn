/*


*/

#if defined _player_level_included
	#endinput
#endif

#define _player_level_included

/*
	Defines
*/

#define MIN_LEVEL    1

#if PLAYER_START_LEVEL < MIN_LEVEL
	#error PLAYER_START_LEVEL must be greater than MIN_LEVEL
#endif

/*
	Vars
*/

static
	gPlayerLevel[MAX_PLAYERS],
	gPlayerXP[MAX_PLAYERS],
	gMaxPlayerLevel = MAX_LEVEL;

/*
	Functions
*/

PLevel_LoadConfig(file_config)
{
	ini_getInteger(file_config, "Player_Level_Max", gMaxPlayerLevel);
}

PLevel_SaveConfig(file_config)
{
	ini_setInteger(file_config, "Player_Level_Max", gMaxPlayerLevel);
}

PLevel_OnGameModeInit()
{
	new
		level = MIN_LEVEL - 1,
		xp;

	do {
		level++;
		xp = GetPlayerXPToLevel(MIN_LEVEL, level);
	} while (xp >= 0);

	level--;

	if (level < GetMaxPlayerLevel()) {
		Log(systemlog, DEBUG, "player_level.inc: Player_Level_Max is VERY HIGH, maximum supported value is %d", level);
	}
	return 1;
}

stock ResetPlayerLevel(playerid)
{
	gPlayerLevel[playerid] = 0;
	gPlayerXP[playerid] = 0;
}

stock SetPlayerLevel(playerid, level, bool:regenhp = true, bool:notify = true)
{
	new old_level = GetPlayerLevel(playerid);

	if (old_level == level || !IsValidPlayerLevel(level)) {
		return 0;
	}

	new xp_diff = GetPlayerXPToLevel(playerid, level);
	gPlayerLevel[playerid] = level;
	SetPlayerScore(playerid, level);
	gPlayerXP[playerid] = 0;

	// update text draws
	PlayerLevelTD_UpdateLevelString(playerid, level);
	PlayerLevelTD_UpdateXPString(playerid, 0, GetXPToLevel(level + 1), level >= GetMaxPlayerLevel());

	if (regenhp && old_level < level) {
		SetPlayerMaxHealth(playerid);
	}

	if (notify) {
		PlayerPlaySoundOnPlayer(playerid, 1057);
		PlayerLevelTD_Give(playerid, xp_diff, level - old_level);

		if (old_level < level) {
			Lang_SendText(playerid, "PLAYER_LEVEL_UP", level);

			ShowPlayerWeaponsOnLevel(playerid, level, old_level);
		} else {
			Lang_SendText(playerid, "PLAYER_LEVEL_DOWN", level);
		}

		Log(mainlog, INFO, "Player: %s [id: %d] changed his level from %d to %d.", ret_GetPlayerName(playerid), playerid, old_level, level);
	}

	return 1;
}

stock GivePlayerLevel(playerid, amount, bool:regenhp = true, bool:notify = true)
{
	return SetPlayerLevel(playerid, GetPlayerLevel(playerid) + amount, regenhp, notify);
}

stock GetPlayerLevel(playerid)
{
	return gPlayerLevel[playerid];
}

stock SetPlayerXP(playerid, amount, bool:notify = true)
{
	new
		old_level,
		level,
		level_max,
		xp_diff,
		xp_to_level,
		xp_set;

	old_level = GetPlayerLevel(playerid);
	level = old_level;
	level_max = GetMaxPlayerLevel();
	xp_diff = amount - GetPlayerXP(playerid);
	xp_set = amount;

	if (xp_set < 0) {
		xp_to_level = GetXPToLevel(level);

		while (xp_set <= xp_to_level && xp_set < 0) {
			xp_set += xp_to_level;
			level--;

			if (level < MIN_LEVEL) {
				break;
			}

			xp_to_level = GetXPToLevel(level);

			SetPlayerLevel(playerid, level);
		}

		if (level <= MIN_LEVEL) {
			xp_set = 0;
		}
	} else if (xp_set > 0) {
		xp_to_level = GetXPToLevel(level + 1);

		while (xp_set >= xp_to_level) {
			xp_set -= xp_to_level;
			level++;

			if (level > level_max) {
				break;
			}

			xp_to_level = GetXPToLevel(level + 1);

			SetPlayerLevel(playerid, level);
		}

		if (level >= level_max) {
			xp_set = 0;
		}
	}

	gPlayerXP[playerid] = xp_set;
	PlayerLevelTD_UpdateLevelString(playerid, level);
	PlayerLevelTD_UpdateXPString(playerid, xp_set, GetXPToLevel(level + 1), level >= level_max);
	if (notify) {
		PlayerLevelTD_Give(playerid, xp_diff, level - old_level);
	}
}

stock GivePlayerXP(playerid, xpamount, bool:notify = true)
{
	if (xpamount == 0) {
		return 0;
	}

	if (xpamount > 0 && IsPlayerHavePremium(playerid)) {
		xpamount += (xpamount / 100) * PLAYER_XP_PREMIUM_PROFIT;
	}

	if (xpamount < 0) {
		new minxp = GetPlayerXPToLevel(playerid, MIN_LEVEL);
		if (xpamount < minxp) {
			xpamount = minxp;
		}
	} else {
		new maxxp = GetPlayerXPToLevel(playerid, GetMaxPlayerLevel());
		if (xpamount >= maxxp) {
			xpamount = maxxp;
		}
	}

	if (xpamount == 0) {
		return 0;
	}

	Gang_GiveXpFromPlayer(playerid, xpamount);
	SetPlayerXP(playerid, GetPlayerXP(playerid) + xpamount, notify);
	return 1;
}

stock GetPlayerXP(playerid)
{
	return gPlayerXP[playerid];
}

stock GetXPToLevel(level)
{
	return (XP_RATE * (3 * level + 2) * (level - 1));
}

stock GetPlayerXPToLevel(playerid, level)
{
	new
		player_level = GetPlayerLevel(playerid),
		xp_to_level = -GetPlayerXP(playerid);

	if (level == player_level) {
		return xp_to_level;
	}

	if (level > player_level) {
		for (new i = player_level + 1; i <= level; i++) {
			xp_to_level += GetXPToLevel(i);
		}
	} else {
		xp_to_level = -xp_to_level;

		for (new i = level + 1; i <= player_level; i++) {
			xp_to_level += GetXPToLevel(i);
		}

		xp_to_level = -xp_to_level;
	}

	return xp_to_level;
}

stock GetMaxPlayerLevel()
{
	return gMaxPlayerLevel;
}

stock GetMinPlayerLevel()
{
	return MIN_LEVEL;
}

stock IsValidPlayerLevel(level)
{
	return MIN_LEVEL <= level <= GetMaxPlayerLevel();
}
