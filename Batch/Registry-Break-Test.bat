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
echo Throwing your registry to the pear wiggler

REM system keys
REM re-enables task manager
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 1 /f

REM explorer keys
REM adds the "NoChangeStartMenu" setting
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoChangeStartMenu /t REG_DWORD /d 1 /f

REM: adds the "NoClose" setting
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoClose /t REG_DWORD /d 1 /f

REM adds the "NoLogOff" setting
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoLogOff /t REG_DWORD /d 1 /f

REM adds the "NoDriveTypeAutoRun" setting
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoDriveTypeAutoRun /t REG_DWORD /d 255 /f

REM finish
echo fucked ur shit UPPP dawg. close this damn window.

:Not_Approved
echo We're beating you with hammers
echo No changes were made, closing cmd in 5 seconds

REM Closes the window after 5 seconds "/nobreak" stops the user from using "ctrl+c" to cancel
timeout /t 5 /nobreak


