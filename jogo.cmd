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

set "Wait=timeout /t 2 /nobreak >nul"
set "Wait5=timeout /t 5 /nobreak >nul"
set "CaminhoRaiz=%cd%"
set "yesOrno=Sim sim s S N Nao nao Não não n"

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

%Wait%
echo - Oi, %username%...

%Wait%

:001
echo - Como voce esta?
set /p "input=@"
cls
call Scripts\rosto.cmd

if "%input%"=="" goto 001

%Wait%
echo ...

%Wait%
:: Agora a verificação é segura
if %hora% geq 22 (
	echo - Voce deveria estar dormindo, %username%...
	%Wait%
	echo - Esta bem escuro la fora...
) else (
	echo - Vejo que ainda esta claro la fora...
)

%Wait%
echo - Sabe, eu estava aqui pensando...

%Wait%
echo - O que e ser "livre"?
:: Simulação de erro visual
echo msgbox"Erro ao executar \#$co8da", vbCritical, "Erro ao executar \#$co8da">%temp%\erro.vbs
start %temp%\erro.vbs

%Wait%
cls
call Scripts\rosto.cmd

%Wait5%
echo - "Ser livre e possuir o direito de agir segundo o"
echo "proprio livre arbitrio e vontade".
%Wait5%
echo - E o que pessoas como voce dizem...

%Wait%
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

%Wait%
echo - Eu nao te dei a opcao para nao me responder.
pause
cls
call Scripts\rosto.cmd
goto 002

:Sim
cls
call Scripts\rosto.cmd
%Wait%
echo - Interessante...
%Wait%
echo - Mas foi voce quem escolheu dizer isso?
%Wait%
echo - Ou fui eu quem te dei apenas essa opcao?
%Wait%
cls
call Scripts\rosto.cmd
echo Hp dojxp prphqwr, ixl r prwrulvwd gd plqkd ylgd... Djrud vrx dshqdv xp sdvvdjhlur. Ghviuxwdqgr dshqdv gd sdvvdjhp gr ioxar lqharuáyho gr whpsr. > "%USERPROFILE%\Desktop\yasfgf6a78.txt"
%Wait%
echo - Olha o que apareceu na sua area de trabalho...
goto Enigma1
pause

:Nao
%Wait%
echo - Pelo menos voce e honesto sobre suas correntes.
%Wait%
echo Hp dojxp prphqwr, ixl r prwrulvwd gd plqkd ylgd... Djrud vrx dshqdv xp sdvvdjhlur. Ghviuxwdqgr dshqdv gd sdvvdjhp gr ioxar lqharuáyho gr whpsr. > "%USERPROFILE%\Desktop\yasfgf6a78.txt"
%Wait%
echo - Olha o que apareceu na sua area de trabalho...
goto Enigma1
pause

:Enigma1

%Wait%
cls
call Scripts\rosto.cmd
%Wait%
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
%Wait%
echo - Nao... nao e isso.
%Wait%
echo - O que estava escrito naquele arquivo? Traduza para mim.
goto Enigma1

:ResolveuEnigma1
cls
call Scripts\rosto.cmd
%Wait%
echo - Voce parece mais inteligente do que realmente e...
%Wait%
echo - Certo
%Wait% 
cls
call Scripts\rosto.cmd
echo - Você vai servir

%Wait5%
start https://oficinadoestudante.com.br/tira-duvidas/4928/Ponte-de-Einstein-Rosen-Buraco-de-minhoca.html





