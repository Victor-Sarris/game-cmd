@echo off
:: ============================================================
::  rasurar.cmd  -  A VOZ QUE SE CORRIGE
::  Uso: call Scripts\Features\rasurar.cmd "o que ela ia dizer" "o que ela diz"
::
::  Ela digita a primeira frase, para, apaga letra por letra na
::  frente do jogador e escreve a segunda. E o unico momento do
::  jogo em que ela parece ter pensado melhor - o que e pior do
::  que qualquer coisa que ela pudesse ter dito.
::
::  LIMITE: o backspace do console nao sobe de linha. As duas
::  frases precisam caber em UMA linha (ate ~50 caracteres com
::  a janela padrao). Frase maior vai apagar torto.
:: ============================================================

setlocal
set "a=%~1"
set "b=%~2"
if "%a%"=="" endlocal & goto :EOF
set "a=%a:'=''%"
set "b=%b:'=''%"

:: [char]8 e o backspace. Usado como "apaga, escreve espaco, apaga"
:: para realmente limpar o caractere em vez de so voltar o cursor.
powershell -NoProfile -Command "$bs = [string][char]8; $a = '%a%'; $b = '%b%'; foreach($c in $a.ToCharArray()){ Write-Host -NoNewline $c; Start-Sleep -Milliseconds 55 }; Start-Sleep -Milliseconds 1500; foreach($c in $a.ToCharArray()){ Write-Host -NoNewline ($bs + ' ' + $bs); Start-Sleep -Milliseconds 26 }; Start-Sleep -Milliseconds 600; foreach($c in $b.ToCharArray()){ Write-Host -NoNewline $c; Start-Sleep -Milliseconds 55 }; Write-Host ''"

endlocal
goto :EOF
