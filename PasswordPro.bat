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
echo 欢迎使用PasswordEditPro！
pause
:ask
TITLE PasswordEditPro
set username=NotBeQueried
cls
echo 请问进入哪个模式？
echo --------
echo 查询模式（输入query）          修改模式（输入edit）默认(乱输)为query
set mode=query
set /p mode=回答：
IF %mode% equ query (goto query)
IF %mode% equ edit (goto edit)
:query
title PasswordEditPro - Query
set username=NotBeQueried
cls
echo 请注意！！！
echo 在查询前，请务必读以下内容！！！
echo 读完请按下回车。
notepad.exe warning.txt
pause
cls
:askusername
echo 下面是本机所有“账户名！”：
net user
set /p username=请输入你要查询的用户名：
cls
echo 以下是有关%username%的所有信息：
net user %username%
echo 请问这个账户是您忘记密码的账户吗？
echo 是为Yes不是为No
echo 默认为No
set y=No
set /p y=回答：
cls
IF %y% equ No (goto askusername)
IF %y% equ Yes (goto ask)
::########
:edit
cls
title PasswordEditPro - Edit
IF %username% equ NotBeQueried (goto nbqedit)
echo 请问%username%是您要修改密码的用户吗（显示的是用户名。）
echo 默认为Yes
set y=Yes
set /p y=回答：
IF %y% equ No (goto query)
cls
echo 账户名：%username%
set /p password=新密码：
echo 确认：账户名：%username%，密码：%password%
pause
net user %username% %password%
pause
exit
::####
:nbqedit
set /p username=用户名：
set /p password=密码：
echo 确认：账户名：%username%，密码：%password%
pause
net user %username% %password%
pause
exit