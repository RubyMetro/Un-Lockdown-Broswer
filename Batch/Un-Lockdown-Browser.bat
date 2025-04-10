echo off
REM using "echo off" has the program run so that the commands being run do not show

title Un-Lockdown-Browser
REM sets the title of the cmd window
REM https://fixvx.com/popcrave/status/1909327101859189210?s=46

:choice
set /P c=Do you allow this program ability to edit your Windows Registry? [Y/N]
if /I "%c%" EQU "Y" goto :Approved
if /I "%c%" EQU "N" goto :Not_Approved
if /I "%c%" EQU "y" goto :Approved
if /I "%c%" EQU "n" goto :Not_Approved

:Approved

REM system keys
REM re-enables task manager
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 0 /f

REM explorer keys
REM deletes the "NoChangeStartMenu" setting
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoChangeStartMenu /f

REM: deletes the "NoClose" setting
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoClose /f

REM deletes the "NoLogOff" setting
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoLogOff /f

REM deletes the "NoDriveTypeAutoRun" setting
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoDriveTypeAutoRun /f

REM finish
echo Fix applied successfully, you may now close this window.

:Not_Approved
echo We're beating you with hammers
echo No changes were made, closing cmd in 5 seconds

REM Closes the window after 5 seconds "/nobreak" stops the user from using "ctrl+c" to cancel
timeout /t 5 /nobreak


