@echo off
:: --- TRUQUE PARA FORÇAR JANELA CLÁSSICA ---
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

set "hora=%time:~0,2%"

set "hora=%hora: =0%"

set "hora=%hora::=%"

:: --- INICIO DO JOGO ---

call Scripts\rosto.cmd

%Wait2%
echo - Oi, %username%...


pause
