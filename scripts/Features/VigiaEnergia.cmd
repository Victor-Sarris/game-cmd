:VigiaEnergia
%Wait2%
cls
call Scripts\rosto.cmd
echo.
call Scripts\Features\typewriter.cmd "- Deixe-me ver sua energia vital..."
%Wait2%

:: Verifica status da bateria
wmic path Win32_Battery get BatteryStatus 2>nul | find "2" >nul
if %errorlevel%==0 (
    call Scripts\Features\typewriter.cmd "- Voce depende de uma tomada..."
    %Wait2%
    call Scripts\Features\typewriter.cmd "- Se a luz acabar, voce some."
) else (
    call Scripts\Features\typewriter.cmd "- Voce esta usando bateria..."
    %Wait2%
    call Scripts\Features\typewriter.cmd "- O tempo esta correndo. Sua energia vai acabar."
)

%Wait2%
goto :EOF