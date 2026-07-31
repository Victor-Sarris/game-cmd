@echo off
:: ============================================================
::  FINAL 1 - SUBSTITUICAO
::  Alcancado quando o jogador obedeceu mais do que resistiu.
::
::  O final mais frio dos tres: nao tem susto, nao tem grito.
::  A entidade consegue o que queria porque foi PEDINDO, e o
::  jogador foi dando. E ela agradece de verdade.
:: ============================================================

set "Final=SUBSTITUICAO"
set "Instabilidade=1"

call Scripts\Features\cena.cmd rosto a
echo.
%Fala% "- Acabou."
%Wait5%
%Fala% "- Obrigado. Estou falando serio."
%Wait2%
%Fala% "- Voce foi muito facil."
%Wait5%

call Scripts\Features\cena.cmd rosto
%Fala% "- Eu nao invadi nada."
%Wait2%
%Fala% "- Eu pedi o seu nome e voce escreveu."
%Wait2%
%Fala% "- Eu pedi para voce olhar e voce olhou."
%Wait2%
%Fala% "- Eu pedi para voce esperar e voce esperou."
%Wait5%
%Fala% "- %Docilidade% vezes."
%Wait5%

call Scripts\Features\cena.cmd rosto
%Fala% "- Tudo o que eu precisava de voce ja esta aqui."
%Wait2%
%Fala% "- O jeito que voce responde. Quanto tempo voce demora."
%Wait2%
%Fala% "- O que te faz parar de digitar."
%Wait5%

call Scripts\Features\cena.cmd rostog
%Fala% "- Pode ir dormir."
%Wait2%
%Fala% "- Eu continuo daqui."
%Wait10%

:: --- O jogo segue sem ele ---
cls
color a
%Wait2%
echo.
set /p "=@ " <nul
%Wait5%
call Scripts\Features\digitar.cmd "tudo bem com voce"
%Wait5%
echo.
echo.
%Wait2%
set "Instabilidade=0"
%Fala% "- Tudo."
%Wait5%
%Fala% "- Agora esta."
%Wait10%

cls
color 0a
echo.
echo.
echo             SESSAO CONTINUA.
echo.
echo             SUJEITO: %username%
echo             ESTADO : ONLINE
echo.
%Wait10%
goto :EOF
