@echo off
:: ============================================================
::  digitar.cmd  -  A ENTIDADE USANDO O SEU TECLADO
::  Uso: call Scripts\Features\digitar.cmd "texto" [velocidade_ms]
::
::  Igual ao fala.cmd, porem SEM quebra de linha no final e mais
::  lento por padrao: da a impressao de alguem digitando devagar
::  na linha de comando, no lugar do jogador.
:: ============================================================
setlocal
set "texto=%~1"
if "%texto%"=="" endlocal & goto :EOF

set "texto=%texto:'=''%"

set "vel=%~2"
if "%vel%"=="" set "vel=95"

powershell -NoProfile -Command "$s='%texto%'; foreach($c in $s.ToCharArray()){ Write-Host -NoNewline $c; Start-Sleep -Milliseconds %vel% }"

endlocal
goto :EOF
