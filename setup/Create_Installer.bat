@echo off
cls
Title Creating MediaPortal RadioTime Installer

if "%programfiles(x86)%XXX"=="XXX" goto 32BIT
	:: 64-bit
	set PROGS=%programfiles(x86)%
	goto CONT
:32BIT
	set PROGS=%ProgramFiles%	
:CONT

IF NOT EXIST "%PROGS%\Team MediaPortal\MediaPortal\" SET PROGS=C:

:: Get version from DLL
FOR /F "tokens=*" %%i IN ('Tools\sigcheck.exe /accepteula /nobanner /n "..\RadioTimePlugin\bin\Release\RadioTimePlugin.dll"') DO (SET version=%%i)

:: Temp xmp2 file
copy RadioTime.xmp2 RadioTimeTemp.xmp2

:: Build MPE1
"%PROGS%\Team MediaPortal\MediaPortal\MPEMaker.exe" RadioTimeTemp.xmp2 /B /V=%version% /UpdateXML

:: Cleanup
del RadioTimeTemp.xmp2
