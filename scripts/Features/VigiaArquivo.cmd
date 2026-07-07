:VigiaArquivo
call Scripts\Features\cena.cmd rosto
echo.
call Scripts\Features\typewriter.cmd "- Para provar que voce existe..."
%Wait2%
call Scripts\Features\typewriter.cmd "- Crie um arquivo de texto na sua Area de Trabalho"
echo   chamado "oferenda.txt".
%Wait2%
call Scripts\Features\typewriter.cmd "- Eu vou esperar."

:ChecarArquivo
:: Loop que verifica a cada 10 segundos se o arquivo existe
timeout /t 10 /nobreak >nul
if exist "%USERPROFILE%\Desktop\oferenda.txt" (
    goto ArquivoEncontrado
) else (
    call Scripts\Features\typewriter.cmd "- Ainda nao encontrei a oferenda..."
    goto ChecarArquivo
)

:ArquivoEncontrado
call Scripts\Features\cena.cmd rostog
echo.
echo - ACEITO.
%Wait2%

:: Deleta o arquivo depois 
del "%USERPROFILE%\Desktop\oferenda.txt"
call Scripts\Features\typewriter.cmd "- Eu tomei sua oferenda. Ela se foi."
%Wait2%
goto :EOF