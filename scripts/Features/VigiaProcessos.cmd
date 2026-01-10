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