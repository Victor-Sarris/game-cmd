:VigiaEnergia
%Wait2%
cls
color a
call Scripts\rosto.cmd
echo.
call Scripts\Features\typewriter.cmd "- Deixe-me ver seu tipo de dispositivo..."
%Wait2%

powershell -command "Add-Type -AssemblyName System.Windows.Forms; if ([System.Windows.Forms.SystemInformation]::PowerStatus.PowerLineStatus -eq 'Online') { exit 0 } else { exit 1 }"

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