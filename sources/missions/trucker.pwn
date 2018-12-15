//
// Created by GhostTT
// Converted to GTO by Elbi
// Modified by ZiGGi
//

#if defined _trucker_included
	#endinput
#endif

#define _trucker_included

forward TrailerType:GetTrailerType(vehicleid);

enum TrailerType {
	TRAILER_TYPE_UNKNOWN,
	TRAILER_TYPE_PRODUCT,
	TRAILER_TYPE_PETROL,
	TRAILER_TYPE_CAREER,
};

enum e_Trucker_Info {
	e_tModel,
	Float:e_tPosX,
	Float:e_tPosY,
	Float:e_tPosZ,
	Float:e_tAngle,
	e_tColor1,
	e_tColor2,
	e_tID,
}

// �������
static gTrailer[][e_Trucker_Info] = {
	// �������� ��� ��������
	{584, 253.0453, 1372.3413, 11.1734, 269.9365, -1, -1},
	{584, 252.4802, 1397.2062, 11.1703, 271.6770, -1, -1},
	// ����������� ����
	{435, -117.0570, -325.0306, 2.0109, 178.9237, -1, -1},
	{591, -181.4496, -274.6508, 2.0159, 88.4948, 7, -1},
	{435, -192.3278, -282.1784, 2.0142, 90.3535, -1, -1},
	{591, -144.1598, -216.2062, 2.0079, 88.3445, 3, -1},
	{435, -152.1157, -343.3120, 2.4457, 179.0829, -1, -1},
	// � ������� ����
	{450, 512.6126, 792.6769, -20.8209, 245.4778, 1, -1},
	{450, 592.9045, 963.4652, -17.6857, 271.3427, 0, -1},
	{450, 709.8566, 824.9518, -29.2079, 341.4127, 7, -1}
};

// ���������
static gLinerunner[][e_Trucker_Info] = {
	// ������ ��� ��������
	{514, 285.8618, 1374.7434, 11.1717, 1.7211, 3, 1},
	{515, 285.3164, 1395.3885, 11.1710, 3.4315, 1, 1},
	// ������ �����������
	{403, -199.9957, -285.4144, 2.0351, 90.5924, 133, 57},
	{403, -200.2189, -275.2891, 2.0383, 91.6567, 133, 57},
	{403, -60.0619, -303.6261, 6.0162, 271.3613, 1, 1},
	{514, -36.4936, -375.8590, 6.0170, 0.0727, 6, 1},
	{403, -1.8979, -364.3783, 6.0158, 89.3496, 7, 1},
	{515, -29.0899, -276.7479, 6.0114, 270.1041, 0, 1},
	// ������ � �������
	{515, 836.6692, 870.6066, 14.2118, 201.7150, 0, -1},
	{514, 844.5200, 875.1898, 14.3768, 205.1848, 1, -1},
	{515, 855.1014, 878.3007, 14.3702, 206.1360, 7, -1}
};

enum e_Destination_Info {
	TrailerType:e_dType,
	Float:e_dPosX,
	Float:e_dPosY,
	Float:e_dPosZ,
}

static gDestination[][e_Destination_Info] = {
	{TRAILER_TYPE_PETROL, 1725.4000, -2414.7, 13.5},
	{TRAILER_TYPE_PETROL, 2109.2126, 917.5845, 10.8203},
	{TRAILER_TYPE_PETROL, 2640.1831, 1103.9224, 10.8203},
	{TRAILER_TYPE_PETROL, 611.8934, 1694.7921, 6.7193},
	{TRAILER_TYPE_PETROL, -1327.5398, 2682.9771, 49.7896},
	{TRAILER_TYPE_PETROL, -2413.7427, 975.9317, 45.0031},
	{TRAILER_TYPE_PETROL, -1672.3597, 414.2950, 6.8866},
	{TRAILER_TYPE_PETROL, -2244.1365, -2560.6294, 31.6276},
	{TRAILER_TYPE_PETROL, -1603.0166, -2709.3589, 48.2419},
	{TRAILER_TYPE_PETROL, 1939.3275, -1767.6813, 13.2787},
	{TRAILER_TYPE_PETROL, -94.7651, -1174.8079, 1.9979},
	{TRAILER_TYPE_PETROL, 1381.6699, 462.6467, 19.8540},
	{TRAILER_TYPE_PETROL, -1478.2916, 1862.8318, 32.3617},
	{TRAILER_TYPE_PETROL, 657.8167, -559.6507, 16.0630},
	{TRAILER_TYPE_PETROL, 2147.3054, 2744.9377, 10.5263},
	{TRAILER_TYPE_PETROL, 2204.9602, 2480.3494, 10.5278},
	{TRAILER_TYPE_PETROL, 1590.9493, 2202.2637, 10.5247},

	{TRAILER_TYPE_PRODUCT, 2398.4761, -1485.6116, 23.5552},
	{TRAILER_TYPE_PRODUCT, -1211.9420, 1824.8726, 41.7188},
	{TRAILER_TYPE_PRODUCT, -2326.6709, -134.8826, 35.3203},
	{TRAILER_TYPE_PRODUCT, 2373.3374, -1905.1631, 13.1099},
	{TRAILER_TYPE_PRODUCT, 174.1435, 1191.3485, 14.7578},
	{TRAILER_TYPE_PRODUCT, -2684.3948, 267.8032, 4.3359},
	{TRAILER_TYPE_PRODUCT, 1179.6357, -888.6750, 42.8907},
	{TRAILER_TYPE_PRODUCT, 1158.3813, 2105.5540, 10.8203},
	{TRAILER_TYPE_PRODUCT, -2323.4321, 1014.8897, 50.6953},
	{TRAILER_TYPE_PRODUCT, 785.3561, -1619.9807, 13.0664},
	{TRAILER_TYPE_PRODUCT, 2630.8838, 1860.4771, 10.8203},
	{TRAILER_TYPE_PRODUCT, -2150.7163, -2445.8569, 30.6250},
	{TRAILER_TYPE_PRODUCT, 2336.1531, 75.0252, 26.4816},
	{TRAILER_TYPE_PRODUCT, 2479.4326, 2001.2902, 10.8203},
	{TRAILER_TYPE_PRODUCT, 1387.6401, 261.4780, 19.5669},
	{TRAILER_TYPE_PRODUCT, 2155.1926, 2816.3020, 10.8203},

	{TRAILER_TYPE_CAREER, -1035.5779, -636.6919, 32.0078},
	{TRAILER_TYPE_CAREER, 243.5755, 1421.0634, 10.5859},
	{TRAILER_TYPE_CAREER, -148.8541, -221.2976, 1.4219},
	{TRAILER_TYPE_CAREER, 2171.8013, -1981.8429, 13.5516},
	{TRAILER_TYPE_CAREER, -1733.1241, 195.9595, 3.5547},
	{TRAILER_TYPE_CAREER, 2796.9668, 967.0319, 10.7500},
	{TRAILER_TYPE_CAREER, 1748.2073, 923.6948, 10.7236},
	{TRAILER_TYPE_CAREER, 1726.6693, 2337.2102, 10.8203},
	{TRAILER_TYPE_CAREER, -590.1365, -556.8542, 25.5296},
	{TRAILER_TYPE_CAREER, 1115.8527, -340.0908, 73.9922}
};

enum Info_Player_Trucker {
	pt_TrailerCheck_Timer,
	pt_TrailerCheck_Time,
	pt_TryCount,
	pt_PauseTime,
	pt_MissionTimer,
	pt_BackCarTime,
}

static
	player_trucker[MAX_PLAYERS][Info_Player_Trucker],
	player_mapicon[MAX_PLAYERS],
	player_checkpoint[MAX_PLAYERS];

static
	Text3D:gLinerunnerLabelID[ sizeof(Houses) ][MAX_PLAYERS],
	Text3D:gTrailerLabelID[ sizeof(Houses) ][MAX_PLAYERS];

/*
	OnGameModeInit
*/

public OnGameModeInit()
{
	if (!IsMissionEnabled(MISSION_TRUCKER)) {
	#if defined Trucker_OnGameModeInit
		return Trucker_OnGameModeInit();
	#else
		return 1;
	#endif
	}

	// ������������ ������
	Mission_Register(MISSION_TRUCKER);

	// ������ �������
	for (new veh_id = 0; veh_id < sizeof(gTrailer); veh_id++) {
		gTrailer[veh_id][e_tID] = AddStaticVehicleEx(gTrailer[veh_id][e_tModel],
			gTrailer[veh_id][e_tPosX], gTrailer[veh_id][e_tPosY], gTrailer[veh_id][e_tPosZ], gTrailer[veh_id][e_tAngle],
			gTrailer[veh_id][e_tColor1], gTrailer[veh_id][e_tColor2], TRUCKER_CAR_SPAWN_TIME
		);
		SetVehicleNumberPlate(gTrailer[veh_id][e_tID], MODE_NAME);
	}

	// ������ ���������
	for (new veh_id = 0; veh_id < sizeof(gLinerunner); veh_id++) {
		gLinerunner[veh_id][e_tID] = AddStaticVehicleEx(gLinerunner[veh_id][e_tModel],
			gLinerunner[veh_id][e_tPosX], gLinerunner[veh_id][e_tPosY], gLinerunner[veh_id][e_tPosZ], gLinerunner[veh_id][e_tAngle],
			gLinerunner[veh_id][e_tColor1], gLinerunner[veh_id][e_tColor2], TRUCKER_CAR_SPAWN_TIME
		);

		SetVehicleFuel(gLinerunner[veh_id][e_tID], -1);
		SetVehicleNumberPlate(gLinerunner[veh_id][e_tID], MODE_NAME);
	}

	// ������
	CreateDynamicMapIcon(246.8379, 1410.5923, 23.3703, 51, 0);
	CreateDynamicMapIcon(-49.7828, -269.3626, 6.6332, 51, 0);
	CreateDynamicMapIcon(816.5801, 857.0634, 12.7891, 51, 0);

	Log_Init("missions", "Trucker module init");
	#if defined Trucker_OnGameModeInit
		return Trucker_OnGameModeInit();
	#else
		return 1;
	#endif
}
#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif

#define OnGameModeInit Trucker_OnGameModeInit
#if defined Trucker_OnGameModeInit
	forward Trucker_OnGameModeInit();
#endif

/*
	OnPlayerStateChange
*/

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	if (!IsMissionEnabled(MISSION_TRUCKER)) {
	#if defined Trucker_OnPlayerStateChange
		return Trucker_OnPlayerStateChange(playerid, newstate, oldstate);
	#else
		return 1;
	#endif
	}

	if (newstate == PLAYER_STATE_DRIVER) {
		if (IsVehicleIsRunner( GetPlayerVehicleID(playerid) )) {
			if (!IsPlayerOnMission(playerid, MISSION_TRUCKER)) {
				if (player_trucker[playerid][pt_PauseTime] > gettime()) {
					RemovePlayerFromVehicle(playerid);
					Trucker_ShowPauseMessage(playerid);
				} else {
					Dialog_Show(playerid, Dialog:TruckerMenu);
				}
			}
			if (player_trucker[playerid][pt_BackCarTime] > 0) {
				player_trucker[playerid][pt_BackCarTime] = 0;
			}
		}
	} else if (oldstate == PLAYER_STATE_DRIVER) {
		player_trucker[playerid][pt_BackCarTime] = TRUCKER_BACK_CAR_TIME;

		if (IsPlayerOnMission(playerid, MISSION_TRUCKER)) {
			Trucker_BackCarTimer(playerid);
		}
	}
	#if defined Trucker_OnPlayerStateChange
		return Trucker_OnPlayerStateChange(playerid, newstate, oldstate);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerStateChange
	#undef OnPlayerStateChange
#else
	#define _ALS_OnPlayerStateChange
#endif

#define OnPlayerStateChange Trucker_OnPlayerStateChange
#if defined Trucker_OnPlayerStateChange
	forward Trucker_OnPlayerStateChange(playerid, newstate, oldstate);
#endif

forward Trucker_BackCarTimer(playerid);
public Trucker_BackCarTimer(playerid)
{
	if (player_trucker[playerid][pt_BackCarTime] > 0) {
		Message_Alert(playerid, "TRUCKER_ALERT_HEADER", "TRUCKER_ALERT_GET_BACK", 1200, _, false, _,
		              MESSAGE_NOTVAR_NONE,
		              player_trucker[playerid][pt_BackCarTime]);

		player_trucker[playerid][pt_BackCarTime]--;
		SetTimerEx("Trucker_BackCarTimer", 1000, 0, "d", playerid);
	} else if (!IsVehicleIsRunner( GetPlayerVehicleID(playerid) )) {
		Trucker_CancelMission(playerid);
		KillTimer(player_trucker[playerid][pt_MissionTimer]);
	}
	return 1;
}

stock Trucker_Start(playerid)
{
	new
		vehicleid = GetPlayerVehicleID(playerid),
		TrailerType:trailer_type = GetTrailerType(vehicleid);

	if (trailer_type == TRAILER_TYPE_UNKNOWN) {
		Lang_SendText(playerid, "TRUCKER_GET_TRAILER", TRUCKER_TIME_GET_TRAILER);

		Message_Alert(playerid, "TRUCKER_ALERT_HEADER", "TRUCKER_ALERT_GET_TRAILER_S", _, _, _, _,
		              MESSAGE_NOTVAR_NONE,
		              TRUCKER_TIME_GET_TRAILER);

		Message_Objective(playerid, "TRUCKER_OBJECTIVE_GET_TRAILER", -1);

		player_trucker[playerid][pt_TrailerCheck_Time] = gettime();
		player_trucker[playerid][pt_TrailerCheck_Timer] = SetTimerEx("Trucker_Trailer_Check", 500, 1, "dd", playerid, vehicleid);
		return 0;
	}

	new
		dest_list[ sizeof(gDestination) ],
		dest_list_pos = 0;

	for (new i = 0; i < sizeof(gDestination); i++) {
		if (gDestination[i][e_dType] != trailer_type) {
			continue;
		}

		dest_list[dest_list_pos] = i;
		dest_list_pos++;
	}

	new dest_id = dest_list[ random(dest_list_pos) ];

	player_mapicon[playerid] = CreateDynamicMapIcon(
		gDestination[dest_id][e_dPosX], gDestination[dest_id][e_dPosY], gDestination[dest_id][e_dPosZ],
		0, 0xAA0000FF, .playerid = playerid, .style = MAPICON_GLOBAL
	);
	player_checkpoint[playerid] = CreateDynamicCP(
		gDestination[dest_id][e_dPosX], gDestination[dest_id][e_dPosY], gDestination[dest_id][e_dPosZ],
		10.0, .playerid = playerid, .streamdistance = 65000.0
	);
	TogglePlayerDynamicCP(playerid, player_checkpoint[playerid], 1);

	new
		zone[MAX_NAME],
		td_type_name[MAX_LANG_VALUE_STRING],
		type_name[MAX_LANG_VALUE_STRING];

	Zone_GetNameByCoords(gDestination[dest_id][e_dPosX], gDestination[dest_id][e_dPosY], gDestination[dest_id][e_dPosZ], zone);

	switch (trailer_type) {
		case TRAILER_TYPE_PRODUCT: {
			Lang_GetPlayerText(playerid, "TRUCKER_PRODUCTS", type_name);
			Lang_GetPlayerText(playerid, "TRUCKER_TEXTDRAW_PRODUCTS", td_type_name);
		}
		case TRAILER_TYPE_PETROL: {
			Lang_GetPlayerText(playerid, "TRUCKER_FUEL", type_name);
			Lang_GetPlayerText(playerid, "TRUCKER_TEXTDRAW_FUEL", td_type_name);
		}
		case TRAILER_TYPE_CAREER: {
			Lang_GetPlayerText(playerid, "TRUCKER_COAL", type_name);
			Lang_GetPlayerText(playerid, "TRUCKER_TEXTDRAW_COAL", td_type_name);
		}
	}

	SetPlayerQuestID(playerid, Mission_GetQuestID(MISSION_TRUCKER));
	player_trucker[playerid][pt_MissionTimer] = SetTimerEx("Trucker_CancelMission", TRUCKER_MISSION_TIME * 1000, 0, "d", playerid);

	Lang_SendText(playerid, "TRUCKER_MISSION_STARTED", type_name, zone, TRUCKER_MISSION_TIME / 60);

	new
		header[MAX_LANG_VALUE_STRING];

	Lang_GetPlayerText(playerid, "TRUCKER_ALERT_HEADER", header);
	Message_Alert(playerid, header, "TRUCKER_ALERT_STARTED", _, _, _, _, MESSAGE_NOTVAR_CAPTION, TRUCKER_MISSION_TIME / 60);

	Message_Objective(playerid, "TRUCKER_OBJECTIVE_STARTED", -1, _, _, td_type_name, zone);
	return 1;
}

/*
	OnPlayerKeyStateChange
*/

stock Trucker_OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (!PRESSED(KEY_SUBMISSION)) {
		return 0;
	}

	if (IsPlayerOnMission(playerid, MISSION_TRUCKER)) {
		Dialog_Show(playerid, Dialog:TruckerCancel);
		return 1;
	}
	return 0;
}

/*
	OnPlayerEnterDynamicCP
*/
public OnPlayerEnterDynamicCP(playerid, checkpointid)
{
	if (!IsMissionEnabled(MISSION_TRUCKER) || checkpointid != player_checkpoint[playerid]) {
	#if defined Trucker_OnPlayerEnterDynamicCP
		return Trucker_OnPlayerEnterDynamicCP(playerid, checkpointid);
	#else
		return 1;
	#endif
	}

	new vehicleid = GetPlayerVehicleID(playerid);
	if (IsPlayerOnMission(playerid, MISSION_TRUCKER) && IsVehicleIsRunner(vehicleid)) {
		new trailerid = GetVehicleTrailer(vehicleid);
		if (trailerid == 0) {
			Lang_SendText(playerid, "TRUCKER_TRAILER_MISSING");
			return 1;
		}

		if (!IsMissionTrailer(trailerid)) {
			Trucker_Stop(playerid);
			GivePlayerMoney(playerid, -Mission_CalculateMoney(playerid, MISSION_TRUCKER));

			new Float:health;
			GetPlayerHealth(playerid, health);
			SetPlayerHealth(playerid, health - 10);

			Lang_SendText(playerid, "TRUCKER_TRAILER_FAKE");
			return 1;
		}

		Trucker_Stop(playerid);
		KillTimer(player_trucker[playerid][pt_MissionTimer]);
		GivePlayerMoney(playerid, Mission_CalculateMoney(playerid, MISSION_TRUCKER));
		GivePlayerXP(playerid, Mission_CalculateXP(playerid, MISSION_TRUCKER));

		if (player_trucker[playerid][pt_TryCount] > 0) {
			Lang_SendText(playerid, "TRUCKER_MISSION_COMPLETE", TRUCKER_MISSION_TIME / 60);

			Message_Alert(playerid, "TRUCKER_ALERT_HEADER", "TRUCKER_ALERT_GET_TRAILER_M", _, _, _, _,
			              MESSAGE_NOTVAR_NONE,
			              TRUCKER_MISSION_TIME / 60);

			Message_Objective(playerid, "TRUCKER_OBJECTIVE_GET_TRAILER", -1);

			player_trucker[playerid][pt_TrailerCheck_Time] = gettime() + TRUCKER_MISSION_TIME - TRUCKER_TIME_GET_TRAILER;
			player_trucker[playerid][pt_TrailerCheck_Timer] = SetTimerEx("Trucker_Trailer_Check", 500, 1, "dd", playerid, vehicleid);
		}
	}
	#if defined Trucker_OnPlayerEnterDynamicCP
		return Trucker_OnPlayerEnterDynamicCP(playerid, checkpointid);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerEnterDynamicCP
	#undef OnPlayerEnterDynamicCP
#else
	#define _ALS_OnPlayerEnterDynamicCP
#endif

#define OnPlayerEnterDynamicCP Trucker_OnPlayerEnterDynamicCP
#if defined Trucker_OnPlayerEnterDynamicCP
	forward Trucker_OnPlayerEnterDynamicCP(playerid, checkpointid);
#endif

/*
	Dialogs
*/

DialogCreate:TruckerMenu(playerid)
{
	Dialog_Open(playerid, Dialog:TruckerMenu, DIALOG_STYLE_MSGBOX,
	            "TRUCKER_DIALOG_HEADER",
	            "TRUCKER_DIALOG_INFORMATION_TEXT",
	            "TRUCKER_DIALOG_ACCEPT", "TRUCKER_DIALOG_DECLINE");
}

DialogResponse:TruckerMenu(playerid, response, listitem, inputtext[])
{
	if (!response) {
		RemovePlayerFromVehicle(playerid);
		return 0;
	}

	if (player_trucker[playerid][pt_PauseTime] > gettime()) {
		RemovePlayerFromVehicle(playerid);
		Trucker_ShowPauseMessage(playerid);
	} else {
		Trucker_Start(playerid);
	}
	return 1;
}

DialogCreate:TruckerCancel(playerid)
{
	Dialog_Open(playerid, Dialog:TruckerCancel, DIALOG_STYLE_MSGBOX,
	            "TRUCKER_DIALOG_HEADER",
	            "TRUCKER_MISSION_LEAVE",
	            "TRUCKER_DIALOG_YES", "TRUCKER_DIALOG_NO");
}

DialogResponse:TruckerCancel(playerid, response, listitem, inputtext[])
{
	if (!response) {
		return 1;
	}

	if (IsPlayerOnMission(playerid, MISSION_TRUCKER)) {
		Trucker_CancelMission(playerid);
		KillTimer(player_trucker[playerid][pt_MissionTimer]);
	}
	return 1;
}

/*
	OnPlayerConnect
*/
public OnPlayerConnect(playerid)
{
	for (new id = 0; id < sizeof(gTrailer); id++) {
		CreatePlayerTrailerLabel(playerid, id);
	}

	for (new id = 0; id < sizeof(gLinerunner); id++) {
		CreatePlayerLinerunnerLabel(playerid, id);
	}
	#if defined Trucker_OnPlayerConnect
		return Trucker_OnPlayerConnect(playerid);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif

#define OnPlayerConnect Trucker_OnPlayerConnect
#if defined Trucker_OnPlayerConnect
	forward Trucker_OnPlayerConnect(playerid);
#endif

/*
	OnPlayerDisconnect
*/

public OnPlayerDisconnect(playerid, reason)
{
	if (!IsMissionEnabled(MISSION_TRUCKER)) {
		return 1;
	}

	if (IsPlayerOnMission(playerid, MISSION_TRUCKER)) {
		if (player_trucker[playerid][pt_MissionTimer] != 0) {
			KillTimer(player_trucker[playerid][pt_MissionTimer]);
			player_trucker[playerid][pt_MissionTimer] = 0;
		}

		Trucker_Stop(playerid);
	}

	if (player_trucker[playerid][pt_TrailerCheck_Timer] != 0) {
		KillTimer(player_trucker[playerid][pt_TrailerCheck_Timer]);
		player_trucker[playerid][pt_TrailerCheck_Timer] = 0;
	}

	player_trucker[playerid][pt_TryCount] = 0;
	player_trucker[playerid][pt_PauseTime] = 0;

	for (new id = 0; id < sizeof(gTrailer); id++) {
		DestroyPlayerTrailerLabel(playerid, id);
	}

	for (new id = 0; id < sizeof(gLinerunner); id++) {
		DestroyPlayerLinerunnerLabel(playerid, id);
	}
	#if defined Trucker_OnPlayerDisconnect
		return Trucker_OnPlayerDisconnect(playerid, reason);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif

#define OnPlayerDisconnect Trucker_OnPlayerDisconnect
#if defined Trucker_OnPlayerDisconnect
	forward Trucker_OnPlayerDisconnect(playerid, reason);
#endif

/*
	OnPlayerDeath
*/

public OnPlayerDeath(playerid, killerid, reason)
{
	if (!IsMissionEnabled(MISSION_TRUCKER) || !IsPlayerOnMission(playerid, MISSION_TRUCKER)) {
	#if defined Trucker_OnPlayerDeath
		return Trucker_OnPlayerDeath(playerid, killerid, reason);
	#else
		return 1;
	#endif
	}
	Trucker_Stop(playerid);
	GivePlayerMoney(playerid, -Mission_CalculateMoney(playerid, MISSION_TRUCKER));
	Lang_SendText(playerid, "TRUCKER_MISSION_FAILED");
	#if defined Trucker_OnPlayerDeath
		return Trucker_OnPlayerDeath(playerid, killerid, reason);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerDeath
	#undef OnPlayerDeath
#else
	#define _ALS_OnPlayerDeath
#endif

#define OnPlayerDeath Trucker_OnPlayerDeath
#if defined Trucker_OnPlayerDeath
	forward Trucker_OnPlayerDeath(playerid, killerid, reason);
#endif

/*
	OnVehicleDeath
*/

public OnVehicleDeath(vehicleid, killerid)
{
	if (!IsMissionEnabled(MISSION_TRUCKER)) {
	#if defined Trucker_OnVehicleDeath
		return Trucker_OnVehicleDeath(vehicleid, killerid);
	#else
		return 1;
	#endif
	}
	if (IsVehicleIsRunner(vehicleid)) {
		if (IsPlayerOnMission(killerid, MISSION_TRUCKER)) {
			Trucker_Stop(killerid);
			GivePlayerMoney(killerid, -Mission_CalculateMoney(killerid, MISSION_TRUCKER));
			Lang_SendText(killerid, "TRUCKER_MISSION_FAILED_DESTROY");
		} else {
			if (player_trucker[killerid][pt_TrailerCheck_Timer] != 0) {
				Lang_SendText(killerid, "TRUCKER_MISSION_FAILED_DECLINE");
				Message_Alert(killerid, "TRUCKER_ALERT_HEADER", "TRUCKER_ALERT_ABORTED");

				KillTimer(player_trucker[killerid][pt_TrailerCheck_Timer]);
				player_trucker[killerid][pt_TrailerCheck_Timer] = 0;
			}
		}
	}
	#if defined Trucker_OnVehicleDeath
		return Trucker_OnVehicleDeath(vehicleid, killerid);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnVehicleDeath
	#undef OnVehicleDeath
#else
	#define _ALS_OnVehicleDeath
#endif

#define OnVehicleDeath Trucker_OnVehicleDeath
#if defined Trucker_OnVehicleDeath
	forward Trucker_OnVehicleDeath(vehicleid, killerid);
#endif

/*
	Functions
*/

forward Trucker_Trailer_Check(playerid, vehicleid);
public Trucker_Trailer_Check(playerid, vehicleid)
{
	if (GetPlayerVehicleID(playerid) == 0) {
		Lang_SendText(playerid, "TRUCKER_MISSION_FAILED_DECLINE");
		Message_Alert(playerid, "TRUCKER_ALERT_HEADER", "TRUCKER_ALERT_ABORTED");

		Message_ObjectiveHide(playerid);

		KillTimer(player_trucker[playerid][pt_TrailerCheck_Timer]);
		SetVehicleToRespawn(vehicleid);
		return 0;
	}

	static previous_time;
	new time_left = player_trucker[playerid][pt_TrailerCheck_Time] + TRUCKER_TIME_GET_TRAILER - gettime();

	if (time_left != previous_time) {
		switch (time_left) {
			case 10, TRUCKER_TIME_GET_TRAILER / 4, TRUCKER_TIME_GET_TRAILER / 2: {
				Message_Alert(playerid, "TRUCKER_ALERT_HEADER", "TRUCKER_ALERT_GET_TRAILER_S", _, _, _, _,
				              MESSAGE_NOTVAR_NONE,
				              time_left);
			}
		}

		previous_time = time_left;
	}

	if (time_left <= 0) {
		RemovePlayerFromVehicle(playerid);
		SetVehicleToRespawn(vehicleid);
		player_trucker[playerid][pt_TrailerCheck_Time] = 0;
		KillTimer(player_trucker[playerid][pt_TrailerCheck_Timer]);
		Lang_SendText(playerid, "TRUCKER_MISSION_FAILED_TRAILER");
		Message_Alert(playerid, "TRUCKER_ALERT_HEADER", "TRUCKER_ALERT_ABORTED");
		Message_ObjectiveHide(playerid);
		return 0;
	}

	new trailerid = GetVehicleTrailer(vehicleid);
	if (trailerid == 0 || !IsMissionTrailer(trailerid)) {
		return 0;
	}

	KillTimer(player_trucker[playerid][pt_TrailerCheck_Timer]);
	Trucker_Start(playerid);
	return 1;
}

forward Trucker_CancelMission(playerid);
public Trucker_CancelMission(playerid)
{
	if (IsPlayerOnMission(playerid, MISSION_TRUCKER)) {
		Trucker_Stop(playerid);
		GivePlayerMoney(playerid, -Mission_CalculateMoney(playerid, MISSION_TRUCKER));
		Lang_SendText(playerid, "TRUCKER_MISSION_FAILED_DESCRIPTION");

		new vehicleid = GetPlayerVehicleID(playerid);
		if (vehicleid != 0 && IsVehicleIsRunner(vehicleid)) {
			SetVehicleToRespawn(vehicleid);
		}
	}
}

stock Trucker_Stop(playerid)
{
	TogglePlayerDynamicCP(playerid, player_checkpoint[playerid], 0);
	DestroyDynamicCP(player_checkpoint[playerid]);
	DestroyDynamicMapIcon(player_mapicon[playerid]);

	Message_ObjectiveHide(playerid);

	player_trucker[playerid][pt_BackCarTime] = 0;

	ResetPlayerQuest(playerid);

	new vehicleid = GetPlayerVehicleID(playerid);
	if (vehicleid != 0 && IsVehicleIsRunner(vehicleid)) {
		new trailerid = GetVehicleTrailer(vehicleid);

		DetachTrailerFromVehicle(vehicleid);

		if (trailerid != 0) {
			SetVehicleToRespawn(trailerid);
		}
	}

	player_trucker[playerid][pt_TryCount]++;

	if (player_trucker[playerid][pt_TryCount] >= Mission_GetTryCount(MISSION_TRUCKER)) {
		player_trucker[playerid][pt_TryCount] = 0;
		player_trucker[playerid][pt_PauseTime] = gettime() + Mission_GetPauseTime(MISSION_TRUCKER);

		RemovePlayerFromVehicle(playerid);
		SetVehicleToRespawn(vehicleid);

		Trucker_ShowPauseMessage(playerid);
	}
}

static stock Trucker_ShowPauseMessage(playerid)
{
	new
		seconds,
		timeword[MAX_LANG_VALUE_STRING];

	seconds = player_trucker[playerid][pt_PauseTime] - gettime();
	Declension_GetSeconds2(playerid, seconds, timeword);

	Lang_SendText(playerid, "TRUCKER_MISSION_WAIT", seconds, timeword);
}

static stock DestroyPlayerLinerunnerLabel(playerid, id)
{
	DestroyDynamic3DTextLabel(gLinerunnerLabelID[id][playerid]);
	gLinerunnerLabelID[id][playerid] = Text3D:INVALID_3DTEXT_ID;
}

static stock CreatePlayerLinerunnerLabel(playerid, id)
{
	new string[MAX_LANG_VALUE_STRING];
	Lang_GetPlayerText(playerid, "TRUCKER_3D_TEXT", string);
	gLinerunnerLabelID[id][playerid] = CreateDynamic3DTextLabel(string, 0x1CE89BAA,
		0.0, 0.0, 0.0, 20.0,
		.attachedvehicle = gLinerunner[id][e_tID], .testlos = 1, .playerid = playerid);
}

static stock DestroyPlayerTrailerLabel(playerid, id)
{
	DestroyDynamic3DTextLabel(gTrailerLabelID[id][playerid]);
	gTrailerLabelID[id][playerid] = Text3D:INVALID_3DTEXT_ID;
}

static stock CreatePlayerTrailerLabel(playerid, id)
{
	new string[MAX_LANG_VALUE_STRING];
	Lang_GetPlayerText(playerid, "TRUCKER_3D_TEXT", string);
	gTrailerLabelID[id][playerid] = CreateDynamic3DTextLabel(string, 0x1CE89BAA,
		0.0, 0.0, 0.0, 20.0,
		.attachedvehicle = gTrailer[id][e_tID], .testlos = 1, .playerid = playerid);
}

static stock IsVehicleIsRunner(vehicleid)
{
	for (new i = 0; i < sizeof(gLinerunner); i++) {
		if (gLinerunner[i][e_tID] == vehicleid) {
			return 1;
		}
	}
	return 0;
}

static stock IsMissionTrailer(trailerid)
{
	for (new i = 0; i < sizeof(gTrailer); i++) {
		if (gTrailer[i][e_tID] == trailerid) {
			return 1;
		}
	}
	return 0;
}

static stock TrailerType:GetTrailerType(vehicleid)
{
	switch ( GetVehicleModel( GetVehicleTrailer(vehicleid) ) ) {
		case 435, 591: {
			return TRAILER_TYPE_PRODUCT;
		}
		case 584: {
			return TRAILER_TYPE_PETROL;
		}
		case 450: {
			return TRAILER_TYPE_CAREER;
		}
	}
	return TRAILER_TYPE_UNKNOWN;
}

stock Trucker_SetPlayerTryCount(playerid, value)
{
	player_trucker[playerid][pt_TryCount] = value;
}

stock Trucker_GetPlayerTryCount(playerid)
{
	return player_trucker[playerid][pt_TryCount];
}

stock Trucker_SetPlayerPauseTime(playerid, value)
{
	player_trucker[playerid][pt_PauseTime] = value;
}

stock Trucker_GetPlayerPauseTime(playerid)
{
	return player_trucker[playerid][pt_PauseTime];
}
