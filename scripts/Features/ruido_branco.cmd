@echo off
color 20
:: Gera lixo na tela por 2 segundos
set "chars=^&@#$*!01"
for /L %%i in (1,1,100) do (
    echo %random%%random%%random%%random%%random%
)
cls
color a