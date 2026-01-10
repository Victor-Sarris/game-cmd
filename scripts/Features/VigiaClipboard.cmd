:VigiaClipboard
%Wait2%
cls
call Scripts\rosto.cmd
echo.
echo - Eu deixei um recado para voce...
%Wait2%
echo - Nao aqui. Na sua memoria.
%Wait2%
echo - Tente "colar" (Ctrl+V) em algum lugar...
%Wait2%

:: O comando 'clip' redireciona o texto para a área de transferência do Windows
echo ELE ESTA TE OBSERVANDO AGORA. > clip

echo - Ja esta feito.
%Wait2%
goto :EOF