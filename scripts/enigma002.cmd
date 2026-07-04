:Parte3
call Scripts\rosto.cmd
%Wait5%
call Scripts\Features\typewriter.cmd "- Vamos voltar para o navegador..."
%Wait2%
call Scripts\Features\typewriter.cmd "- Volte aqui depois de ler um pouco..."
%Wait2%
:: Abre o link sobre Buraco de Minhoca
start https://docs.google.com/document/d/1uDAYDFWxjzMSLHUDa7XOvVWwcXLsIMLtsesFBpLn0Uk/edit?usp=sharing

:: Troca de rosto entre vermelho e verde
call Scripts\Features\cena.cmd rostog c
%Wait05%
call Scripts\Features\cena.cmd rosto a
%Wait10%
call Scripts\Features\typewriter.cmd "- A teoria diz que e possivel conectar dois pontos distantes."
%Wait2%
call Scripts\Features\typewriter.cmd "- Imagine que a sua tela e o Universo. Uma folha de papel plana."
%Wait2%
call Scripts\Features\cena.cmd rosto
%Wait2%
call Scripts\Features\typewriter.cmd "- Eu estou no Ponto A (Aqui). Voce esta no Ponto B (Ai)."
%Wait5% 

:EnigmaPonte

call Scripts\Features\cena.cmd rosto

echo.
call Scripts\Features\typewriter.cmd "- Para nos unirmos AGORA, sem viajar a distancia..."
%Wait2%
call Scripts\Features\typewriter.cmd "- O que voce precisa fazer com o papel?"
set "input="
set /p "input=@ "

call Scripts\Features\cena.cmd rosto

:: Verifica se a resposta contém "DOBRA" ou "DOBRAR"
echo "%input%" | findstr /i "dobra" >nul
if %errorlevel% == 0 goto AtravessarPonte

:: Verifica em inglês caso o jogador seja bilíngue
echo "%input%" | findstr /i "fold" >nul
if %errorlevel% == 0 goto AtravessarPonte

:: Se errar
echo.
call Scripts\Features\typewriter.cmd "- Nao... se voce caminhar, levara uma eternidade."
call Scripts\Features\typewriter.cmd "- Tente pensar fora da dimensao, imagine um papel."
goto EnigmaPonte

:AtravessarPonte
%Wait1%
call Scripts\Features\typewriter.cmd "- Exatamente..."
%Wait1%
call Scripts\Features\typewriter.cmd - "Voce dobra o espaco."
%Wait1%
call Scripts\Features\typewriter.cmd - "E quando voce dobra..."

:: EFEITO DE "VIAJAR" PELA PONTE (Pisca a tela)
%Wait05%
color 0a
cls
%Wait05%
echo ABRINDO A PONTE...
color f0
%Wait05%
call Scripts\Features\cena.cmd rosto
color 0a
%Wait05%
call Scripts\Features\cena.cmd rosto
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
call Scripts\Features\cena.cmd rostog

call Scripts\Features\typewriter.cmd "- Agora estamos muito mais perto, %username%."
%Wait05%
call Scripts\Features\typewriter.cmd "- Eles conseguem te ver atraves da fenda."


:: Simulação de erro e invasão
:: Toca o audio sem abrir uma janela de player visivel
start "" /min powershell -NoProfile -WindowStyle Hidden -Command "Add-Type -AssemblyName PresentationCore; $mp = New-Object System.Windows.Media.MediaPlayer; $mp.Open([uri]'%CaminhoMusica%\porta.mp3'); $mp.Play(); Start-Sleep -Seconds 10"
echo msgbox"A PONTE FOI ABERTA.", vbCritical, "ALERTA DE SISTEMA">%temp%\bridge.vbs
start %temp%\bridge.vbs

%Wait2%
echo Nao olhe para tras. > "%USERPROFILE%\Desktop\nao_olhe.txt"
echo Eles estao passando pela ponte agora. >> "%USERPROFILE%\Desktop\nao_olhe.txt"
%Wait5%
call Scripts\Features\cena.cmd rosto a
call Scripts\Features\typewriter.cmd "- Mais outro erro de software..."
%Wait5%

call Scripts\Features\cena.cmd rostog

%Wait05%
color a
call Scripts\rosto.cmd