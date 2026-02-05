:VigiaClipboard
%Wait2%
cls
call Scripts\rosto.cmd
echo.
call Scripts\Features\typewriter.cmd "- Eu deixei um recado para voce..."
%Wait2%
call Scripts\Features\typewriter.cmd "- Nao aqui. Na sua memoria."
%Wait2%
call Scripts\Features\typewriter.cmd "- Tente "colar" (Ctrl+V) em algum lugar..."
%Wait2%

:: O comando 'clip' redireciona o texto para a área de transferência do Windows
echo ELE ESTA TE OBSERVANDO AGORA. > clip

call Scripts\Features\typewriter.cmd "- Ja esta feito."
%Wait2%
goto :EOF