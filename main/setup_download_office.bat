::Download and configure Office
::Office Deployment Tool
:: Semmyk: https://github.com/semmyk-research

@echo off
:Quote
echo (
echo If you limit your choices only to what seems possible or reasonable, ...
echo you disconnect yourself from what you truly want, ...
echo and all that is left is compromise - Robert Fritz
echo )

::REM setup.exe /Office_download download-Office365-x64.xml
::REM setup.exe /Office_download configure-Office365-x64.xml

::REM CHOICE [/c [choiceKeys]] [/N] [/CS] [/t Timeout /D Choice] [/M Text] key
::REM Assist: https://ss64.com/nt/choice.html
::REM Assist: https://ss64.com/nt/start.html

:: ===================================

ECHO "Semmyk: Office deployment toolkit

@echo off
setlocal EnableExtensions DisableDelayedExpansion

:SetDefault
set "_InstallMode=D"
REM alternate | set _InstallOption=D
::REM Apparently not required except if path is not in the same folder | set "_OfficePath=Office_download"
set "_OfficePath="

::Display installation options
:Options
echo (
echo D ... Download
echo C ... Configure
echo U ... Update
echo )

::Check of CHOICE is available, else fallback to manually use SET only 
:Choice
if exist %SystemRoot%\System32\choice.exe goto OptionChoice
else goto OptionSelect

::Set installation option using CHOICE
:OptionChoice
choice /C DCU /CS /M "Select D to Download | C to Configure | U to Update"
REM if %errorlevel% equ 0 set _InstallOption=D
REM if %errorlevel% equ 1 set _InstallOption=C
REM if %errorlevel% equ 2 set _InstallOption=U

if %errorlevel% equ 1 goto Download
if %errorlevel% equ 2 goto Configure
if %errorlevel% equ 3 goto Update

::Set to Download mode
:Download
echo "setting download mode"
set _InstallMode=download
set /p "_ConfigFile=Please enter configuration file excluding extension:" || set "_ConfigFile=download-Office365-x64"
set  "_ConfigFile=%_ConfigFile%.xml"
REM echo "Selected option:: Download | config:: %_ConfigFile%  | Office install from:%_OfficePath%"
echo "Selected option:: Download | config:: %_ConfigFile%"
goto Setup

::Set to Configuration (installation) mode
:Configure
echo "setting configuration mode"
set _InstallMode=configure
set /p "_ConfigFile=Please enter configuration file excluding extension:" || set "_ConfigFile=configuration-Office365-x64"
set  "_ConfigFile=%_ConfigFile%.xml"
echo "Selected: option:=Configure | config:=%_ConfigFile% "
goto Setup

::Set to Update mode
:Update
echo "setting update mode"
set _InstallMode=update
set /p "ConfigFile=Please enter configuration file excluding extension:" || set "_ConfigFile=update-Office365-x64"
set  "_ConfigFile=%_ConfigFile%.xml"
echo "Selected: option:=Update | config:=%_ConfigFile%"
goto Setup

::Run setup
:Setup
echo "starting setup | %_InstallMode% | using: %_ConfigFile% | from: %_OfficePath% folder"
start "Office Install" /wait ""setup.exe /%_InstallMode% %_configFile%""
REM "setup.exe /%_OfficeMode% %_configFile%"


REM =====================================
:exit
echo "setup completed | %_InstallMode% | %_ConfigFile%"

endlocal