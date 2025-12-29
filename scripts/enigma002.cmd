:Parte3
call Scripts\rosto.cmd
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
cls
call Scripts\rosto.cmd
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
echo - Tente pensar fora da dimensao, imagine um papel.
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

cls
call Scripts\rostog.cmd

echo - Agora estamos muito mais perto, %username%.
%Wait05%
echo - Eles conseguem te ver atraves da fenda.


:: Simulação de erro e invasão
start %CaminhoMusica%\porta.mp3	
echo msgbox"A PONTE FOI ABERTA.", vbCritical, "ALERTA DE SISTEMA">%temp%\bridge.vbs
start %temp%\bridge.vbs

%Wait2%
echo Nao olhe para tras. > "%USERPROFILE%\Desktop\nao_olhe.txt"
echo Eles estao passando pela ponte agora. >> "%USERPROFILE%\Desktop\nao_olhe.txt"
echo Proximo enigma que eu nao faço ideia do que fazer. >> "%USERPROFILE%\Desktop\ponte.txt"
%Wait5%
cls
color a
call Scripts\rosto.cmd
echo - Mais outro erro de software... 
%Wait5%

cls
call Scripts\rostog.cmd

%Wait05%
color a
call Scripts\rosto.cmd