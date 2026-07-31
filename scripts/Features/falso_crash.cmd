@echo off
:: ============================================================
::  falso_crash.cmd  -  O JOGO "MORRE"
::
::  A janela troca para as cores padrao do cmd, cospe um erro de
::  batch de verdade (daqueles que o jogador ja viu na vida) e
::  volta para o prompt. O jogo acabou. Deu pau.
::
::  E entao vem a parte importante: DEZ SEGUNDOS DE SILENCIO
::  absoluto no prompt morto. Tempo suficiente para o jogador
::  relaxar os ombros, ler de novo o erro, talvez ate mexer no
::  mouse para fechar. E ai a linha comeca a ser digitada.
::
::  Colocado logo antes da cena de possessao de proposito: o
::  jogador precisa ter baixado a guarda para a proxima cena
::  funcionar.
:: ============================================================

call Scripts\Features\ambiencia.cmd parar

cls
color 07
echo.
echo Scripts\Features\cena.cmd
echo O sistema nao pode encontrar o caminho especificado.
%Wait1%
echo 'rosto' nao e reconhecido como um comando interno
echo ou externo, um programa operavel ou um arquivo em lotes.
%Wait1%
echo.
echo ECHO esta desativado.
echo.
%Wait1%
echo %cd%^>
echo.

:: --- o silencio ---
%Wait10%
call Scripts\Features\limpar_teclado.cmd
%Wait5%
%Wait5%

:: --- a linha comeca a andar sozinha ---
:: (sem ^ aqui: dentro de aspas o circunflexo sai impresso.
::  o > entre aspas ja nao e redirecionamento)
set /p "=%cd%>" <nul
%Wait2%
call Scripts\Features\digitar.cmd "voce ficou olhando esse prompt por vinte segundos" 65
%Wait2%
echo.
%Wait1%
:: (sem ^ aqui: dentro de aspas o circunflexo sai impresso.
::  o > entre aspas ja nao e redirecionamento)
set /p "=%cd%>" <nul
%Wait1%
call Scripts\Features\digitar.cmd "eu nao caio, %username%" 90
%Wait5%
echo.
echo.
%Wait2%

call Scripts\Features\ambiencia.cmd iniciar
color a
cls
goto :EOF
