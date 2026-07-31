@echo off
:: ============================================================
::  falso_apagamento.cmd  -  ELE FINGE APAGAR TUDO
::
::  ############ NADA E APAGADO NESTE ARQUIVO ############
::  Nao existe um unico "del" aqui dentro. Confira: procure a
::  palavra del neste arquivo e voce nao vai achar.
::  A cena so LE os nomes (dir /b) e os imprime na tela com uma
::  barra de progresso falsa.
::  #####################################################
::
::  E a cena mais cruel do jogo e a mais inofensiva ao mesmo
::  tempo, e a revelacao no fim e o ponto: ela conta que nao
::  apagou nada, e obriga o jogador a admitir que ficou parado
::  olhando enquanto achava que estava perdendo os arquivos.
::
::  No final ela reconta os arquivos e mostra o numero, para o
::  jogador ver com os proprios olhos que continua tudo la.
:: ============================================================

set "TotalAntes=0"
for /f "delims=" %%f in ('dir /b /a-d "%USERPROFILE%\Desktop" 2^>nul') do (
    set /a "TotalAntes+=1"
    set "alvo_!TotalAntes!=%%f"
)

if %TotalAntes% equ 0 goto NadaParaFingir

call Scripts\Features\cena.cmd rostog c
echo.
%Fala% "- Voce nao esta cooperando o suficiente."
%Wait5%
%Fala% "- Deixa eu te mostrar uma coisa."
%Wait5%

cls
color 0c
echo.
echo   LIMPEZA DE VOLUME - C:\Users\%username%\Desktop
echo   ----------------------------------------------
echo.

set "Contador=0"
for /L %%i in (1,1,%TotalAntes%) do call :FingirApagar %%i
if %TotalAntes% gtr 12 goto ParouNoMeio

echo.
echo   ----------------------------------------------
echo   %TotalAntes% itens processados.
%Wait5%
goto Revelacao

:ParouNoMeio
echo.
echo   ----------------------------------------------
echo   INTERROMPIDO.
%Wait5%
goto Revelacao

:: ------------------------------------------------------------
:FingirApagar
:: So imprime. Nao toca em nada.
set /a "Contador+=1"
if %Contador% gtr 12 goto :EOF
set "nome=!alvo_%~1!"
set /p "=   APAGANDO  !nome! " <nul
powershell -NoProfile -c Start-Sleep -m 260
set /p "=. " <nul
powershell -NoProfile -c Start-Sleep -m 200
set /p "=. " <nul
powershell -NoProfile -c Start-Sleep -m 240
echo OK
goto :EOF

:: ------------------------------------------------------------
:Revelacao
%Wait2%
color a
cls
call Scripts\rosto.cmd
%Wait5%
%Fala% "- Va conferir."
%Wait10%

:: recontagem de verdade, para ele ver o numero
set "TotalDepois=0"
for /f "delims=" %%f in ('dir /b /a-d "%USERPROFILE%\Desktop" 2^>nul') do set /a "TotalDepois+=1"

call Scripts\Features\cena.cmd rosto
echo.
echo    ANTES:  %TotalAntes% itens
echo    AGORA:  %TotalDepois% itens
echo.
%Wait5%
%Fala% "- Esta tudo la. Eu nao apaguei nada."
%Wait5%
call Scripts\Features\cena.cmd rostog
%Fala% "- Mas voce ficou olhando."
%Wait2%
%Fala% "- Ate o fim. Sem fechar a janela."
%Wait5%
call Scripts\Features\cena.cmd rosto a
%Fala% "- Voce nao apertou nada, nao gritou,"
%Fala% "  nao tirou o cabo da tomada."
%Wait5%
%Fala% "- Voce esperou para ver o que eu ia fazer."
%Wait5%
%Fala% "- Guarde isso sobre voce."
%Wait2%
%Fala% "- Eu vou guardar."
set /a "Ruido+=1"
%Wait5%
goto :EOF

:NadaParaFingir
call Scripts\Features\cena.cmd rostog
%Wait2%
%Fala% "- Eu ia te mostrar uma coisa com os seus arquivos."
%Wait2%
%Fala% "- Mas a sua area de trabalho esta vazia."
%Wait5%
call Scripts\Features\cena.cmd rosto a
%Fala% "- Nao tem nada que voce tenha medo de perder."
%Wait2%
%Fala% "- Isso e mais triste do que qualquer coisa"
%Fala% "  que eu poderia ter feito."
%Wait5%
goto :EOF
