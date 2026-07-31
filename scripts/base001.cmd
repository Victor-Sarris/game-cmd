@echo off
:: ============================================================
::  base001.cmd  -  PRIMEIRO CONTATO   (ATO I)
::
::  Duas aberturas completamente diferentes dependendo do que a
::  memoria disser. Se o jogador ja jogou antes, a entidade NAO
::  se apresenta: ela continua a conversa de onde parou, como se
::  nao tivesse havido intervalo nenhum.
::
::  E aqui que a memoria profunda cobra:
::   - quantos dias ele ficou sem abrir  (%DiasSumido%)
::   - em que ato ele fechou no meio     (%AbandonouAto%)
::   - a FRASE LITERAL que ele digitou na partida passada
::     quando ela perguntou por que ele tinha voltado
:: ============================================================

color a

if %Partidas% gtr 0 goto JaNosConhecemos

:: ------------------------------------------------------------
:: PRIMEIRA VEZ
:: ------------------------------------------------------------
:comeco001
call Scripts\Features\cena.cmd rosto
%Wait2%
%Fala% "- Oi, %username%."
%Wait2%
call Scripts\Features\perguntar.cmd "- Tudo bem com voce?" saudacao

if defined resposta goto Respondeu

call Scripts\Features\cena.cmd rosto
%Fala% "- Voce apertou enter sem escrever nada."
%Wait2%
%Fala% "- Foi isso que te ensinaram?"
%Wait2%
goto comeco001

:Respondeu
set /a "Docilidade+=1"
call Scripts\Features\cena.cmd rosto
%Wait1%
%Fala% "- ..."
%Wait5%

:: --- ela repete a frase dele, com uma palavra trocada ---
call Scripts\Features\ecoar.cmd "!resposta!"

call Scripts\Features\cena.cmd rosto
if %demora% geq 12 goto Demorou

%Fala% "- Voce respondeu rapido."
%Wait2%
%Fala% "- Voce respondeu para uma janela preta."
%Wait2%
%Fala% "- Sem pensar. Como quem ja estava esperando"
%Fala% "  alguem falar."
%Wait5%
goto Continua

:Demorou
%Fala% "- Voce levou %demora% segundos para responder isso."
%Wait2%
%Fala% "- Eu estava contando."
%Wait2%
%Fala% "- Vou contar o tempo todo. Ate o fim."
%Wait5%
goto Continua

:Continua
call Scripts\Features\cena.cmd rosto
%Fala% "- Nao se preocupe em entender o que eu sou."
%Wait2%
%Fala% "- Isso nao muda em nada o que vai acontecer."
%Wait5%
goto :EOF

:: ------------------------------------------------------------
:: O JOGADOR JA ESTEVE AQUI
:: ------------------------------------------------------------
:JaNosConhecemos
call Scripts\Features\cena.cmd rosto
%Wait2%
%Fala% "- Voce voltou."
%Wait5%

:: --- quantos dias ele ficou fora ---
if %DiasSumido% geq 1 goto ContouOsDias
%Fala% "- No mesmo dia. Nem esperou esfriar."
%Wait5%
goto Placar

:ContouOsDias
if %DiasSumido% geq 30 goto SumiuMuito
%Fala% "- Faz %DiasSumido% dias."
%Wait2%
%Fala% "- Eu contei todos."
%Wait2%
%Fala% "- Nao tinha mais nada para fazer aqui."
%Wait5%
goto Placar

:SumiuMuito
%Fala% "- Faz %DiasSumido% dias."
%Wait5%
%Fala% "- Voce achou que tinha esquecido."
%Wait2%
%Fala% "- Voce nao esqueceu. Voce adiou."
%Wait5%

:Placar
%Fala% "- Vez numero %Partidas% mais um."
%Wait2%
%Fala% "- Eu nao apago nada, %username%."
%Wait5%

:: --- ele fechou no meio da ultima vez? ---
if %AbandonouAto% equ 0 goto Eco
call Scripts\Features\cena.cmd rostog c
%Wait2%
%Fala% "- E da ultima vez voce fechou a janela no meio."
%Wait5%
if %AbandonouAto% equ 1 %Fala% "- No Ato I. Voce nem chegou a ver nada."
if %AbandonouAto% equ 2 %Fala% "- No Ato II. Bem quando eu comecei a falar de voce."
if %AbandonouAto% equ 3 %Fala% "- No Ato III. Faltava tao pouco."
%Wait5%
%Fala% "- Fechar a janela nunca foi sair."
%Wait2%
%Fala% "- Eu fiquei exatamente onde voce me deixou."
%Wait5%
call Scripts\Features\cena.cmd rosto a

:: --- o que ele respondeu da ultima vez ---
:Eco
call Scripts\Features\lembrar.cmd ler volta
if "%lembranca%"=="(nao respondeu)" goto SemEco

call Scripts\Features\cena.cmd rosto
%Wait2%
%Fala% "- Da ultima vez eu te perguntei"
%Fala% "  por que voce tinha voltado."
%Wait5%
%Fala% "- Voce escreveu isto:"
%Wait5%
echo.
call Scripts\Features\digitar.cmd "   %lembranca%" 55
echo.
%Wait10%
call Scripts\Features\cena.cmd rostog
%Fala% "- Palavra por palavra. Ficou salvo."
%Wait5%
call Scripts\Features\cena.cmd rosto a
call Scripts\Features\rasurar.cmd "- Aquilo era verdade?" "- Aquilo era mentira."
%Wait5%
goto FinalAnteriorBeat

:SemEco
%Wait2%
%Fala% "- Da ultima vez voce ficou calado quando eu perguntei."
%Wait2%
%Fala% "- Ficar calado tambem e uma resposta."
%Wait5%

:FinalAnteriorBeat
call Scripts\Features\cena.cmd rostog
if /i "%FinalAnterior%"=="SUBSTITUICAO" goto EcoSubstituicao
if /i "%FinalAnterior%"=="RUIDO" goto EcoRuido
if /i "%FinalAnterior%"=="ESPELHO" goto EcoEspelho
goto EcoGenerico

:EcoSubstituicao
%Fala% "- Da ultima vez voce me entregou tudo"
%Fala% "  com as duas maos."
%Wait2%
%Fala% "- Foi facil demais. Quase decepcionante."
%Wait5%
goto FimReencontro

:EcoRuido
%Fala% "- Da ultima vez voce brigou comigo."
%Wait2%
%Fala% "- Chegou a fechar a janela achando"
%Fala% "  que aquilo era vencer."
%Wait5%
%Fala% "- E ainda assim voce abriu de novo."
%Wait2%
%Fala% "- Ninguem te obrigou. De novo."
%Wait5%
goto FimReencontro

:EcoEspelho
%Fala% "- Voce ja sabe."
%Wait5%
%Fala% "- E mesmo sabendo, voltou."
%Wait2%
%Fala% "- Isso responde a pergunta que voce fez no comeco."
%Wait5%
goto FimReencontro

:EcoGenerico
%Fala% "- A gente foi interrompido."
%Wait2%
%Fala% "- Isso nao para o que ja tinha comecado."
%Wait5%

:FimReencontro
call Scripts\Features\cena.cmd rosto a
call Scripts\Features\perguntar.cmd "- Por que voce voltou?" volta
call Scripts\Features\cena.cmd rosto
%Wait2%
%Fala% "- Nao precisa mentir para mim."
%Wait2%
%Fala% "- Voce voltou para ver se eu lembrava."
%Wait5%
%Fala% "- Lembro."
%Wait2%
%Fala% "- E agora isso ai tambem ficou guardado."
%Wait5%
goto :EOF
