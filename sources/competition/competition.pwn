/*

	About: competition system
	Author: ziggi

*/

#if defined _competition_included
	#endinput
#endif

#define _competition_included

/*
	Defines
*/

#if !defined COMPETITION_DEFAULT_TIME
	#define COMPETITION_DEFAULT_TIME 60
#endif

#if !defined COMPETITION_TIMER_INTERVAL
	#define COMPETITION_TIMER_INTERVAL 1000
#endif

#if !defined MAX_COMPETITION
	#define MAX_COMPETITION 15
#endif

#define COMPETITION_VIRTUAL_WORLD_PADDING 2000
#define COMPETITION_MAX_STRING 64
#define INVALID_COMPETITION_ID -1

/*
	Enums
*/

enum CompetitionJoinStatus {
	CompetitionJoinStatusNone,
	CompetitionJoinStatusAll,
	CompetitionJoinStatusGang,
}

enum CompetitionMarkerStatus {
	CompetitionMarkerStatusNone,
	CompetitionMarkerStatusAll,
	CompetitionMarkerStatusTeam,
}

enum CompetitionNametagStatus {
	CompetitionNametagStatusNone,
	CompetitionNametagStatusAll,
	CompetitionNametagStatusTeam,
}

enum CompetitionCollisionStatus {
	CompetitionCollisionStatusNone,
	CompetitionCollisionStatusAll,
	CompetitionCollisionStatusTeam,
}

enum CompetitionParams {
	// general
	bool:COMPETITION_STARTED,
	COMPETITION_PLAYERID,
	COMPETITION_TYPE,
	COMPETITION_MAP,
	COMPETITION_TIME,
	COMPETITION_VIRTUAL_WORLD,
	COMPETITION_JOIN_STATUS, // CompetitionJoinStatus
	COMPETITION_MARKER_STATUS, // CompetitionMarkerStatus
	COMPETITION_NAMETAG_STATUS, // CompetitionNametagStatus
	COMPETITION_WEATHER,
	COMPETITION_WORLD_TIME,
	COMPETITION_LEVEL_MIN,
	COMPETITION_LEVEL_MAX,

	// race
	COMPETITION_COLLISION_STATUS, // CompetitionCollisionStatus

	// deathmath
	bool:COMPETITION_FRIENDLY_FIRE,
}

/*
	Vars
*/

static
	gTimeStamp,
	gParam[MAX_COMPETITION][CompetitionParams];

new
	Iterator:CompetitionPlayerIter[MAX_COMPETITION]<MAX_PLAYERS>,
	Iterator:CompetitionIterator<MAX_COMPETITION>;

/*
	OnGameModeInit
*/

public OnGameModeInit()
{
	Iter_Init(CompetitionPlayerIter);

	gTimeStamp = gettime();
	SetTimer("Competition_Timer", COMPETITION_TIMER_INTERVAL, 1);

	#if defined Competition_OnGameModeInit
		return Competition_OnGameModeInit();
	#else
		return 1;
	#endif
}
#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif

#define OnGameModeInit Competition_OnGameModeInit
#if defined Competition_OnGameModeInit
	forward Competition_OnGameModeInit();
#endif

/*
	OnPlayerDisconnect
*/

public OnPlayerDisconnect(playerid, reason)
{
	new
		cid,
		ctype;

	foreach (cid : CompetitionIterator) {
		if (!Competition_IsPlayerActive(cid, playerid)) {
			continue;
		}

		ctype = Competition_GetParamInt(cid, COMPETITION_TYPE);

		Competition_SetPlayerActive(cid, playerid, false);
		CompetitionType_OnLeave(ctype, cid, playerid);
	}

	#if defined Competition_OnPlayerDisconnect
		return Competition_OnPlayerDisconnect(playerid, reason);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif

#define OnPlayerDisconnect Competition_OnPlayerDisconnect
#if defined Competition_OnPlayerDisconnect
	forward Competition_OnPlayerDisconnect(playerid, reason);
#endif

/*
	Competition_Timer
*/

forward Competition_Timer();
public Competition_Timer()
{
	new
		current_time,
		seconds_gone;

	current_time = gettime();
	seconds_gone = current_time - gTimeStamp;

	if (seconds_gone <= 0) {
		return;
	}

	new
		cid,
		ctype,
		ctime;

	foreach (cid : CompetitionIterator) {
		ctime = Competition_GetParamInt(cid, COMPETITION_TIME);
		ctime -= seconds_gone;
		Competition_SetParamInt(cid, COMPETITION_TIME, ctime);

		// start competition
		if (ctime <= 0 && !Competition_GetParamInt(cid, COMPETITION_STARTED)) {
			ctype = Competition_GetParamInt(cid, COMPETITION_TYPE);

			Competition_SetParamInt(cid, COMPETITION_STARTED, true);
			CompetitionType_OnStart(ctype, cid);
		}
	}

	gTimeStamp = current_time;
}

/*
	Competition Add
*/

stock Competition_Add(const cparams[CompetitionParams])
{
	new cid = Competition_GetFreeSlot();
	if (cid == INVALID_COMPETITION_ID) {
		return INVALID_COMPETITION_ID;
	}

	Competition_SetActiveStatus(cid, true);
	gParam[cid] = cparams;
	gParam[cid][COMPETITION_VIRTUAL_WORLD] = cid + COMPETITION_VIRTUAL_WORLD_PADDING;

	return cid;
}

stock Competition_Remove(cid)
{
	if (!Competition_IsActive(cid)) {
		return 0;
	}

	Competition_SetActiveStatus(cid, false);

	return 1;
}

/*
	Active status
*/

stock Competition_IsActive(cid)
{
	return Iter_Contains(CompetitionIterator, cid);
}

stock Competition_SetActiveStatus(cid, bool:status)
{
	if (status) {
		Iter_Add(CompetitionIterator, cid);
	} else {
		Iter_Remove(CompetitionIterator, cid);
	}
}

stock Competition_GetFreeSlot()
{
	new
		slot;

	slot = Iter_Free(CompetitionIterator);

	if (slot == -1) {
		return INVALID_COMPETITION_ID;
	}

	return slot;
}

/*
	Competition_IsPlayerCanJoin
*/

stock Competition_IsPlayerCanJoin(cid, playerid)
{
	if (!Competition_IsActive(cid)) {
		return 0;
	}

	new
		cplayerid,
		CompetitionJoinStatus:cjoin_status;

	cplayerid = Competition_GetParamInt(cid, COMPETITION_PLAYERID);
	cjoin_status = CompetitionJoinStatus:Competition_GetParamInt(cid, COMPETITION_JOIN_STATUS);

	if (cjoin_status == CompetitionJoinStatusAll) {
		return 1;
	} else if (cjoin_status == CompetitionJoinStatusGang) {
		if (IsPlayersTeammates(playerid, cplayerid)) {
			return 1;
		}
	}

	return 0;
}

/*
	Player on competition functions
*/

stock Competition_IsPlayerActive(cid, playerid)
{
	return Iter_Contains(CompetitionPlayerIter[cid], playerid);
}

stock Competition_SetPlayerActive(cid, playerid, bool:status)
{
	if (status) {
		Iter_Add(CompetitionPlayerIter[cid], playerid);
	} else {
		Iter_Remove(CompetitionPlayerIter[cid], playerid);
	}
}

stock Competition_GetPlayersCount(cid)
{
	return Iter_Count(CompetitionPlayerIter[cid]);
}

/*
	Integer params
*/

stock Competition_SetParamInt(cid, CompetitionParams:param, value)
{
	gParam[cid][param] = value;
}

stock Competition_GetParamInt(cid, CompetitionParams:param)
{
	return gParam[cid][param];
}

/*
	Float params
*/

stock Competition_SetParamFloat(cid, CompetitionParams:param, Float:value)
{
	gParam[cid][param] = _:value;
}

stock Float:Competition_GetParamFloat(cid, CompetitionParams:param)
{
	return Float:gParam[cid][param];
}

/*
	String params
*/

stock Competition_SetParamString(cid, CompetitionParams:param, const value[])
{
	strcpy(gParam[cid][param], value, COMPETITION_MAX_STRING);
}

stock Competition_GetParamString(cid, CompetitionParams:param, value[], size = sizeof(value))
{
	strcpy(value, gParam[cid][param], size);
}
