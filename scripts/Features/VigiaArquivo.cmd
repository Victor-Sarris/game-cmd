:VigiaArquivo
cls
call Scripts\rosto.cmd
echo.
echo - Para provar que voce existe...
%Wait2%
echo - Crie um arquivo de texto na sua Area de Trabalho
echo   chamado "oferenda.txt".
%Wait2%
echo - Eu vou esperar.

:ChecarArquivo
:: Loop que verifica a cada 2 segundos se o arquivo existe
timeout /t 2 /nobreak >nul
if exist "%USERPROFILE%\Desktop\oferenda.txt" (
    goto ArquivoEncontrado
) else (
    echo - Ainda nao encontrei a oferenda...
    goto ChecarArquivo
)

:ArquivoEncontrado
cls
call Scripts\rostog.cmd
echo.
echo - ACEITO.
%Wait2%

:: Deleta o arquivo depois 
del "%USERPROFILE%\Desktop\oferenda.txt"
echo - Eu tomei sua oferenda. Ela se foi.
%Wait2%
goto :EOF