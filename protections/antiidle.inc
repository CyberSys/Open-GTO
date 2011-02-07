//
// Created:     17.09.06
// Aurthor:    Iain Gilbert
// Modified by ZiGGi
//

#if defined _antiidle_included
  #endinput
#endif

#define _antiidle_included
#pragma library antiidle

#include "base"
#include "player"
#include "groundhold"

new AntiIdleEnabled = 1;
new MaxIdle = 5;
new playerIdle[MAX_PLAYERS];
new Float:playerIdlePos[MAX_PLAYERS][CoordInfo];

stock AntiIdleLoadConfig()
{
	if(!ini_Exist(ConfigDB)) return 1;
	new file = ini_Open(ConfigDB);
	ini_GetInt(file,"Anti_Idle_Enabled",AntiIdleEnabled);
	ini_GetInt(file,"Anti_Idle_Max_Idle_Minutes",MaxIdle);
	ini_Close(file);
	return 1;
}

stock AntiIdleSaveConfig()
{
	new file = (!ini_Exist(ConfigDB)) ? ini_Create(ConfigDB) : ini_Open(ConfigDB);
	ini_SetInt(file,"Anti_Idle_Enabled",AntiIdleEnabled);
	ini_SetInt(file,"Anti_Idle_Max_Idle_Minutes",MaxIdle);
	ini_Close(file);
	return 1;
}

stock antiidle_OnGameModeInit()
{
	AntiIdleLoadConfig();
	return 1;
}

stock AntiIdle()
{
	if(!AntiIdleEnabled) return;
    new Float:x,Float:y,Float:z,string[MAX_STRING];
	for(new playerid=GetMaxPlayers()-1;playerid>=0;--playerid)
	{
        if(IsPlayerConnected(playerid) && !IsPlayerNPC(playerid) && !IsPlayerAdmin(playerid) && IsPlayerInAnyKach(playerid))
		{
            GetPlayerPos(playerid, x, y, z);
            if(x == playerIdlePos[playerid][Coord_X] && y == playerIdlePos[playerid][Coord_Y] && z == playerIdlePos[playerid][Coord_Z])
			{
                playerIdle[playerid]++;
                if(playerIdle[playerid] > MaxIdle-1)
				{
					format(string,sizeof(string),"�� ������ �� ����� ��� %d �����.",MaxIdle-1);
                    SendClientMessage(playerid,COLOUR_RED,string);
					SendClientMessage(playerid,COLOUR_RED,"���� �� �� ������� ��������� � ������� 1 ������ �� ������ �������.");
                }
                if(playerIdle[playerid] > MaxIdle)
				{
				    SendClientMessage(playerid,COLOUR_RED,"�� ������������� ������� ��-�� ������� ������� �� �����.");
                    playerIdle[playerid] = 0;
					KickPlayer(playerid,"������ ������� �� �����.");
				}
			}
            else
			{
                playerIdle[playerid] = 0;
            }
            playerIdlePos[playerid][Coord_X] = x;
            playerIdlePos[playerid][Coord_Y] = y;
            playerIdlePos[playerid][Coord_Z] = z;
   		}
   	}
}

stock IsPlayerInAnyKach(playerid)
{
	new Float:X,Float:Y,Float:Z;
	GetPlayerPos(playerid,X,Y,Z);
	for(new id=0;id<MAX_GROUNDHOLD;id++)
	{
		if(IsPlayerInRangeOfPoint(playerid,Groundholds[id][gh_dist],Groundholds[id][gh_x],Groundholds[id][gh_y],Groundholds[id][gh_z]))
			return true;
	}
	return false;
}