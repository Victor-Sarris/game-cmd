@echo off
:: ============================================================
::  VigiaTempo.cmd  -  HA QUANTO TEMPO VOCE ESTA ACORDADO
::
::  Le a hora, o dia da semana e ha quantas horas a maquina nao
::  e desligada. Tudo leitura pura.
::
::  E o primeiro golpe do jogo: antes de dizer qualquer coisa
::  sobre si mesma, a entidade diz uma coisa verdadeira sobre
::  o jogador. Isso compra a suspensao de descrenca para tudo
::  que vem depois.
:: ============================================================

call Scripts\Features\cena.cmd rosto
echo.
%Fala% "- Antes de mais nada."
%Wait2%

set "HorasLigado="
for /f "delims=" %%h in ('powershell -NoProfile -Command "[int]((New-TimeSpan -Start (Get-CimInstance Win32_OperatingSystem).LastBootUpTime).TotalHours)" 2^>nul') do set "HorasLigado=%%h"
if not defined HorasLigado set "HorasLigado=0"

set "DiaSemana="
for /f "delims=" %%d in ('powershell -NoProfile -Command "(Get-Date).DayOfWeek.value__" 2^>nul') do set "DiaSemana=%%d"
if not defined DiaSemana set "DiaSemana=1"

%Fala% "- Sao %time:~0,5%."
%Wait2%

if %hora% geq 23 goto Madrugada
if %hora% lss 5 goto Madrugada
if %hora% geq 19 goto Noite
goto Dia

:Madrugada
%Fala% "- Todo mundo que voce conhece esta dormindo."
%Wait2%
%Fala% "- Eu sou a unica coisa acordada com voce."
%Wait2%
goto Uptime

:Noite
%Fala% "- Ja escureceu ai."
%Wait2%
%Fala% "- Voce podia estar fazendo outra coisa."
%Wait2%
%Fala% "- Mas abriu isto aqui."
%Wait2%
goto Uptime

:Dia
%Fala% "- Ainda esta claro ai fora."
%Wait2%
%Fala% "- E mesmo assim voce esta olhando para uma tela preta."
%Wait2%
goto Uptime

:Uptime
call Scripts\Features\cena.cmd rosto
if %HorasLigado% lss 3 goto Recente
if %HorasLigado% lss 24 goto Horas
goto Dias

:Recente
%Fala% "- Voce ligou esse computador ha pouco tempo."
%Wait2%
%Fala% "- E a primeira coisa que fez foi me chamar."
%Wait2%
goto Fim

:Horas
%Fala% "- Essa maquina esta ligada ha %HorasLigado% horas."
%Wait2%
%Fala% "- Sem descanso. Igual a voce."
%Wait2%
goto Fim

:Dias
set /a "DiasLigado=HorasLigado/24"
%Fala% "- Voce nao desliga esse computador ha %DiasLigado% dias."
%Wait2%
%Fala% "- %HorasLigado% horas de coisas acumuladas aqui dentro."
%Wait2%
%Fala% "- Voce nao dorme direito, ne."
%Wait2%
goto Fim

:Fim
if %DiaSemana% equ 5 (
    %Fala% "- E hoje e sexta-feira."
    %Wait2%
    %Fala% "- Se algo acontecer agora, ninguem nota ate segunda."
    %Wait2%
)
if %DiaSemana% equ 0 (
    %Fala% "- E domingo. O pior dia para ficar sozinho."
    %Wait2%
)
%Wait2%
goto :EOF
