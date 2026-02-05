

%Wait2%
call Scripts\rosto.cmd
call Scripts\Features\typewriter.cmd "- Sabe, eu estava aqui pensando..."

%Wait2%
call Scripts\Features\typewriter.cmd "- O que e ser "livre"?"
:: Simulação de erro visual
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
call Scripts\Features\typewriter.cmd "- Voce considera-se... ''Livre''"?
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
call Scripts\Features\typewriter.cmd "- Eu nao te dei a opcao para nao me responder."
pause
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
start explorer.exe

cls
call Scripts\rosto.cmd
echo Hp dojxp prphqwr, ixl r prwrulvwd gd plqkd ylgd... Djrud vrx dshqdv xp sdvvdjhlur. Ghviuxwdqgr dshqdv gd sdvvdjhp gr ioxar lqharuáyho gr whpsr. > "%USERPROFILE%\Desktop\yasfgf6a78.txt"
%Wait2%
call Scripts\Features\typewriter.cmd "- Olha o que apareceu na sua area de trabalho..."
pause

:Nao
%Wait2%
call Scripts\Features\typewriter.cmd "- Pelo menos voce e honesto sobre suas correntes."
%Wait2%
echo Hp dojxp prphqwr, ixl r prwrulvwd gd plqkd ylgd... Djrud vrx dshqdv xp sdvvdjhlur. Ghviuxwdqgr dshqdv gd sdvvdjhp gr ioxar lqharuáyho gr whpsr. > "%USERPROFILE%\Desktop\yasfgf6a78.txt"
%Wait2%
call Scripts\Features\typewriter.cmd "- Olha o que apareceu na sua area de trabalho..."
pause