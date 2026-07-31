@echo off
:: ============================================================
::  fala.cmd  -  A VOZ DA ENTIDADE
::  Uso: call Scripts\Features\fala.cmd "- texto" [velocidade_ms]
::
::  Datilografa o texto aplicando corrupcao proporcional a
::  variavel global %Instabilidade%:
::    0 = voz limpa      (Ato I)
::    1 = voz tremida    (Ato II)
::    2 = voz quebrando  (Ato III)
::    3 = quase ilegivel (finais)
::
::  IMPORTANTE: nao use apostrofo ( ' ) nem exclamacao ( ! )
::  dentro do texto. Apostrofo quebra a string do PowerShell e
::  exclamacao e comida pela expansao atrasada do cmd.
:: ============================================================
setlocal
set "texto=%~1"
if "%texto%"=="" endlocal & goto :EOF

:: Apostrofo dentro de uma string PowerShell de aspas simples precisa ser
:: dobrado. Sem isto, um Wi-Fi chamado "Casa do Victor's" quebraria a cena.
set "texto=%texto:'=''%"

set "vel=%~2"
if "%vel%"=="" set "vel=30"

set "nivel=%Instabilidade%"
if "%nivel%"=="" set "nivel=0"

powershell -NoProfile -Command "$s='%texto%'; $n=%nivel%; $lixo=[char[]]'@#$&*?8+=~'; $o=''; foreach($c in $s.ToCharArray()){ if($c -ne ' ' -and (Get-Random -Minimum 0 -Maximum 100) -lt ($n*6)){ $o += ($lixo | Get-Random) } else { $o += $c } }; foreach($ch in $o.ToCharArray()){ Write-Host -NoNewline $ch; Start-Sleep -Milliseconds %vel% }; Write-Host ''"

endlocal
goto :EOF
