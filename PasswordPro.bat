::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZks0
::ZQ05rAF9IBncCkqN+0xwdVsGAlTi
::ZQ05rAF9IAHYFVzEqQIAKQhHWwuQOE6+D6Es+ueb
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQK199DSodMG46U88myZJw58LwsAWKmanAm6omC7
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wCRdYSQq2PWWNA7w+54g=
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCuDJHiI+Ec+r++cyuxVuY1fg3vF1G46A2N6YHEtVfEsb4DJ3oScL64W8kCE
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
title PasswordEditPro GettingAdmin.....
echo Getting Admin...
echo Please allow the UAC warning.
Net session >nul 2>&1 || mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0","","runas",1)(window.close)&&exit
::###
cls
title PasswordEditPro Setup
:welcome
echo ��ӭʹ��PasswordEditPro��
pause
:ask
TITLE PasswordEditPro
set username=NotBeQueried
cls
echo ���ʽ����ĸ�ģʽ��
echo --------
echo ��ѯģʽ������query��          �޸�ģʽ������edit��Ĭ��(����)Ϊquery
set mode=query
set /p mode=�ش�
IF %mode% equ query (goto query)
IF %mode% equ edit (goto edit)
:query
title PasswordEditPro - Query
set username=NotBeQueried
cls
echo ��ע�⣡����
echo �ڲ�ѯǰ������ض��������ݣ�����
echo �����밴�»س���
notepad.exe warning.txt
pause
cls
:askusername
echo �����Ǳ������С��˻���������
net user
set /p username=��������Ҫ��ѯ���û�����
cls
echo �������й�%username%��������Ϣ��
net user %username%
echo ��������˻���������������˻���
echo ��ΪYes����ΪNo
echo Ĭ��ΪNo
set y=No
set /p y=�ش�
cls
IF %y% equ No (goto askusername)
IF %y% equ Yes (goto ask)
::########
:edit
cls
title PasswordEditPro - Edit
IF %username% equ NotBeQueried (goto nbqedit)
echo ����%username%����Ҫ�޸�������û�����ʾ�����û�������
echo Ĭ��ΪYes
set y=Yes
set /p y=�ش�
IF %y% equ No (goto query)
cls
echo �˻�����%username%
set /p password=�����룺
echo ȷ�ϣ��˻�����%username%�����룺%password%
pause
net user %username% %password%
pause
exit
::####
:nbqedit
set /p username=�û�����
set /p password=���룺
echo ȷ�ϣ��˻�����%username%�����룺%password%
pause
net user %username% %password%
pause
exit