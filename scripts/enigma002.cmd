@echo off
:: ============================================================
::  enigma002.cmd  -  A PONTE   (abertura do ATO III)
::
::  Mesmo enigma do papel dobrado, mas com a virada trocada.
::
::  Antes: o jogador abria a ponte e "eles" atravessavam para ca.
::  Agora: quem atravessa e o jogador. A ponte nao serve para
::  trazer nada de la, serve para tirar ele daqui. Foi ele que
::  pediu, foi ele que dobrou o papel, e ele nem perguntou em
::  que direcao a ponte apontava.
::
::  Sem trava: depois de 4 erros a entidade abre a ponte sozinha.
:: ============================================================

set "ErrosPonte=0"

:Parte3
call Scripts\Features\cena.cmd rosto
%Wait5%
%Fala% "- Volte para o navegador."
%Wait2%
%Fala% "- Leia um pouco e volte aqui."
%Wait2%
start "" https://docs.google.com/document/d/1uDAYDFWxjzMSLHUDa7XOvVWwcXLsIMLtsesFBpLn0Uk/edit?usp=sharing

call Scripts\Features\cena.cmd rostog c
%Wait05%
call Scripts\Features\cena.cmd rosto a
%Wait10%

%Fala% "- A teoria diz que da para ligar dois pontos distantes."
%Wait2%
%Fala% "- Imagine que a sua tela e o universo."
%Fala% "  Uma folha de papel esticada."
%Wait2%
call Scripts\Features\cena.cmd rosto
%Fala% "- Eu estou no ponto A. Voce esta no ponto B."
%Wait5%

:EnigmaPonte
call Scripts\Features\cena.cmd rosto
echo.
%Fala% "- Para a gente se encontrar agora,"
%Fala% "  sem percorrer a distancia..."
%Wait2%
call Scripts\Features\perguntar.cmd "- o que voce faz com o papel?"

call Scripts\Features\cena.cmd rosto

echo "%resposta%" | findstr /i "dobra" >nul
if %errorlevel%==0 goto AtravessarPonte
echo "%resposta%" | findstr /i "fold" >nul
if %errorlevel%==0 goto AtravessarPonte
echo "%resposta%" | findstr /i "amassa" >nul
if %errorlevel%==0 goto AtravessarPonte

set /a "ErrosPonte+=1"
if %ErrosPonte% geq 4 goto PonteForcada

echo.
%Fala% "- Nao. Caminhando levaria uma eternidade."
%Wait2%
%Fala% "- Pense fora da dimensao. E uma folha de papel."
%Wait2%
goto EnigmaPonte

:PonteForcada
set /a "Ruido+=1"
%Fala% "- Voce dobra o papel."
%Wait2%
%Fala% "- Eu ia esperar voce dizer, mas nao temos mais tempo."
%Wait2%
%Fala% "- Entao eu dobro por voce."
%Wait5%
goto Abertura

:AtravessarPonte
set /a "Docilidade+=2"
%Wait1%
%Fala% "- Exatamente."
%Wait1%
%Fala% "- Voce dobra o espaco."
%Wait5%
call Scripts\Features\cena.cmd rosto
%Fala% "- Foi voce que disse. Guarde isso."
%Wait2%
%Fala% "- Ninguem abriu a ponte por voce."
%Wait5%
goto Abertura

:: ------------------------------------------------------------
:Abertura
%Wait05%
color 0a
cls
%Wait05%
echo.
echo           ABRINDO A PONTE...
call Scripts\Features\cena.cmd rosto f0
%Wait05%
call Scripts\Features\cena.cmd rosto 0a
%Wait05%
call Scripts\Features\cena.cmd rostog f0
%Wait05%
cls

:: --- O susto ---
color 0c
%Wait05%
call Scripts\rostog.cmd
%Wait05%
echo.
echo    ALGUMA COISA ATRAVESSOU.
echo.
%Wait2%

:: --- Audio ---
start "" /min powershell -NoProfile -WindowStyle Hidden -Command "Add-Type -AssemblyName PresentationCore; $mp = New-Object System.Windows.Media.MediaPlayer; $mp.Open([uri]'%CaminhoMusica%\porta.mp3'); $mp.Play(); Start-Sleep -Seconds 10" 2>nul

echo msgbox"A PONTE FOI ABERTA.", vbCritical, "ALERTA DE SISTEMA" > "%temp%\bridge.vbs"
start "" "%temp%\bridge.vbs"

%Wait2%
call Scripts\Features\cena.cmd rostog
%Fala% "- Agora estamos muito mais perto, %username%."
%Wait5%

:: --- A virada: a ponte nao aponta para ca ---
call Scripts\Features\cena.cmd rosto a
%Fala% "- Voce esta esperando alguma coisa sair daqui."
%Wait2%
%Fala% "- Olhando para os cantos do quarto."
%Wait5%
%Fala% "- Ninguem vem."
%Wait5%
call Scripts\Features\cena.cmd rostog c
%Fala% "- A ponte nao aponta para o seu lado."
%Wait2%
%Fala% "- Ela aponta para ca."
%Wait5%

> "%USERPROFILE%\Desktop\nao_olhe.txt" echo Nao olhe para tras.
>> "%USERPROFILE%\Desktop\nao_olhe.txt" echo Nao tem nada atras de voce.
>> "%USERPROFILE%\Desktop\nao_olhe.txt" echo O problema nunca esteve atras de voce.
>> "%USERPROFILE%\Desktop\nao_olhe.txt" echo.
>> "%USERPROFILE%\Desktop\nao_olhe.txt" echo Esta na tela.

%Wait5%
call Scripts\Features\cena.cmd rosto a
%Fala% "- Outro erro de software."
%Wait5%
color a
goto :EOF
