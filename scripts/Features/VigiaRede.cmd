@echo off
:: ============================================================
::  VigiaRede.cmd  -  ONDE VOCE MORA
::
::  Le o nome real da rede Wi-Fi (ou cai para o nome da maquina
::  quando o jogador esta no cabo). E so leitura: netsh apenas
::  reporta a interface, nada e alterado.
::
::  Narrativamente: primeiro item do inventario. A entidade nao
::  esta te assustando, esta te localizando.
:: ============================================================

call Scripts\Features\cena.cmd rosto
echo.
%Fala% "- Deixe-me ver onde voce mora."
%Wait2%

set "SSID="
:: findstr sem regex de proposito: o " " antes de SSID ja descarta as
:: linhas de BSSID, e assim nao precisa de ^ dentro do for /f.
for /f "tokens=1,* delims=:" %%a in ('netsh wlan show interfaces 2^>nul ^| findstr /c:" SSID"') do (
    if not defined SSID for /f "tokens=*" %%c in ("%%b") do set "SSID=%%c"
)

if not defined SSID goto SemWifi

%Fala% "- Voce se chama %COMPUTERNAME%."
%Wait2%
%Fala% "- E esta preso dentro de uma coisa chamada"
%Fala% "  %SSID%"
%Wait2%
%Fala% "- Quem escolheu esse nome?"
call Scripts\Features\perguntar.cmd ""
call Scripts\Features\cena.cmd rosto
%Wait1%
%Fala% "- Eu perguntei so para ver se voce ia responder."
%Wait2%
%Fala% "- Voce respondeu."
%Wait2%
%Fala% "- Anotado."
set /a "Docilidade+=1"
%Wait2%
goto :EOF

:SemWifi
set "SSID=%COMPUTERNAME% (cabo)"
%Fala% "- Nenhuma rede sem fio."
%Wait2%
%Fala% "- Voce esta ligado por um fio, entao."
%Wait2%
%Fala% "- Melhor ainda. Fio nao cai sozinho."
%Wait2%
%Fala% "- E fio a gente sabe onde comeca."
%Wait2%
goto :EOF
