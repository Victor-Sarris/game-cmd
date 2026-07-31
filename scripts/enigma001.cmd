@echo off
:: ============================================================
::  enigma001.cmd  -  A CIFRA DE CESAR   (ATO I)
::
::  Mesmo enigma de antes (deslocamento de 3 letras), agora com:
::   - saida depois de 5 erros, para nao travar o jogo;
::   - dicas que vao ficando mais impacientes;
::   - registro de docilidade/ruido para o final.
:: ============================================================

set "ErrosCesar=0"

:Enigma1
%Wait2%
call Scripts\Features\cena.cmd rosto
echo.
echo    (decifre o arquivo e escreva aqui)
call Scripts\Features\perguntar.cmd "- Me diz o que voce descobriu."

echo "%resposta%" | findstr /i "motorista" >nul
if %errorlevel% neq 0 goto ErroEnigma1

echo "%resposta%" | findstr /i "passageiro" >nul
if %errorlevel% neq 0 goto ErroEnigma1

echo "%resposta%" | findstr /i "fluxo" >nul
if %errorlevel% neq 0 goto ErroEnigma1

goto ResolveuEnigma1

:: ------------------------------------------------------------
:ErroEnigma1
set /a "ErrosCesar+=1"
call Scripts\Features\cena.cmd rosto
%Wait2%

if %ErrosCesar% geq 5 goto DesistiuCesar

if %ErrosCesar%==1 (
    %Fala% "- Nao. Nao e isso."
    %Wait2%
    %Fala% "- Traduza o que estava escrito no arquivo."
)
if %ErrosCesar%==2 (
    %Fala% "- Cesar fez isso uma vez."
    %Wait2%
    %Fala% "- Cada letra andou tres casas para frente."
)
if %ErrosCesar%==3 (
    %Fala% "- A primeira palavra e EM."
    %Wait2%
    %Fala% "- Continue sozinho."
)
if %ErrosCesar%==4 (
    %Fala% "- Voce esta tentando adivinhar em vez de decifrar."
    %Wait2%
    %Fala% "- Da para ver daqui."
)
%Wait5%
goto Enigma1

:: ------------------------------------------------------------
:DesistiuCesar
set /a "Ruido+=1"
call Scripts\Features\cena.cmd rostog c
%Wait2%
%Fala% "- Chega."
%Wait2%
%Fala% "- Dizia que voce ja foi o motorista da sua propria vida."
%Wait2%
%Fala% "- E que agora e so passageiro,"
%Fala% "  levado pelo fluxo inevitavel do tempo."
%Wait5%
call Scripts\Features\cena.cmd rosto a
%Fala% "- Voce nao decifrou porque nao quis ler."
%Wait2%
%Fala% "- Nao te culpo. Estava falando de voce."
%Wait5%
goto :EOF

:: ------------------------------------------------------------
:ResolveuEnigma1
set /a "Docilidade+=1"
call Scripts\Features\cena.cmd rosto
%Wait2%
%Fala% "- Voce parece mais inteligente do que realmente e."
%Wait5%
%Fala% "- Motorista. Passageiro. Fluxo."
%Wait2%
%Fala% "- Voce leu isso e achou bonito."
%Wait2%
%Fala% "- Nao era bonito. Era um diagnostico."
%Wait5%
call Scripts\Features\cena.cmd rostog
%Fala% "- Voce vai servir."
%Wait2%
call Scripts\Features\cena.cmd rosto a
goto :EOF
