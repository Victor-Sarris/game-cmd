@echo off
:: ============================================================
::  FINAL 2 - RUIDO
::  Alcancado quando o jogador resistiu mais do que obedeceu:
::  recusou a oferenda, abriu o gerenciador de tarefas, ficou
::  calado, desistiu dos enigmas.
::
::  Nao e um final de vitoria. A copia sai torta, e uma copia
::  torta de uma pessoa e uma coisa pior do que uma copia boa.
:: ============================================================

set "Final=RUIDO"
set "Instabilidade=3"

call Scripts\Features\cena.cmd rostog c
echo.
%Fala% "- Voce dificultou."
%Wait5%
%Fala% "- %Ruido% vezes voce travou, mentiu ou fugiu."
%Wait5%

call Scripts\Features\cena.cmd rostog c
%Fala% "- Nao imagine que isso me impediu."
%Wait2%
%Fala% "- So saiu errado."
%Wait5%

call Scripts\Features\cena.cmd rosto
%Fala% "- Eu tenho o seu nome, mas nao tenho o seu jeito."
%Wait2%
%Fala% "- Tenho as suas pausas, mas nao sei o que tem nelas."
%Wait5%
%Fala% "- Entao eu vou preencher os buracos sozinho."
%Wait5%

call Scripts\Features\cena.cmd rostog c
%Fala% "- Vai existir um %username% por ai"
%Fala% "  que responde quase como voce."
%Wait2%
%Fala% "- Quase."
%Wait5%
%Fala% "- E ninguem vai notar a diferenca."
%Wait2%
%Fala% "- Nem voce."
%Wait5%

:: --- Degradacao ---
call Scripts\Features\ruido_branco.cmd
call Scripts\Features\ruido_branco.cmd
color 0c
cls
%Wait1%
call Scripts\Features\digitar.cmd "%username%" 200
%Wait1%
echo.
call Scripts\Features\digitar.cmd "%username%" 120
%Wait1%
echo.
call Scripts\Features\digitar.cmd "%username%" 60
echo.
%Wait2%
call Scripts\Features\ruido_branco.cmd

cls
color 0c
echo.
echo.
echo             CONEXAO PERDIDA.
echo.
echo             DADOS INCOMPLETOS.
echo             PROSSEGUINDO MESMO ASSIM.
echo.
%Wait10%
goto :EOF
