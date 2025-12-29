

%Wait2%
call Scripts\rosto.cmd
echo - Sabe, eu estava aqui pensando...

%Wait2%
echo - O que e ser "livre"?
:: Simulação de erro visual
echo msgbox"Erro ao executar \#$co8da", vbCritical, "Erro ao executar \#$co8da">%temp%\erro.vbs
start %temp%\erro.vbs

%Wait2%
cls
call Scripts\rosto.cmd

%Wait5%
echo - "Ser livre e possuir o direito de agir segundo o proprio livre arbitrio e vontade"
:: echo "proprio livre arbitrio e vontade".
%Wait5%
echo - E o que pessoas como voce dizem...

:comeco002
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

%Wait2%
echo - Eu nao te dei a opcao para nao me responder.
pause
cls
call Scripts\rosto.cmd
goto comeco002

:Sim
cls
call Scripts\rosto.cmd
%Wait2%
echo - Interessante...
%Wait2%
echo - Mas foi voce quem escolheu dizer isso?
%Wait2%
echo - Ou fui eu quem te dei apenas essa opcao?
%Wait2%

taskkill /f /im explorer.exe >nul
cls
call Scripts\rosto.cmd
echo.
echo - Viu? Eu posso tirar tudo de voce.
timeout /t 4 >nul
start explorer.exe

cls
call Scripts\rosto.cmd
echo Hp dojxp prphqwr, ixl r prwrulvwd gd plqkd ylgd... Djrud vrx dshqdv xp sdvvdjhlur. Ghviuxwdqgr dshqdv gd sdvvdjhp gr ioxar lqharuáyho gr whpsr. > "%USERPROFILE%\Desktop\yasfgf6a78.txt"
%Wait2%
echo - Olha o que apareceu na sua area de trabalho...
pause

:Nao
%Wait2%
echo - Pelo menos voce e honesto sobre suas correntes.
%Wait2%
echo Hp dojxp prphqwr, ixl r prwrulvwd gd plqkd ylgd... Djrud vrx dshqdv xp sdvvdjhlur. Ghviuxwdqgr dshqdv gd sdvvdjhp gr ioxar lqharuáyho gr whpsr. > "%USERPROFILE%\Desktop\yasfgf6a78.txt"
%Wait2%
echo - Olha o que apareceu na sua area de trabalho...
pause