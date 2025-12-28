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