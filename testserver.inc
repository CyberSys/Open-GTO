//
// Created:		04.10.06
// Aurthor:		Iain Gilbert
// Updated in 27.03.2010 by ZiGGi

#if defined _testserver_included
	#endinput
#endif

#define _testserver_included
#pragma library testserver

#include "base"

stock testserver_OnPlayerConnect(playerid)
{
	new string[MAX_STRING];
	format(string,sizeof(string),"����� ���������� � Grand Theft Online %s",VERSION)
	SendPlayerScrollingText(playerid,string);
	SendPlayerScrollingText(playerid,"���� ������ ����� ��������� ���������, ������� �������� ��.");
	SendPlayerScrollingText(playerid,"��� ����� ��������� ��������� � ���� GTO ����� ������������� �����.");
	SendPlayerScrollingText(playerid,"������, �����, ���������� - ��� ������� ���� ��� ��������� ������.");
	SendPlayerScrollingText(playerid,"���� �� ������� ��, ���� �������� ���� ��� � ��� ���� �����������, �� ���������� �������������� �������.");
}