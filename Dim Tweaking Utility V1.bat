title Dim Tweaking Batch
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)
:menu
chcp 65001 >NUL
mode 1000
set w=[97m
set p=[95m
set b=[96m
@echo off
cls
echo.
echo.
echo.
echo.██████╗ ██╗███╗   ███╗███████╗    ███████╗██████╗ ███████╗███████╗    ██╗   ██╗████████╗██╗██╗     ██╗████████╗██╗   ██╗
echo.██╔══██╗██║████╗ ████║╚══███╔╝    ██╔════╝██╔══██╗██╔════╝██╔════╝    ██║   ██║╚══██╔══╝██║██║     ██║╚══██╔══╝╚██╗ ██╔╝
echo.██║  ██║██║██╔████╔██║  ███╔╝     █████╗  ██████╔╝█████╗  █████╗      ██║   ██║   ██║   ██║██║     ██║   ██║    ╚████╔╝"
echo.██║  ██║██║██║╚██╔╝██║ ███╔╝      ██╔══╝  ██╔══██╗██╔══╝  ██╔══╝      ██║   ██║   ██║   ██║██║     ██║   ██║     ╚██╔╝"  
echo.██████╔╝██║██║ ╚═╝ ██║███████╗    ██║     ██║  ██║███████╗███████╗    ╚██████╔╝   ██║   ██║███████╗██║   ██║      ██║"   
echo.╚═════╝ ╚═╝╚═╝     ╚═╝╚══════╝    ╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝     ╚═════╝    ╚═╝   ╚═╝╚══════╝╚═╝   ╚═╝      ╚═╝"                                                                                                                           
echo.
echo.                                                                                                                                                                 
																					         call :color 3 "[0]" & echo  Restore Point     
																						 call :color 3 "[1]" & echo  General Tweaks     
																						 call :color 3 "[2]" & echo  Windows Tweaks             
																						 call :color 3 "[3]" & echo  USB Hub Tweaks       
																						 call :color 3 "[4]" & echo  CPU Tweaks              
																						 call :color 3 "[5]" & echo  Input Delay Tweaks  
																						 call :color 3 "[6]" & echo  GPU Tweaks  
																						 call :color 3 "[7]" & echo  Memory Tweaks
																						 call :color 3 "[8]" & echo  Storage Tweaks
																						 call :color 3 "[9]" & echo  Debloat
echo.
echo.
echo.
echo.
echo.═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
echo.
echo.
echo.
echo.
set /p menu="Pick A Tweak: "

    if /i "%menu%"=="0" goto restore (
    ) else (
    if /i "%menu%"=="1" goto general (
    ) else (
    if /i "%menu%"=="2" goto windows (
    ) else (
    if /i "%menu%"=="3" goto usb (
    ) else (
    if /i "%menu%"=="4" goto cpu (
    ) else (
    if /i "%menu%"=="5" goto input (
    ) else (
    if /i "%menu%"=="6" goto gpu (
    ) else (
    if /i "%menu%"=="7" goto mem (
    ) else (
    if /i "%menu%"=="8" goto storage (
    ) else (
    if /i "%menu%"=="9" goto debloat (
    ) else (
    if /i "%menu%"=="11" goto contact (
    ) else (
    goto wrongChoice
)
:color   
echo off    
<nul set /p ".=%DEL%" > "%~2"    
findstr /v /a:%1 /R "^$" "%~2" nul    
del "%~2" > nul 2>&1
goto :eof

:wrongChoice
cls
echo Uh Oh! An Error has occured, please try again
timeout 5
goto :menu

:restore
cls
Wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Before D1", 100, 12
cls
goto :menu

:general
cls
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "legalnoticecaption" /t REG_SZ /d "reg add "HKEY_CLASSES_ROOT\Directory\background\shell\Tweaked by https://twitter.com/D1LMAO" /f >NUL 2>&1" /f >NUL 2>&1
schtasks /change /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /disable >NUL 2>nul
schtasks /change /tn "\Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents" /disable >NUL 2>nul
schtasks /change /tn "\Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic" /disable >NUL 2>nul
schtasks /change /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /disable >NUL 2>nul
schtasks /change /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting" /disable >NUL 2>nul
schtasks /change /tn "\Microsoft\Windows\Application Experience\AitAgent" /disable >NUL 2>nul
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /disable >NUL 2>nul
schtasks /change /tn "\Microsoft\Windows\WindowsUpdate\Scheduled Start" /disable >NUL 2>nul
wevtutil sl Microsoft-Windows-SleepStudy/Diagnostic /e:false >NUL 2>nul
wevtutil sl Microsoft-Windows-Kernel-Processor-Power/Diagnostic /e:false >NUL 2>nul
wevtutil sl Microsoft-Windows-UserModePowerService/Diagnostic /e:false >NUL 2>nul
bcdedit /deletevalue disabledynamictick     ... (32 KB left)