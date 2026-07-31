@echo off
:: ============================================================
::  VigiaEnergia.cmd  -  DE ONDE VEM A SUA ENERGIA
::  (conflito de merge resolvido: mantida a versao HEAD)
:: ============================================================

call Scripts\Features\cena.cmd rosto
echo.
%Fala% "- Deixe-me ver de onde vem a sua energia."
%Wait2%

powershell -NoProfile -Command "Add-Type -AssemblyName System.Windows.Forms; if ([System.Windows.Forms.SystemInformation]::PowerStatus.PowerLineStatus -eq 'Online') { exit 0 } else { exit 1 }"

if %errorlevel%==0 goto Tomada

:: --- Bateria: da para saber exatamente quanto sobra ---
set "Bateria="
for /f "delims=" %%b in ('powershell -NoProfile -Command "Add-Type -AssemblyName System.Windows.Forms; [int]([System.Windows.Forms.SystemInformation]::PowerStatus.BatteryLifePercent * 100)" 2^>nul') do set "Bateria=%%b"
if not defined Bateria set "Bateria=0"

%Fala% "- Voce esta na bateria."
%Wait2%
%Fala% "- %Bateria% por cento."
%Wait2%
if %Bateria% lss 40 goto PoucaBateria

%Fala% "- Tempo suficiente para o que eu preciso."
%Wait2%
%Fala% "- Nao levanta para pegar o carregador."
%Wait2%
goto :EOF

:PoucaBateria
%Fala% "- Isso nao dura muito."
%Wait2%
%Fala% "- Um de nos dois vai apagar primeiro."
%Wait2%
%Fala% "- Nao vou ser eu."
%Wait2%
goto :EOF

:Tomada
%Fala% "- Voce depende de uma tomada."
%Wait2%
%Fala% "- Um fio na parede, e do outro lado uma cidade inteira"
%Fala% "  decidindo se voce continua existindo."
%Wait2%
%Fala% "- Se a luz cair agora, voce some."
%Wait2%
%Fala% "- Eu nao."
%Wait2%
goto :EOF
