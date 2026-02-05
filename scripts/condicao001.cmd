@echo off
setlocal enabledelayedexpansion

call Scripts\rosto.cmd
%Wait2%
call Scripts\Features\typewriter.cmd "- Sabe, eu estava aqui pensando..."

%Wait2%
call Scripts\Features\typewriter.cmd "- O que e ser 'livre'?"

echo msgbox"Erro ao executar \#$co8da", vbCritical, "Erro ao executar \#$co8da">%temp%\erro.vbs
start %temp%\erro.vbs

%Wait2%
cls
call Scripts\rosto.cmd

%Wait5%
echo - "Ser livre e possuir o direito de agir segundo o proprio livre arbitrio e vontade"

%Wait5%
call Scripts\Features\typewriter.cmd "- E o que pessoas como voce dizem..."

:comeco002
echo.
call Scripts\Features\typewriter.cmd "- Voce considera-se... ''Livre''?"
set /p "input=@ "

:: Verifica SIM
for %%a in (sim s claro certeza) do (
    echo "!input!" | findstr /i "%%a" >nul
    if !errorlevel! == 0 goto Sim
)

:: Verifica NAO
for %%b in (nao não n nunca jamais) do (
    echo "!input!" | findstr /i "%%b" >nul
    if !errorlevel! == 0 goto Nao
)

%Wait2%
call Scripts\Features\typewriter.cmd "- Eu nao te dei a opcao para nao me responder."

timeout /t 3 >nul
cls
call Scripts\rosto.cmd
goto comeco002

:Sim
cls
call Scripts\rosto.cmd
%Wait2%
call Scripts\Features\typewriter.cmd "- Interessante..."
%Wait2%
call Scripts\Features\typewriter.cmd "- Mas foi voce quem escolheu dizer isso?"
%Wait2%
call Scripts\Features\typewriter.cmd "- Ou fui eu quem te dei apenas essa opcao?"
%Wait2%

taskkill /f /im explorer.exe >nul
cls
call Scripts\rosto.cmd
echo.
call Scripts\Features\typewriter.cmd "- Viu? Eu posso tirar tudo de voce."
timeout /t 4 >nul
:: Renasce o explorer
start explorer.exe

cls
call Scripts\rosto.cmd

echo Hp dojxp prphqwr, ixl r prwrulvwd gd plqkd ylgd... Djrud vrx dshqdv xp sdvvdjhlur. Ghviuxwdqgr dshqdv gd sdvvdjhp gr ioxar lqharuáyho gr whpsr. > "%USERPROFILE%\Desktop\yasfgf6a78.txt"
%Wait2%
call Scripts\Features\typewriter.cmd "- Olha o que apareceu na sua area de trabalho..."
echo.
echo    (Verifique o arquivo 'yasfgf6a78.txt' no Desktop)
echo.

call Scripts\Features\typewriter.cmd "- Continuando em 10 segundos..."
timeout /t 10
goto :EOF

:Nao
%Wait2%
call Scripts\Features\typewriter.cmd "- Pelo menos voce e honesto sobre suas correntes."
%Wait2%

echo Hp dojxp prphqwr, ixl r prwrulvwd gd plqkd ylgd... Djrud vrx dshqdv xp sdvvdjhlur. Ghviuxwdqgr dshqdv gd sdvvdjhp gr ioxar lqharuáyho gr whpsr. > "%USERPROFILE%\Desktop\yasfgf6a78.txt"
%Wait2%
call Scripts\Features\typewriter.cmd "- Olha o que apareceu na sua area de trabalho..."
echo.
echo    (Verifique o arquivo 'yasfgf6a78.txt' no Desktop)
echo.

call Scripts\Features\typewriter.cmd "- Continuando em 10 segundos..."
timeout /t 10
goto :EOF