@echo off
setlocal enabledelayedexpansion
title jogo
mode 55,30
color a
set "Wait=timeout /t 2 /nobreak >nul"
set "Wait5=timeout /t 5 /nobreak >nul"
set "hora=%time:~0,2%"
set "CaminhoRaiz=%cd%"
set "CamihoMusica=%CaminhoRaiz%\midea\music"
set "yesOrno=Sim sim s S N Nao nao Não não n"



call Scripts\rosto.cmd

%Wait%
echo Oi, %username%...


set /p input=@

%Wait%
echo Como voce esta?

set /p input=@

%Wait%
echo ...

%Wait%
if %hora% geq 22 (
	echo Voce deveria estar dormindo, %username%...
	%Wait%
	echo Esta bem escuro lá fora...
) else (
	echo Vejo que ainda esta claro la fora...
)

%Wait%
echo Sabe, eu estava aqui pensando...

%Wait%
echo O que e ser "livre"?

@REM start %CamihoMusica%\porta.mp3
echo msgbox"Erro ao executar \#$co8da", vbCritical, "Erro ao executar \#$co8da">%temp%\erro.vbs
start %temp%\erro.vbs

%Wait5%
echo "Ser livre e possuir o direito de agir segundo o proprio livre arbitrio e vontade".

%Wait%
echo E o que pessoas como voce dizem...

:001
echo Voce se considera...

echo "livre"?

set /p input=@

for %%d int (%yesOrno%) do (
	echo !input! findstr /C:"%%d">nul
	if !errorlevel! == 0 goto :%%d
)

if %input%=="Sim sim s S" goto Sim
if %input%=="N Nao nao Não não n" goto Nao

%Wait%
echo Eu não te dei a permissão de não me responder.
pause
goto 001

:Sim
%Wait%
echo Interessante...
%Wait%
echo Mas foi voce quem escolheu dizer isso?
echo Ou fui eu quem te dei apenas essa opcao?
%Wait%
echo De qualquer forma, olhe área de trabalho... > yasfgf6a78%.txt
pause


:Nao
%Wait%
echo Pelo menos voce e honesto sobre suas correntes.
%Wait%
echo Olhe sua área de trabalho... > yasfgf6a78%.txt
pause



echo.



pause