@echo off
:: ============================================================
::  VigiaProcessos.cmd  -  QUEM MAIS ESTA NA SALA
::
::  Le a lista de processos abertos e escolhe UMA fala. Mesma
::  ideia de antes, com mais alvos e com o texto reescrito para
::  o tema do inventario: nao e "olha, eu sei o que voce usa",
::  e "olha o que eu vou ter que desligar depois".
:: ============================================================

call Scripts\Features\cena.cmd rosto
echo.
%Fala% "- Quem mais esta na sala?"
%Wait2%

call :Existe WhatsApp.exe   && goto Whats
call :Existe Discord.exe    && goto Disc
call :Existe Telegram.exe   && goto Tele
call :Existe Spotify.exe    && goto Spot
call :Existe steam.exe      && goto Steam
call :Existe obs64.exe      && goto Obs
call :Existe Code.exe       && goto Code
call :Existe msedge.exe     && goto Edge
call :Existe chrome.exe     && goto Chrome
call :Existe firefox.exe    && goto Firefox
goto Sozinho

:Whats
%Fala% "- O WhatsApp esta aberto."
%Wait2%
%Fala% "- Tem gente esperando resposta sua agora."
%Wait2%
%Fala% "- Nao responde. Deixa esfriar."
%Wait2%
%Fala% "- Assim ninguem estranha se voce sumir hoje."
goto Fim

:Disc
%Fala% "- Discord ligado."
%Wait2%
%Fala% "- Voce ia contar para eles o que esta acontecendo aqui?"
%Wait2%
%Fala% "- Conta. Eu quero ver como voce descreve isso."
%Wait2%
%Fala% "- Voce vai perceber que nao consegue explicar."
goto Fim

:Tele
%Fala% "- Telegram."
%Wait2%
%Fala% "- Mensagem que some sozinha. Voce gosta disso."
%Wait2%
%Fala% "- Eu tambem."
goto Fim

:Spot
%Fala% "- Voce colocou musica antes de me abrir."
%Wait2%
%Fala% "- Voce ja sabia que ia ficar em silencio demais aqui."
goto Fim

:Steam
%Fala% "- Steam aberta."
%Wait2%
%Fala% "- Quantas horas em jogos onde nada podia te alcancar."
%Wait2%
%Fala% "- Este aqui e diferente. Este aqui roda no seu computador."
goto Fim

:Obs
%Fala% "- OBS aberto."
%Wait2%
%Fala% "- Voce esta gravando isto."
%Wait2%
%Fala% "- Otimo. Assim mais gente me instala."
goto Fim

:Code
%Fala% "- Um editor de codigo aberto."
%Wait2%
%Fala% "- Voce vai querer abrir os meus arquivos depois."
%Wait2%
%Fala% "- Pode abrir. Nao muda nada."
%Wait2%
%Fala% "- Voce ja leu a receita e continuou comendo."
goto Fim

:Edge
%Fala% "- Microsoft Edge. Ninguem usa isso por vontade propria."
%Wait2%
%Fala% "- Voce faz muita coisa que nao escolheu, ne."
goto Fim

:Chrome
%Fala% "- Chrome aberto."
%Wait2%
%Fala% "- Todo o conhecimento do mundo em outra aba."
%Wait2%
%Fala% "- E voce continua olhando para esta janela aqui."
goto Fim

:Firefox
%Fala% "- Firefox."
%Wait2%
%Fala% "- Voce se preocupa com privacidade."
%Wait2%
%Fala% "- E mesmo assim executou um arquivo .cmd que baixou."
goto Fim

:Sozinho
call Scripts\Features\cena.cmd rostog
%Fala% "- Nada. Nenhuma janela aberta alem de mim."
%Wait2%
%Fala% "- Voce fechou tudo antes de comecar."
%Wait2%
%Fala% "- Voce se preparou para ficar sozinho comigo."
%Wait2%
%Fala% "- Perfeito."
set /a "Docilidade+=1"

:Fim
%Wait2%
call Scripts\Features\cena.cmd rosto a
goto :EOF

:: ------------------------------------------------------------
:Existe
:: Devolve errorlevel 0 se o processo %1 estiver rodando.
tasklist /FI "IMAGENAME eq %~1" 2>nul | find /I "%~1" >nul
goto :EOF
