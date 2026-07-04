@echo off
:: Helper de cena: limpa a tela, aplica uma cor (opcional) e desenha o rosto.
:: Uso: call Scripts\Features\cena.cmd <rosto|rostog> [cor]
cls
if not "%~2"=="" color %~2
if /i "%~1"=="rostog" (
    call Scripts\rostog.cmd
) else (
    call Scripts\rosto.cmd
)
goto :EOF
