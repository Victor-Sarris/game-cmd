@echo off
:: ============================================================
::  VigiaCamera.cmd  -  O OLHO
::
::  Pergunta ao Windows QUAIS dispositivos de imagem e audio
::  existem. So o nome, so a lista.
::
::  A camera NAO e ligada, aberta ou acessada em momento nenhum
::  e isso e proposital: a cena e mais forte assim. O terror aqui
::  e o jogador saber que ela poderia ser ligada, e ficar olhando
::  para a luzinha apagada pelo resto da partida.
:: ============================================================

call Scripts\Features\cena.cmd rosto
echo.
%Fala% "- Falta uma coisa no seu cadastro."
%Wait2%

del /q "%temp%\carpedim_cam.txt" 2>nul
del /q "%temp%\carpedim_mic.txt" 2>nul

powershell -NoProfile -Command "$d = Get-CimInstance Win32_PnPEntity -ErrorAction SilentlyContinue | Where-Object { $_.PNPClass -eq 'Camera' -or $_.PNPClass -eq 'Image' } | Select-Object -First 1 -ExpandProperty Name; if($d){ Set-Content -Path (Join-Path $env:TEMP 'carpedim_cam.txt') -Value $d }" 2>nul

powershell -NoProfile -Command "$d = Get-CimInstance Win32_PnPEntity -ErrorAction SilentlyContinue | Where-Object { $_.PNPClass -eq 'AudioEndpoint' -and $_.Name -match 'Microfone|Microphone|Mic' } | Select-Object -First 1 -ExpandProperty Name; if($d){ Set-Content -Path (Join-Path $env:TEMP 'carpedim_mic.txt') -Value $d }" 2>nul

set "Camera="
set "Microfone="
if exist "%temp%\carpedim_cam.txt" set /p "Camera="<"%temp%\carpedim_cam.txt"
if exist "%temp%\carpedim_mic.txt" set /p "Microfone="<"%temp%\carpedim_mic.txt"
del /q "%temp%\carpedim_cam.txt" 2>nul
del /q "%temp%\carpedim_mic.txt" 2>nul

if not defined Camera goto SemCamera

%Wait2%
%Fala% "- Existe uma camera ligada em voce."
%Wait2%
%Fala% "  %Camera%"
%Wait5%
call Scripts\Features\cena.cmd rostog c
%Fala% "- Eu nao vou liga-la."
%Wait2%
call Scripts\Features\cena.cmd rosto a
%Fala% "- Nao precisa. Ja consegui o que queria."
%Wait2%
%Fala% "- Voce acabou de olhar para ela."
%Wait5%
goto Microfone

:SemCamera
set "Camera=(sem olho)"
%Wait2%
%Fala% "- Nao encontrei nenhuma camera."
%Wait2%
%Fala% "- Voce tirou? Ou tapou com fita?"
%Wait5%
call Scripts\Features\cena.cmd rostog
%Fala% "- Entao voce ja tinha medo de alguem antes de mim."
%Wait5%
call Scripts\Features\cena.cmd rosto a

:Microfone
if not defined Microfone goto :EOF
%Wait2%
%Fala% "- Mas tem isto aqui:"
%Fala% "  %Microfone%"
%Wait2%
%Fala% "- Camera a gente tapa."
%Wait2%
%Fala% "- Microfone ninguem lembra de tapar."
%Wait5%
goto :EOF
