//
// Made by ZiGGi
//


stock antirconhack_OnRconLoginAttempt(ip[], password[], success)
{
    if(!success)
    {
        printf("��������� ���� ������ � ip `%s`, ����������� ������: %s",ip, password);
        new pip[16];
		for(new i=GetMaxPlayers()-1;i>=0;--i)
        {
            GetPlayerIp(i, pip, sizeof(pip));
            if(!strcmp(ip, pip, true))
            {
                SendClientMessage(i,COLOUR_RED,"������������ ������. ����������!");
                Kick(i);
            }
        }
    }
	return 1;
}