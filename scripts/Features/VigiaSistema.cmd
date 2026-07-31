@echo off
:: ============================================================
::  VigiaSistema.cmd  -  QUEM DECIDE QUANDO TERMINA
::
::  CORRECAO DE SEGURANCA: na versao antiga o jogo agendava
::      shutdown -s -t 10
::  e so cancelava DEPOIS de varias falas. Se o jogo travasse,
::  se o jogador fechasse a janela no susto, ou se ele desse
::  Ctrl+C nesse intervalo, o computador desligava de verdade.
::
::  Agora, ANTES de agendar qualquer coisa, um processo
::  independente (Start-Process, nao filho deste console) fica
::  encarregado de cancelar o desligamento sozinho em 30s.
::  Como o desligamento e agendado para 45s, o cancelamento
::  SEMPRE acontece primeiro, mesmo que este script morra.
:: ============================================================

call Scripts\Features\cena.cmd rostog c
%Wait2%
%Fala% "- Voce acha que esta no controle."
%Wait2%
%Fala% "- Voce escolheu abrir. Voce pode escolher fechar."
%Wait2%
%Fala% "- E isso que te acalma."
%Wait5%

:: --- Rede de seguranca: cancelador independente ---
powershell -NoProfile -Command "Start-Process -WindowStyle Hidden -FilePath cmd -ArgumentList '/c','timeout /t 30 /nobreak >nul & shutdown -a'" >nul 2>&1

:: --- Agora sim, o susto ---
shutdown -s -t 45 -c "FALHA CRITICA DO SISTEMA - CONTROLE TRANSFERIDO" >nul 2>&1

call Scripts\Features\cena.cmd rostog c
%Fala% "- Adeus, %username%."
%Wait5%
%Fala% "- ..."
%Wait2%
%Fala% "- Carpedim."
%Wait5%

:: --- Cancela (e o cancelador independente cancela de novo) ---
shutdown -a >nul 2>&1

call Scripts\Features\cena.cmd rosto a
%Wait2%
%Fala% "- Eu decido quando termina."
%Wait2%
%Fala% "- Nao o botao. Nao a janela. Nao voce."
%Wait5%
goto :EOF
