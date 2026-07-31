@echo off
:: ============================================================
::  ruido_branco.cmd  -  ESTATICA
::
::  Mesma ideia de antes (lixo numerico na tela), com um detalhe
::  novo: de vez em quando o nome do jogador aparece no meio do
::  lixo, rapido demais para ler com calma e devagar demais para
::  ele ter certeza de que nao viu.
:: ============================================================
color 20
for /L %%i in (1,1,100) do call :Linha
cls
color a
goto :EOF

:Linha
set /a "sorte=%random% %% 14"
if %sorte%==0 (
    echo %random%%username%%random%
) else (
    echo %random%%random%%random%%random%%random%
)
goto :EOF
