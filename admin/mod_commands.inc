//
// Created: 18.12.2007
// Aurthor: Dmitry Frolov (FP)
//

#if defined _mod_commands_included
#endinput
#endif

#define _mod_commands_included
#pragma library mod_commands
#include "base"
#include "player"

stock Mod_OnPlayerCommandText(playerid,text[]) // process player commands
{
	if(!IsPlayerConnected(playerid)) return 0;
	if(!IsPlayerMod(playerid) && !IsPlayerAdmin(playerid) && !IsPlayerAdm(playerid)) return 0;
	new cmd[20],idx;	
	set(cmd,strcharsplit(text, idx,strchar(" ")));
	if(!strcmp(cmd, "/cmdlist", true))
	{
		SendMessageToAdmins(playerid,COLOUR_LIGHTGREEN, text);
		SendClientMessage(playerid, COLOUR_LIGHTGREEN, "M: '/carresp', '/remcar <ID>', '/kick <ID>'");
		SendClientMessage(playerid, COLOUR_LIGHTGREEN, "M: '/cmdlist', '/about', '/mute <ID> <Time>', '/unmute <ID>', '/jail <ID>', '/unjail <ID>', '/plist'");
	}
	if(!strcmp(cmd,"/about",true))
	{
		SendMessageToAdmins(playerid,COLOUR_LIGHTGREEN,text);
		SendClientMessage(playerid,COLOUR_LIGHTGREEN,lang_texts[15][41]);
		SendClientMessage(playerid,COLOUR_LIGHTGREEN,lang_texts[15][42]);
		SendClientMessage(playerid,COLOUR_LIGHTRED,lang_texts[15][43]);
		SendClientMessage(playerid,COLOUR_LIGHTRED,lang_texts[15][44]);
	}
	if(!strcmp(cmd, "/plist", true))
	{
		SendMessageToAdmins(playerid,COLOUR_LIGHTGREEN, text);
		SendClientMessage(playerid,COLOUR_YELLOW,lang_texts[15][46]);
		new ccount;
		for(new id=0;id<MAX_PLAYERS;id++)
		{
			if(IsPlayerConnected(id) && Player[id][Jailed] == 1)
			{
				new string[MAX_STRING];
				if(Player[id][JailTime] > 0) format(string,sizeof(string),lang_texts[18][3],oGetPlayerName(id),id,Player[id][JailTime]);
				else format(string,sizeof(string),lang_texts[18][4],oGetPlayerName(id),id);
				SendClientMessage(playerid,COLOUR_LIGHTRED,string);
				ccount++;
			}
			if(IsPlayerConnected(id) && Player[id][MuteTime] != 0)
			{
				new string[MAX_STRING];
				if(Player[id][MuteTime] != 0) format(string,sizeof(string),lang_texts[18][5],oGetPlayerName(id),id,Player[id][MuteTime]);
				else format(string,sizeof(string),lang_texts[18][6],oGetPlayerName(id),id);
				SendClientMessage(playerid,COLOUR_LIGHTGREEN,string);
				ccount++;
			}
		}
		if(ccount==0) SendClientMessage(playerid,COLOUR_XP_GOOD,lang_texts[18][7]);
		return 1;
	}
	if(!strcmp(cmd, "/remcar", true))
	{
		SendMessageToAdmins(playerid,COLOUR_LIGHTGREEN, text);
		new receiverid = strval(strcharsplit(text, idx,strchar(" ")));
		if(receiverid < 0 || (receiverid >= MAX_PLAYERS) || IsPlayerAdmin(receiverid))
		{
			SendPlayerFormattedText(playerid,lang_texts[12][2],0,COLOUR_RED);
			return 1;
		}
		if(IsPlayerConnected(receiverid) == 0)
		{
			SendPlayerFormattedText(playerid,lang_texts[12][3],0,COLOUR_RED);
			return 1;
		}
		if(IsPlayerInAnyVehicle(receiverid))
		{
			RemovePlayerFromVehicle(receiverid);
			new string[MAX_STRING];
			format(string,sizeof(string),lang_texts[12][64],oGetPlayerName(receiverid),receiverid);
			SendPlayerFormattedText(playerid,string,0,COLOUR_XP_GOOD);
			format(string,sizeof(string),lang_texts[12][65],oGetPlayerName(playerid));
			SendPlayerFormattedText(receiverid,string,0,COLOUR_XP_GOOD);
			return 1;
		} 
		else 
		{
			new string[MAX_STRING];
			format(string,sizeof(string),lang_texts[12][73],oGetPlayerName(receiverid),receiverid);
			SendPlayerFormattedText(playerid,string,0,COLOUR_RED);
			return 1;
		}
	}
	if(!strcmp(cmd,"/kick",true))
	{
		SendMessageToAdmins(playerid,COLOUR_LIGHTGREEN,text);
		new receiverid = INACTIVE_PLAYER_ID;
		receiverid = strval(strcharsplit(text, idx,strchar(" ")));
		if((receiverid < 0) || (receiverid >= MAX_PLAYERS) || (IsPlayerAdmin(receiverid) && !IsPlayerAdmin(playerid)) )
		{
			SendPlayerFormattedText(playerid,lang_texts[12][2],0,COLOUR_RED);
			return 1;
		}
		if(IsPlayerConnected(receiverid) == 0)
		{
			SendPlayerFormattedText(playerid,lang_texts[12][3],0,COLOUR_RED);
			return 1;
		}
		new string[MAX_STRING];
		format(string,sizeof(string),lang_texts[12][60],oGetPlayerName(receiverid),receiverid);
		SendPlayerFormattedText(playerid,string,0,COLOUR_XP_GOOD);
		format(string,sizeof(string),lang_texts[12][61],oGetPlayerName(receiverid),receiverid);
		SendClientMessageToAll(COLOUR_WHITE,string);
		Kick(receiverid);
		return 1;
	}
	if((!strcmp(cmd,"/carresp",true)) && IsPlayerInAnyVehicle(playerid))
	{
		SendMessageToAdmins(playerid,COLOUR_LIGHTGREEN, text);
		//SetVehicleHealth(GetPlayerVehicleID(playerid), 1.0);
		SetVehicleToRespawn(GetPlayerVehicleID(playerid));
		new string[MAX_STRING];
		format(string,sizeof(string), "*** �������� (�� %d) ��������� �� ���� �������.", GetPlayerVehicleID(playerid) );
		SendPlayerFormattedText(playerid,string, 0,COLOUR_WHITE);
	}
	if(!strcmp(cmd,"/mute",true))
	{
		SendMessageToAdmins(playerid,COLOUR_LIGHTGREEN, text);
		new muteid = strval(strcharsplit(text, idx,strchar(" ")));
		if((muteid < 0) || (muteid >= MAX_PLAYERS))
		{
			SendPlayerFormattedText(playerid,lang_texts[12][2],0,COLOUR_RED);
			return 1;
		}
		new mutetime = strval(strcharsplit(text, idx,strchar(" ")));
		if(IsPlayerConnected(muteid) == 1)
		{
			new string[MAX_STRING];
			format(string, sizeof(string)," %s ������� %s �� %d �����",oGetPlayerName(playerid),oGetPlayerName(muteid),mutetime);
			SendClientMessageToAll(COLOUR_YELLOW,string);
		}
		if(mutetime < 1)
		{
			SendPlayerFormattedText(playerid," �� ���������� ����� �������!������� '/mute <id> <minutes>'", 0,COLOUR_RED);
			return 1;
		}
		Player[muteid][MuteTime] = mutetime;
		Player[muteid][Muted]++;               // ������� ��� ����� �������� ������.
		new string[MAX_STRING];
		format(string,sizeof(string),lang_texts[12][24],oGetPlayerName(playerid));
		SendPlayerFormattedText(muteid,string,0,COLOUR_RED);
		format(string,sizeof(string),lang_texts[12][50],oGetPlayerName(muteid));
		SendClientMessageToAll(COLOUR_WHITE,string);
		return 1;
	}
	if(!strcmp(cmd, "/unmute", true))
	{
		SendMessageToAdmins(playerid,COLOUR_LIGHTGREEN, text);
		new unmuteid = strval(strcharsplit(text, idx,strchar(" ")));
		if((unmuteid < 0) || (unmuteid >= MAX_PLAYERS))
		{
			SendPlayerFormattedText(playerid,lang_texts[12][25],0,COLOUR_RED);
			return 1;
		}
		if(IsPlayerConnected(unmuteid) == 0)
		{
			SendPlayerFormattedText(playerid,lang_texts[12][26],0,COLOUR_RED);
			return 1;
		}
		Player[unmuteid][MuteTime] = 0;
		new string[MAX_STRING];
		format(string,sizeof(string),lang_texts[12][27],oGetPlayerName(playerid));
		SendPlayerFormattedText(unmuteid,string, 0,COLOUR_GREEN);
		//GIVE UNMUTE INFO
		SetPlayerWantedLevel(unmuteid, 0);
		format(string,sizeof(string),lang_texts[12][51],oGetPlayerName(unmuteid));
		//GameTextForAll(string,5000,4);
		SendClientMessageToAll(COLOUR_WHITE, string);
		printf("SERVER : %s Has Been UNMuted by %s",oGetPlayerName(unmuteid),oGetPlayerName(playerid));
		return 1;
	}

	//��������! - ���������� � ������ ��� "���������" - �� ������ ������ ��� - �� �������, �� �������������!
	if(!strcmp(cmd,"/jail",true))
	{
		SendMessageToAdmins(playerid,COLOUR_LIGHTGREEN, text);
		new jailid = strval(strcharsplit(text, idx,strchar(" ")));
		if((jailid < 0) || (jailid >= MAX_PLAYERS) || (IsPlayerAdmin(jailid) && !IsPlayerAdmin(playerid)) || (IsPlayerAdm(jailid) && IsPlayerMod(playerid)) )
		{
			SendPlayerFormattedText(playerid,lang_texts[12][2],0,COLOUR_RED);
			return 1;
		}
		if(IsPlayerConnected(jailid) == 0)
		{
			SendPlayerFormattedText(playerid,lang_texts[12][3],0,COLOUR_RED);
			return 1;
		}
		static jailt=4320;
		jailt = strval(strcharsplit(text, idx,strchar(" ")));
		if(jailt>1 && jailt<=4320) Player[jailid][JailTime] = jailt;
		Player[jailid][Jailed] = 1;
		new string[MAX_STRING];
		format(string,sizeof(string),lang_texts[12][18],oGetPlayerName(playerid));
		SendPlayerFormattedText(jailid,string, 0,COLOUR_RED);
		format(string,sizeof(string),"~r~%s ~w~has been Jailed",oGetPlayerName(jailid));
		GameTextForAll(string,5000,4);
		new string2[40];
		if(jailt > 1 && jailt<=4320) format(string2,sizeof(string2),"%d ���",jailt);
		else format(string2,sizeof(string2),"����������");
		format(string,sizeof(string),"SERVER: %s ��� ��������� �� %s �����",oGetPlayerName(jailid),string2);
		SendClientMessageToAll(COLOUR_WHITE,string);
		JailPlayer(jailid);
		return 1;
	}
	if(!strcmp(cmd, "/unjail", true))
	{
		SendMessageToAdmins(playerid,COLOUR_LIGHTGREEN, text);
		new unjailid = strval(strcharsplit(text, idx,strchar(" ")));
		if(unjailid < 0 || unjailid >= MAX_PLAYERS || (IsPlayerAdmin(unjailid) && !IsPlayerAdmin(playerid)) || (IsPlayerAdm(unjailid) && IsPlayerMod(playerid)))
		{
			SendPlayerFormattedText(playerid,lang_texts[12][19],0,COLOUR_RED);
			return 1;
		}
		if (IsPlayerConnected(unjailid) == 0)
		{
			SendPlayerFormattedText(playerid,lang_texts[12][20],0,COLOUR_RED);
			return 1;
		}
		Player[unjailid][Jailed] = 0;
		Player[unjailid][JailTime] = 0;
		new string[MAX_STRING];
		format(string,sizeof(string),lang_texts[12][21],oGetPlayerName(playerid));
		SendPlayerFormattedText(unjailid,string, 0,COLOUR_GREEN);
		UnJailPlayer(unjailid);
		return 1;
	}
	if(!strcmp(cmd,"/mole",true))
	{
		SendMessageToAdmins(playerid,COLOUR_LIGHTGREEN,text);
		new string[MAX_STRING];
		set(string,text);
		strdel(string,0,idx);
		format(string,sizeof(string),lang_texts[12][93],string);
		SendClientMessageToAll(COLOUR_BLUE,string);
		return 1;
	}
	return 0;
}

stock ModSpecial_OnPlayerText(playerid,text[])
{
	if (!IsPlayerConnected(playerid)) return 0;
	if(text[0] == '#')
	{
		new string[MAX_STRING];
		strmid(string,text,1,strlen(text));
		new count = 0;
		for(new adminid=0; adminid<MAX_PLAYERS;adminid++)
		{
			if(IsPlayerMod(adminid))
			{
				new message[MAX_STRING];
				format(message,sizeof(message), lang_texts[12][79] ,oGetPlayerName(playerid),string);
				SendPlayerFormattedText(adminid,message, 0,COLOUR_RED);
				count++;
			}
		}
		if(count == 0)
		{
			SendPlayerFormattedText(playerid, lang_texts[12][80] , 0,COLOUR_RED);
			return 0;
		} 
		else 
		{
			new message[MAX_STRING];
			format(message,sizeof(message), lang_texts[12][81] ,string);
			SendPlayerFormattedText(playerid,message, 0,COLOUR_GREEN);
			return 0;
		}
	}
	return 0;
}