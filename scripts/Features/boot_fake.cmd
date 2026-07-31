@echo off
:: ============================================================
::  boot_fake.cmd  -  A INICIALIZACAO
::
::  Agora usa dados REAIS da maquina (nome da CPU, memoria
::  instalada, usuario) misturados com linhas falsas. A mentira
::  gruda melhor quando esta encostada na verdade.
::
::  E le a memoria entre partidas: se o jogador ja jogou antes,
::  o boot nao e um boot, e uma RESTAURACAO de sessao.
::
::  Obs: nao usar o caractere de exclamacao neste arquivo, a
::  expansao atrasada do cmd come ele.
:: ============================================================
color 0f
cls

set "CpuReal="
:: (sem pipe de proposito: pipe dentro de for /f obriga escape com ^ e o
::  acento circunflexo vazaria para dentro do PowerShell)
for /f "delims=" %%c in ('powershell -NoProfile -Command "@(Get-CimInstance Win32_Processor)[0].Name.Trim()" 2^>nul') do set "CpuReal=%%c"
if not defined CpuReal set "CpuReal=UNKNOWN ENTITY"

set "RamReal="
for /f "delims=" %%r in ('powershell -NoProfile -Command "[int]((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory/1MB)" 2^>nul') do set "RamReal=%%r"
if not defined RamReal set "RamReal=16384"

echo BIOS DATE %date% %time:~0,8%  VER: 1.0.2
echo HOST: %COMPUTERNAME%
echo CPU : %CpuReal%
echo RAM : %RamReal% MB OK
echo.
echo LOADING KERNEL...

set /p "=Loading " <nul
for /L %%i in (1,1,20) do (
    set /p "=#" <nul
    powershell -NoProfile -c Start-Sleep -m 50
)
echo.
echo.
echo [OK] SYSTEM MOUNTED
echo [OK] USER DETECTED : %username%

if %Partidas% gtr 0 goto Retorno

echo [--] NO PREVIOUS SESSION
echo [??] SECURITY BREACH FOUND
echo.
timeout /t 3 >nul
cls
goto :EOF

:Retorno
:: --- O jogador ja esteve aqui antes ---
echo [OK] PREVIOUS SESSION FOUND
timeout /t 1 >nul
echo [OK] RESTORING SUBJECT %username% ... %Partidas%/%Partidas%
timeout /t 1 >nul
echo [OK] MEMORY INTACT
timeout /t 1 >nul
echo [??] SUBJECT DOES NOT REMEMBER
echo.
timeout /t 4 >nul
cls
goto :EOF
