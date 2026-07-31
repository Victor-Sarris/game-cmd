@echo off
:: ============================================================
::  ecoar.cmd  -  ELA REPETE VOCE, ERRADO
::  Uso: call Scripts\Features\ecoar.cmd "!resposta!"
::
::  Devolve a frase do jogador com UMA palavra trocada por outra
::  do vocabulario dela. O jogador acabou de digitar aquilo, mas
::  nao tem mais como conferir: a linha ja rolou para cima.
::
::  Funciona melhor com frases de 4 palavras ou mais. Com frases
::  de uma palavra so, a troca fica obvia demais - por isso a
::  cena sai fora quando a resposta e curta.
:: ============================================================

set "CARP_ECO=%temp%\carpedim_eco.txt"
set "frase=%~1"
if not defined frase goto :EOF

:: apostrofo dobrado para nao quebrar a string do PowerShell
set "frase=%frase:'=''%"

del /q "%CARP_ECO%" 2>nul
powershell -NoProfile -Command "$p = @('%frase%' -split ' +' | Where-Object { $_ -ne '' }); if($p.Count -ge 4){ $troca = @('nunca','sempre','sozinho','medo','ele','ninguem','depois','ainda'); $i = Get-Random -Maximum $p.Count; $p[$i] = $troca | Get-Random; Set-Content -LiteralPath $env:CARP_ECO -Value ($p -join ' ') }" 2>nul

set "eco="
if exist "%CARP_ECO%" set /p "eco="<"%CARP_ECO%"
del /q "%CARP_ECO%" 2>nul
if not defined eco goto :EOF

%Wait2%
call Scripts\Features\fala.cmd "- Voce acabou de escrever:"
%Wait1%
call Scripts\Features\fala.cmd "  %eco%"
%Wait5%
call Scripts\Features\fala.cmd "- Foi isso mesmo que voce escreveu?"
%Wait5%
call Scripts\Features\fala.cmd "- Rola a tela para cima e confere."
%Wait5%
call Scripts\Features\fala.cmd "- Ah. Nao da mais."
%Wait2%
set "eco="
goto :EOF
