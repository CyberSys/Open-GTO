//
// Created:     17.09.06
// Aurthor:    Iain Gilbert
//
// Modified in 27.03.2010 by ZiGGi
//

#if defined _bank_included
#endinput
#endif

#define _bank_included
#pragma library bank

#include "base"
#include "player"

#define BanksCount 4
#define bank_FirstList_DialogID 5
#define bank_Withdraw_DialogID 6
#define bank_Deposit_DialogID 7

new Banks[BanksCount][CoordInfo] = {
	{-22.9578,-54.8951,1003.5469}, // LV 24/7 bank
	{371.2316,-125.5778,1001.4995}, // LS pizza bank
	{368.7201,-72.7097,1001.5078}, // LS burger bank7
	{364.9761,-8.5396,1001.8516} // LS chicken bank5
};
new BankPickup[BanksCount];
new ProfitCount = 2; // %
new MAX_BANK = 15000000;

stock BankSaveConfig()
{
	if(!ini_Exist(ConfigDB)) {new File:fhnd = fopen(ConfigDB,io_write);fclose(fhnd);}
	new file = ini_Open(ConfigDB);
	ini_SetInt(file,"BANK_ProfitCount",ProfitCount);
	ini_SetInt(file,"BANK_MAX_MONEY",MAX_BANK);
	ini_Close(file);
	return 1;
}

stock BankLoadConfig()
{
	if(!ini_Exist(ConfigDB)) {new File:fhnd = fopen(ConfigDB,io_write);fclose(fhnd);}
	new file = ini_Open(ConfigDB);
    ini_GetInt(file,"BANK_ProfitCount",ProfitCount);
    ini_GetInt(file,"BANK_MAX_MONEY",MAX_BANK);
	ini_Close(file);
	return 1;
}

stock bank_OnGameModeInit()
{
	BankLoadConfig();
	for(new bankid;bankid<BanksCount;bankid++)
	{
	    BankPickup[bankid] = CreatePickup(1274, 23, Banks[bankid][Coord_X],Banks[bankid][Coord_Y],Banks[bankid][Coord_Z], 0);
	}
	return 1;
}

stock bank_OnPlayerKeyStateChange(playerid,newkeys,oldkeys)
{
	#pragma unused oldkeys
	if(newkeys == KEY_USING)
	{
		if(!IsPlayerAtBank(playerid)) return 1;
		SendPlayerFormattedText(playerid,lang_texts[2][1],ProfitCount,COLOUR_GREEN);
		SendPlayerFormattedText(playerid,lang_texts[2][2],Player[playerid][Bank],COLOUR_GREEN);
		new string[MAX_STRING];
		format(string,sizeof(string),"���� �����, ������ �� ����� �����: %d$",Player[playerid][Bank]);
		return ShowPlayerDialog(playerid,bank_FirstList_DialogID,DIALOG_STYLE_LIST,string,"����� �������\n�������� ������","��","������");
	}
	return 1;
}

stock bank_OnDialogResponse(playerid,dialogid,response,listitem,inputtext[])
{
	new string[MAX_STRING];
	if(dialogid == bank_FirstList_DialogID)
	{
	    if(!response) return 1;
		switch(listitem)
		{
			case 0:
			{
				format(string,sizeof(string),"������� ����� ������� �� ������ ����� � ������ �����,\n ������ �� ����� �����: %d$",Player[playerid][Bank]);
				ShowPlayerDialog(playerid,bank_Withdraw_DialogID,DIALOG_STYLE_INPUT,"���� �����",string,"�����","�����");
			}
			case 1:
			{
				format(string,sizeof(string),"������� ����� ������� �� ������ �������� �� ��� ����,\n ������ �� ����� �����: %d$",Player[playerid][Bank]);
				ShowPlayerDialog(playerid,bank_Deposit_DialogID,DIALOG_STYLE_INPUT,"���� �����",string,"��������","�����");
			}
		}
		return 1;
	}
	if(dialogid == bank_Withdraw_DialogID)// ����� ������
	{
	    if(!response)
		{
			format(string,sizeof(string),"���� �����, ������ �� ����� �����: %d$",Player[playerid][Bank]);
			return ShowPlayerDialog(playerid,bank_FirstList_DialogID,DIALOG_STYLE_LIST,string,"����� �������\n�������� ������","��","������");
		}
		if(!isNumeric(inputtext) || strlen(inputtext) <= 0 || strval(inputtext) < 0)
		{
			SendClientMessage(playerid,COLOUR_RED,"�� �� ����� ��� ����� ����������� ���������� �����.");
			return 0;
		}
		new amount = strval(inputtext);
		if(amount > Player[playerid][Bank]) amount = Player[playerid][Bank];
		oGivePlayerMoney(playerid,amount,0);
		Player[playerid][Bank] -= amount;
		format(string,sizeof(string), lang_texts[2][6],amount,Player[playerid][Bank]);
		SendClientMessage(playerid,COLOUR_GREEN,string);
		new Float:playerx,Float:playery,Float:playerz;
		GetPlayerPos(playerid,playerx,playery,playerz);
		PlayerPlaySound(playerid,1084,playerx,playery,playerz);
		return 1;
	}
	if(dialogid == bank_Deposit_DialogID)// �������� ������
	{
	    if(!response)
		{
			format(string,sizeof(string),"���� �����, ������ �� ����� �����: %d$",Player[playerid][Bank]);
			return ShowPlayerDialog(playerid,bank_FirstList_DialogID,DIALOG_STYLE_LIST,string,"����� �������\n�������� ������","��","������");
		}
		if(!isNumeric(inputtext) || strlen(inputtext) <= 0 || strval(inputtext) < 0)
		{
			SendClientMessage(playerid,COLOUR_RED,"�� �� ����� ��� ����� ����������� ���������� �����.");
			return 0;
		}
		new amount = strval(inputtext);
		if(oGetPlayerMoney(playerid) < amount) amount = oGetPlayerMoney(playerid);
		if(Player[playerid][Bank] + amount > MAX_BANK) amount = MAX_BANK - Player[playerid][Bank];
		oGivePlayerMoney(playerid,-amount,0);
		Player[playerid][Bank] += amount;
		format(string,sizeof(string), lang_texts[2][10],amount,Player[playerid][Bank]);
		SendClientMessage(playerid,COLOUR_GREEN,string);
		new Float:playerx,Float:playery,Float:playerz;
		GetPlayerPos(playerid,playerx,playery,playerz);
		PlayerPlaySound(playerid,1083,playerx,playery,playerz);
		return 1;
	}
	return 1;
}

stock IsPlayerAtBank(playerid)
{
	for(new bankid;bankid<BanksCount;bankid++)
	{
		if(IsPlayerInRangeOfPoint(playerid,2,Banks[bankid][Coord_X],Banks[bankid][Coord_Y],Banks[bankid][Coord_Z])) return 1;
	}
	return 0;
}

stock Profit()
{
	for(new playerid;playerid<MAX_PLAYERS;playerid++)
	{
		Player[playerid][Bank] += (Player[playerid][Bank] / 100) * ProfitCount;
	}
	return 1;
}