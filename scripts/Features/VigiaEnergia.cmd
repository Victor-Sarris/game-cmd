:VigiaEnergia
%Wait2%
cls
call Scripts\rosto.cmd
echo.
echo - Deixe-me ver sua energia vital...
%Wait2%

:: Verifica status da bateria
wmic path Win32_Battery get BatteryStatus 2>nul | find "2" >nul
if %errorlevel%==0 (
    echo - Voce depende de uma tomada...
    %Wait2%
    echo - Se a luz acabar, voce some.
) else (
    echo - Voce esta usando bateria...
    %Wait2%
    echo - O tempo esta correndo. Sua energia vai acabar.
)

%Wait2%
goto :EOF