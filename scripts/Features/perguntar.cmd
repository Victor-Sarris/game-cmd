@echo off
:: ============================================================
::  perguntar.cmd  -  PERGUNTA, MEDE A HESITACAO E GUARDA
::  Uso: call Scripts\Features\perguntar.cmd "- a pergunta"
::       call Scripts\Features\perguntar.cmd "- a pergunta" <chave>
::
::  Com <chave>, a resposta e gravada em disco e a entidade pode
::  cita-la de volta em uma PARTIDA FUTURA (ver lembrar.cmd).
::
::  Devolve para o chamador:
::    %resposta%   - o que o jogador escreveu
::    %demora%     - quantos segundos ele levou para responder
::
::  E atualiza os contadores globais:
::    %Ruido%      - sobe quando o jogador se recusa a responder
::    %Hesitacao%  - sobe quando o jogador trava antes de responder
::
::  Nao ha timeout de verdade: o jogo espera o tempo que for e
::  so COMENTA a demora depois. E mais confiavel em batch e o
::  efeito narrativo e melhor - a entidade revela no fim que
::  estava cronometrando desde o comeco.
:: ============================================================

if not "%~1"=="" call Scripts\Features\fala.cmd "%~1"

call :Marcar _t0
set "resposta="
set /p "resposta=@ "
call :Marcar _t1

:: Aspas duplas na resposta quebrariam todas as passagens
:: seguintes (a resposta viaja dentro de argumentos entre aspas).
if defined resposta set resposta=%resposta:"=%

set /a "demora=_t1-_t0"
if %demora% lss 0 set /a "demora=demora+86400"

if not defined resposta set /a "Ruido+=1"
if %demora% geq 12 set /a "Hesitacao+=1"

:: --- guarda a frase para as proximas partidas ---
if not "%~2"=="" call Scripts\Features\lembrar.cmd guardar "%~2" "!resposta!"

goto :EOF

:: ------------------------------------------------------------
:Marcar
:: Converte %time% (HH:MM:SS,cc) em segundos desde a meia-noite.
set "_h=%time:~0,2%"
set "_m=%time:~3,2%"
set "_s=%time:~6,2%"
set "_h=%_h: =0%"
set /a "%~1=(1%_h%-100)*3600+(1%_m%-100)*60+(1%_s%-100)"
goto :EOF
