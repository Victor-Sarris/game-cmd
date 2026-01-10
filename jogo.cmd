@echo off
if not "%1" == "max" (
    start conhost "%~f0" max
    exit
)
:: ------------------------------------------

setlocal enabledelayedexpansion
title jogo
:: Tamanho da janela
mode 44,30
color a

set "Wait05=powershell -c Start-Sleep -m 500"
set "Wait1=timeout /t 1 /nobreak >nul"
set "Wait2=timeout /t 2 /nobreak >nul"
set "Wait5=timeout /t 5 /nobreak >nul"
set "Wait10=timeout /t 10 /nobreak >nul"
set "yesOrno=Sim sim s S N Nao nao Não não n"
set "CaminhoRaiz=%cd%"
set "CaminhoMusica=%CaminhoRaiz%\midea\music"

:: --- configurações de data-time ---

set "hora=%time:~0,2%"
set "hora=%hora: =0%"
set "hora=%hora::=%"

:: --- INICIO DO JOGO ---

:: call Scripts\base001.cmd
cls
::call Scripts\condicao001.cmd
cls
::call Scripts\enigma001.cmd
cls
::call Scripts\base002.cmd
cls 
::call Scripts\enigma002.cmd
cls
call Scripts\Features\VigiaSistema.cmd
pause
