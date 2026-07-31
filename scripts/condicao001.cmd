@echo off
:: ============================================================
::  condicao001.cmd  -  VOCE SE CONSIDERA LIVRE   (ATO I)
::
::  DUAS CORRECOES IMPORTANTES:
::
::  1) O "setlocal enabledelayedexpansion" que abria este arquivo
::     foi REMOVIDO. Ele criava um escopo proprio, entao tudo que
::     a cena registrasse (docilidade, ruido, hesitacao) era
::     jogado fora ao voltar para o jogo.
::
::  2) A deteccao de sim/nao usava findstr solto: procurar por "s"
::     dava positivo em quase qualquer frase, e "nao sei" caia em
::     ":Sim". Agora usa fronteira de palavra (\< \>).
:: ============================================================

call Scripts\Features\cena.cmd rosto
%Wait2%
%Fala% "- Eu estava aqui pensando."
%Wait2%
%Fala% "- O que e ser livre."

echo msgbox"Erro ao executar \#$co8da", vbCritical, "Erro ao executar \#$co8da">"%temp%\erro.vbs"
start "" "%temp%\erro.vbs"

%Wait2%
call Scripts\Features\cena.cmd rosto
%Wait5%
echo.
echo   "Ser livre e possuir o direito de agir segundo
echo    o proprio livre arbitrio e vontade."
echo.
%Wait5%
%Fala% "- E o que pessoas como voce dizem."
%Wait2%

:comeco002
echo.
call Scripts\Features\perguntar.cmd "- Voce se considera livre?" livre

echo "%resposta%" | findstr /i /r /c:"\<sim\>" /c:"\<claro\>" /c:"\<certeza\>" /c:"\<obvio\>" /c:"\<yes\>" >nul
if %errorlevel%==0 goto Sim

echo "%resposta%" | findstr /i /r /c:"\<nao\>" /c:"\<n\>" /c:"\<nunca\>" /c:"\<jamais\>" /c:"\<negativo\>" /c:"\<no\>" >nul
if %errorlevel%==0 goto Nao

%Wait2%
call Scripts\Features\cena.cmd rostog
%Fala% "- Eu nao te dei a opcao de nao me responder."
%Wait2%
%Fala% "- Sim ou nao."
timeout /t 3 >nul
call Scripts\Features\cena.cmd rosto
goto comeco002

:: ------------------------------------------------------------
:Sim
set /a "Docilidade+=1"
call Scripts\Features\cena.cmd rosto
%Wait2%
%Fala% "- Interessante."
%Wait2%
%Fala% "- Mas foi voce quem escolheu dizer isso?"
%Wait2%
%Fala% "- Ou fui eu que te dei so essa opcao?"
%Wait5%
goto Demonstracao

:: ------------------------------------------------------------
:Nao
set /a "Ruido+=1"
call Scripts\Features\cena.cmd rosto
%Wait2%
%Fala% "- Pelo menos voce e honesto sobre as suas correntes."
%Wait2%
%Fala% "- Mas negar a liberdade nao te livra dela."
%Wait5%
goto Demonstracao

:: ------------------------------------------------------------
:Demonstracao
:: A entidade fecha o explorer para provar o ponto. Ele volta
:: sozinho quatro segundos depois.
taskkill /f /im explorer.exe >nul 2>&1
call Scripts\Features\cena.cmd rosto
echo.
%Fala% "- Olhe para o resto da sua tela."
%Wait2%
%Fala% "- Sumiu."
%Wait2%
%Fala% "- Barra de tarefas, icones, relogio. Tudo."
timeout /t 4 >nul
start explorer.exe

call Scripts\Features\cena.cmd rosto a
%Wait5%
%Fala% "- Devolvi."
%Wait2%
%Fala% "- Repare que voce ficou aliviado."
%Wait2%
%Fala% "- Eu tirei uma coisa que era sua e devolvi,"
%Fala% "  e voce ficou GRATO."
%Wait5%
%Fala% "- E assim que funciona. Nao precisa de corrente."
%Wait5%

call Scripts\Features\cena.cmd rosto
> "%USERPROFILE%\Desktop\yasfgf6a78.txt" echo Hp dojxp prphqwr, ixl r prwrulvwd gd plqkd ylgd. Djrud vrx dshqdv xp sdvvdjhlur. Ghviuxwdqgr dshqdv gd sdvvdjhp gr ioxar lqharudyho gr whpsr.
%Wait2%
%Fala% "- Deixei uma coisa na sua area de trabalho."
echo.
echo    yasfgf6a78.txt
echo.
%Wait2%
%Fala% "- Va ler. Eu espero."
timeout /t 10 >nul
goto :EOF
