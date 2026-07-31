@echo off
:: ============================================================
::  ato.cmd  -  CARTELA DE ATO
::  Uso: call Scripts\Features\ato.cmd <numero> "<TITULO>" <instabilidade>
::
::  Alem da cartela, e aqui que a %Instabilidade% sobe. Como o
::  fala.cmd le essa variavel, a voz da entidade vai apodrecendo
::  sozinha conforme a historia avanca, sem precisar escrever
::  glitch na mao em nenhuma fala.
:: ============================================================
cls
color 0f
set "Instabilidade=%~3"

%Wait2%
echo.
echo.
echo.
echo.
echo.
call Scripts\Features\digitar.cmd "        ATO %~1" 160
%Wait1%
echo.
echo.
call Scripts\Features\digitar.cmd "        %~2" 70
%Wait5%
cls
color a
goto :EOF
