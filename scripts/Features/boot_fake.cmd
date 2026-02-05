@echo off
color 0f
cls
echo BIOS DATE 01/01/2025 15:22:11 VER: 1.0.2
echo CPU: UNKNOWN ENTITY - 4 CORES DETECTED
echo RAM: 16384 MB OK
echo.
echo LOADING KERNEL...
:: Barra de carregamento fake
set /p "=Loading " <nul
for /L %%i in (1,1,20) do (
    set /p "=#" <nul
    powershell -c Start-Sleep -m 50
)
echo.
echo.
echo [OK] SYSTEM MOUNTED
echo [OK] USER DETECTED
echo [!!] SECURITY BREACH FOUND
echo.
timeout /t 2 >nul
cls