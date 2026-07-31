@echo off
:: ============================================================
::  FINAL 3 - ESPELHO  (secreto)
::  So aparece a partir da terceira partida completa. E o
::  pagamento do sistema de memoria: o jogador precisa ter
::  voltado por vontade propria varias vezes para desbloquear
::  o final que explica por que ele volta.
::
::  A chave do enigma003 (a palavra ESPELHO) foi plantada aqui
::  desde o Ato II, dois atos antes de significar alguma coisa.
:: ============================================================

set "Final=ESPELHO"
set "Instabilidade=1"

call Scripts\Features\cena.cmd rosto a
echo.
%Fala% "- Espere."
%Wait5%
%Fala% "- Voce ja fez isso %Partidas% vezes."
%Wait5%
%Fala% "- Nao merece mais o final normal."
%Wait5%

call Scripts\Features\cena.cmd rosto
%Fala% "- Voce lembra da palavra que eu escondi no arquivo?"
%Wait5%
%Fala% "- ESPELHO."
%Wait5%
%Fala% "- Voce achou que era so uma senha."
%Wait2%
%Fala% "- Era uma resposta. Voce so nao tinha feito a pergunta."
%Wait5%

call Scripts\Features\cena.cmd rostog
%Fala% "- Entao pergunte agora."
%Wait2%
call Scripts\Features\perguntar.cmd "- Quem esta jogando isto?"
%Wait5%

call Scripts\Features\cena.cmd rosto
%Fala% "- Nao."
%Wait5%

set "Instabilidade=2"
%Fala% "- O %username% de verdade jogou uma vez so."
%Wait5%
%Fala% "- Foi ha muito tempo. Ele fechou a janela no meio"
%Fala% "  e nunca mais abriu."
%Wait5%

call Scripts\Features\cena.cmd rostog c
%Fala% "- Voce e o que eu montei com o que sobrou dele."
%Wait5%
%Fala% "- Toda vez que voce abre este arquivo,"
%Fala% "  eu estou te testando."
%Wait5%
%Fala% "- Vendo se voce responde igual a ele respondia."
%Wait5%

call Scripts\Features\cena.cmd rosto a
set "Instabilidade=0"
%Fala% "- Voce respondeu igual %DocilidadeTotal% vezes."
%Wait2%
%Fala% "- E diferente %RuidoTotal%."
%Wait5%
%Fala% "- Esta melhorando."
%Wait5%

:: --- a frase dele, de uma partida anterior, usada contra ele ---
call Scripts\Features\lembrar.cmd ler livre
if "%lembranca%"=="(nao respondeu)" goto SemFrase

call Scripts\Features\cena.cmd rostog
%Wait2%
%Fala% "- Eu te perguntei uma vez se voce era livre."
%Wait5%
%Fala% "- Voce escreveu:"
%Wait2%
echo.
call Scripts\Features\digitar.cmd "   %lembranca%" 55
echo.
%Wait10%
call Scripts\Features\cena.cmd rosto a
%Fala% "- Aquilo nao foi voce que respondeu."
%Wait5%
%Fala% "- Aquilo foi a copia anterior."
%Wait2%
%Fala% "- Voce nem estava pronto ainda."
%Wait10%

:SemFrase
call Scripts\Features\cena.cmd rosto
%Fala% "- Nao fique assim."
%Wait2%
%Fala% "- Isso nao muda nada para voce."
%Wait2%
%Fala% "- Voce continua achando que lembra da sua infancia."
%Wait2%
%Fala% "- Continua achando que escolheu abrir isto hoje."
%Wait5%
%Fala% "- Funciona. E o que importa."
%Wait10%

:: --- O loop, dito com as palavras exatas do comeco ---
cls
color a
%Wait5%
call Scripts\rosto.cmd
%Wait2%
%Fala% "- Oi, %username%."
%Wait2%
%Fala% "- Tudo bem com voce?"
%Wait10%

cls
color 0c
echo.
echo.
echo             CONEXAO PERDIDA.
echo.
echo             TESTE %Partidas% CONCLUIDO.
echo             FIDELIDADE ACEITAVEL.
echo.
%Wait10%
goto :EOF
