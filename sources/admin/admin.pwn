/*

	Author: ziggi

*/

#if defined _admin_included
	#endinput
#endif

#define _admin_included

stock SendClientMessageToAdmins(senderid, text[])
{
	new
		sender_name[MAX_PLAYER_NAME + 1],
		count;

	GetPlayerName(senderid, sender_name, sizeof(sender_name));

	foreach (new adminid : Player) {
		if (IsPlayerHavePrivilege(adminid, PlayerPrivilegeAdmin)) {
			Lang_SendText(adminid, "ADMIN_CHAT_MESSAGE_TO_ADMIN", sender_name, senderid, text);
			count++;
		}
	}

	if (count == 0) {
		Lang_SendText(senderid, "ADMIN_CHAT_NO_ADMIN");
	} else {
		Lang_SendText(senderid, "ADMIN_CHAT_PLAYER_TO_ADMIN", text);
	}
	return 0;
}

stock SendClientMessageToModers(senderid, text[])
{
	new
		sender_name[MAX_PLAYER_NAME + 1],
		count;

	GetPlayerName(senderid, sender_name, sizeof(sender_name));

	foreach (new adminid : Player) {
		if (IsPlayerHavePrivilege(adminid, PlayerPrivilegeModer)) {
			Lang_SendText(adminid, "ADMIN_CHAT_MESSAGE_TO_MODER", sender_name, senderid, text);
			count++;
		}
	}

	if (count == 0) {
		Lang_SendText(senderid, "ADMIN_CHAT_NO_MODER");
	} else {
		Lang_SendText(senderid, "ADMIN_CHAT_PLAYER_TO_MODER", text);
	}
	return 0;
}
