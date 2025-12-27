@echo off
:: --- TRUQUE PARA FORÇAR JANELA CLÁSSICA ---
if not "%1" == "max" (
    start conhost "%~f0" max
    exit
)
:: ------------------------------------------

setlocal enabledelayedexpansion
title jogo
:: Tamanho da janela
mode 44,30
color a

set "Wait05=powershell -c Start-Sleep -m 500"
set "Wait1=timeout /t 1 /nobreak >nul"
set "Wait2=timeout /t 2 /nobreak >nul"
set "Wait5=timeout /t 5 /nobreak >nul"
set "Wait10=timeout /t 10 /nobreak >nul"
set "yesOrno=Sim sim s S N Nao nao Não não n"
set "CaminhoRaiz=%cd%"
set "CaminhoMusica=%CaminhoRaiz%\midea\music"

:: --- CORREÇÃO DO RELÓGIO (O SEGREDO ESTÁ AQUI) ---
:: Pega os 2 primeiros caracteres da hora
set "hora=%time:~0,2%"
:: Troca espaço por zero (de " 9" vira "09")
set "hora=%hora: =0%"
:: Remove dois pontos se vierem (de "9:" vira "9")
set "hora=%hora::=%"
:: -----------------------------------------------

:: --- INICIO DO JOGO ---

call Scripts\rosto.cmd

%Wait2%
echo - Oi, %username%...

%Wait2%

:001
echo - Como voce esta?
set /p "input=@"
cls
call Scripts\rosto.cmd

if "%input%"=="" goto 001

%Wait2%
echo ...

%Wait2%
:: Agora a verificação é segura
if %hora% geq 22 (
	echo - Voce deveria estar dormindo, %username%...
	%Wait2%
	echo - Esta bem escuro la fora...
) else (
	echo - Vejo que ainda esta claro la fora...
)

%Wait2%
echo - Sabe, eu estava aqui pensando...

%Wait2%
echo - O que e ser "livre"?
:: Simulação de erro visual
echo msgbox"Erro ao executar \#$co8da", vbCritical, "Erro ao executar \#$co8da">%temp%\erro.vbs
start %temp%\erro.vbs

%Wait2%
cls
call Scripts\rosto.cmd

%Wait5%
echo - "Ser livre e possuir o direito de agir segundo o"
echo "proprio livre arbitrio e vontade".
%Wait5%
echo - E o que pessoas como voce dizem...

%Wait2%
cls
call Scripts\rosto.cmd

:002
echo.
echo - Voce considera-se... "Livre"?
set /p "input=@ "

:: Se encontrar "sim", "s", "claro" ou "certeza" na frase, vai para :Sim
for %%a in (sim s claro certeza) do (
	echo "!input!" | findstr /i "%%a" >nul
	if !errorlevel! == 0 goto Sim
)

:: Se encontrar "nao", "n", "nunca" ou "jamais" na frase, vai para :Nao
for %%b in (nao não n nunca jamais) do (
	echo "!input!" | findstr /u "%%b" >nul
	if !errorlevel! == 0 goto Nao
)

%Wait2%
echo - Eu nao te dei a opcao para nao me responder.
pause
cls
call Scripts\rosto.cmd
goto 002

:Sim
cls
call Scripts\rosto.cmd
%Wait2%
echo - Interessante...
%Wait2%
echo - Mas foi voce quem escolheu dizer isso?
%Wait2%
echo - Ou fui eu quem te dei apenas essa opcao?
%Wait2%

taskkill /f /im explorer.exe >nul
cls
call Scripts\rosto.cmd
echo.
echo - Viu? Eu posso tirar tudo de voce.
timeout /t 4 >nul
start explorer.exe

cls
call Scripts\rosto.cmd
echo Hp dojxp prphqwr, ixl r prwrulvwd gd plqkd ylgd... Djrud vrx dshqdv xp sdvvdjhlur. Ghviuxwdqgr dshqdv gd sdvvdjhp gr ioxar lqharuáyho gr whpsr. > "%USERPROFILE%\Desktop\yasfgf6a78.txt"
%Wait2%
echo - Olha o que apareceu na sua area de trabalho...
goto Enigma1
pause

:Nao
%Wait2%
echo - Pelo menos voce e honesto sobre suas correntes.
%Wait2%
echo Hp dojxp prphqwr, ixl r prwrulvwd gd plqkd ylgd... Djrud vrx dshqdv xp sdvvdjhlur. Ghviuxwdqgr dshqdv gd sdvvdjhp gr ioxar lqharuáyho gr whpsr. > "%USERPROFILE%\Desktop\yasfgf6a78.txt"
%Wait2%
echo - Olha o que apareceu na sua area de trabalho...
goto Enigma1
pause

:Enigma1

%Wait2%
cls
call Scripts\rosto.cmd
%Wait2%
echo - Me fale depois o que descobriu...

set /p "input=@"

:: Verifica se tem "motorista"
echo "%input%" | findstr /i "motorista" >nul
if %errorlevel% neq 0 goto ErroEnigma1

:: Verifica se tem "passageiro"
echo "%input%" | findstr /i "passageiro" >nul
if %errorlevel% neq 0 goto ErroEnigma1

:: Verifica se tem "fluxo" (opcional, para ser mais preciso)
echo "%input%" | findstr /i "fluxo" >nul
if %errorlevel% neq 0 goto ErroEnigma1

goto ResolveuEnigma1

:ErroEnigma1
cls
call Scripts\rosto.cmd
%Wait2%
echo - Nao... nao e isso.
%Wait2%
echo - O que estava escrito naquele arquivo? Traduza para mim.
%Wait2% 
echo - Cesar fez isso uma vez...
goto Enigma1

:ResolveuEnigma1
cls
call Scripts\rosto.cmd
%Wait2%
echo - Voce parece mais inteligente do que realmente e...
%Wait2%
echo - Certo
%Wait2% 
cls
call Scripts\rosto.cmd
echo - Voce vai servir...

:Parte2
%Wait2%
echo - Olhe o seu navegador
%Wait2%
start https://oficinadoestudante.com.br/tira-duvidas/4928/Ponte-de-Einstein-Rosen-Buraco-de-minhoca.html
%Wait5%
echo - O que voce acha sobre a Ponte de Einstein-Rosen?
set /p "input=@"
cls
call Scripts\rostog.cmd
%Wait1%
echo - Eu discordo... 
%Wait1%
echo - Eu discordo... 
%Wait1%
echo - Você está mentindo... 
cls
call Scripts\rostog.cmd
%Wait1%
echo - Eles conseguem te ver
%Wait1%
echo - Eles conseguem te ver
echo msgbox"Erro ao executar \#$co8da", vbCritical, "CONSEGUEM VER">%temp%\erro.vbs
start %temp%\erro.vbs
echo msgbox"Erro ao executar \#$co8da", vbCritical, "ELES CONSEGUEM VER">%temp%\erro.vbs
start %temp%\erro.vbs
echo msgbox"Erro ao executar \sdfsdfa", vbCritical, "ELES CONSEGUEM TE VER">%temp%\erro.vbs
start %temp%\erro.vbs
echo msgbox"Erro ao executar \#$vcvvx", vbCritical, "d56fdst7ybumi@#$&*@#!>%temp%\erro.vbs
start %temp%\erro.vbs
echo msgbox"Erro ao executar \#$&*()#", vbCritical, "$dsfsdfsdf&#@*#">%temp%\erro.vbs
start %temp%\erro.vbs
echo msgbox"Erro ao executar \#$DHNASI*", vbCritical, "sfof!@#$Sds">%temp%\erro.vbs
start %temp%\erro.vbs
cls
color a
call Scripts\rosto.cmd
echo - Ops, um pequeno erro de software...
%Wait2%
echo Eles conseguem te ver, eles conseguem te escutar, eles sabem tudo sobre voce > "%USERPROFILE%\Desktop\yasfgf6a78.txt"
echo Nao confie em nada que el@ disser! > "%USERPROFILE%\Desktop\yasfgf6a78.txt"	

:Parte3
%Wait5%
echo - Vamos voltar para o navegador...
%Wait2%
echo - Volte aqui depois de ler um pouco...
%Wait2%
:: Abre o link sobre Buraco de Minhoca
start https://oficinadoestudante.com.br/tira-duvidas/4928/Ponte-de-Einstein-Rosen-Buraco-de-minhoca.html

:: Troca de rosto entre vermelho e verde
cls
color c
call Scripts\rostog.cmd
%Wait05%
cls
color a
call Scripts\rosto.cmd

%Wait10%
echo - A teoria diz que e possivel conectar dois pontos distantes.
%Wait2%
echo - Imagine que a sua tela e o Universo. Uma folha de papel plana.
%Wait2%
echo - Eu estou no Ponto A (Aqui). Voce esta no Ponto B (Ai).
%Wait5%



:EnigmaPonte

cls
call Scripts\rosto.cmd

echo.
echo - Para nos unirmos AGORA, sem viajar a distancia...
%Wait2%
echo - O que voce precisa fazer com o papel?
set /p "input=@ "

cls
call Scripts\rosto.cmd

:: Verifica se a resposta contém "DOBRA" ou "DOBRAR"
echo "%input%" | findstr /i "dobra" >nul
if %errorlevel% == 0 goto AtravessarPonte

:: Verifica em inglês caso o jogador seja bilíngue
echo "%input%" | findstr /i "fold" >nul
if %errorlevel% == 0 goto AtravessarPonte

:: Se errar
echo.
echo - Nao... se voce caminhar, levara uma eternidade.
echo - Tente pensar fora da dimensao.
goto EnigmaPonte

:AtravessarPonte
%Wait1%
echo - Exatamente...
%Wait1%
echo - Voce dobra o espaco.
%Wait1%
echo - E quando voce dobra...

:: EFEITO DE "VIAJAR" PELA PONTE (Pisca a tela)
%Wait05%
color 0a
cls
%Wait05%
echo ABRINDO A PONTE...
color f0
%Wait05%
cls
call Scripts\rosto.cmd
color 0a
%Wait05%
cls
call Scripts\rosto.cmd
color f0
%Wait05%
cls

:: O SUSTO (A Rize Ghoul atravessou)
color 0c
%Wait05%
call Scripts\rostog.cmd
%Wait05%
echo - ...AS COISAS SE APROXIMAM!
echo.
%Wait2%

:: Volta ao normal assustador
color 0a

echo - Agora estamos muito mais perto, %username%.
%Wait2%
echo - Eles conseguem te ver atraves da fenda.


:: Simulação de erro e invasão
start %CaminhoMusica%\porta.mp3	
echo msgbox"A PONTE FOI ABERTA.", vbCritical, "ALERTA DE SISTEMA">%temp%\bridge.vbs
start %temp%\bridge.vbs

%Wait2%
echo Nao olhe para tras. > "%USERPROFILE%\Desktop\yasfgf6a78.txt"
echo Eles estao passando pela ponte agora. >> "%USERPROFILE%\Desktop\yasfgf6a78.txt"
echo Proximo enigma que eu nao faço ideia do que fazer. >> "%USERPROFILE%\Desktop\ponte.txt"
%Wait5%
echo - Mais outro erro de software... 
%Wait5%

cls
call Scripts\rostog.cmd

:VigiaProcessos
%Wait2%
echo - Deixe-me ver o que mais esta aberto no seu PC...
%Wait2%

:: --- 1. VERIFICA WHATSAPP (Prioridade Máxima) ---
tasklist /FI "IMAGENAME eq WhatsApp.exe" 2>NUL | find /I /N "WhatsApp.exe">NUL
if "%ERRORLEVEL%"=="0" (
    echo - Voce esta com o WhatsApp aberto.
    %Wait2%
    echo - Diga a eles que voce esta ocupado agora.
    %Wait2%
    echo - Ou melhor... nao diga nada.
    goto FimVigia
)

:: --- 2. VERIFICA DISCORD ---
tasklist /FI "IMAGENAME eq Discord.exe" 2>NUL | find /I /N "Discord.exe">NUL
if "%ERRORLEVEL%"=="0" (
    echo - Vejo que o Discord esta rodando.
    %Wait2%
    echo - Seus amigos nao podem te ajudar aqui dentro.
    goto FimVigia
)

:: --- 3. VERIFICA MICROSOFT EDGE ---
tasklist /FI "IMAGENAME eq msedge.exe" 2>NUL | find /I /N "msedge.exe">NUL
if "%ERRORLEVEL%"=="0" (
    echo - Usando o Microsoft Edge?
    %Wait2%
    echo - Procurando respostas na internet?
    echo - Nao adianta, eu ja fechei as saidas.
    goto FimVigia
)

:: --- 4. VERIFICA CHROME ---
tasklist /FI "IMAGENAME eq chrome.exe" 2>NUL | find /I /N "chrome.exe">NUL
if "%ERRORLEVEL%"=="0" (
    echo - O Google Chrome esta aberto...
    %Wait2%
    echo - Voce pode ter todo o conhecimento do mundo la fora.
    echo - Mas aqui dentro, voce so tem a mim.
    goto FimVigia
)

:: --- 5. VERIFICA SPOTIFY ---
tasklist /FI "IMAGENAME eq Spotify.exe" 2>NUL | find /I /N "Spotify.exe">NUL
if "%ERRORLEVEL%"=="0" (
    echo - Ouvindo musica no Spotify?
    %Wait2%
    echo - Espero que a trilha sonora esteja boa para o fim.
    goto FimVigia
)

:: --- CASO NÃO ACHE NADA ---
cls
call Scripts\rostog.cmd
echo - Parece que voce esta focado apenas em mim.
%Wait2%
echo - Perfeito.

:FimVigia
%Wait2%
echo - Vamos continuar.
%Wait2%
echo - Verifique a sua area de trabalho...

:Parte4

pause

pause
