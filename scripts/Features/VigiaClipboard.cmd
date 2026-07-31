@echo off
:: ============================================================
::  VigiaClipboard.cmd  -  O RECADO NA SUA MEMORIA
::
::  CORRECAO DE BUG: a versao antiga usava
::      echo TEXTO > clip
::  que cria um ARQUIVO chamado "clip" na pasta do jogo em vez de
::  escrever na area de transferencia. A cena nunca funcionou.
::  O certo e o PIPE:
::      echo TEXTO | clip
:: ============================================================

%Wait2%
call Scripts\Features\cena.cmd rosto
echo.
%Fala% "- Eu deixei um recado para voce."
%Wait2%
%Fala% "- Nao aqui. Na sua memoria."
%Wait2%

:: (o arquivo "clip" que a versao com bug criava, se existir)
del /q "clip" 2>nul

echo ELE ESTA TE OBSERVANDO AGORA. %username% | clip

%Fala% "- Ja esta feito."
%Wait5%
call Scripts\Features\cena.cmd rostog
%Fala% "- Aperta Ctrl+V em qualquer lugar."
%Wait2%
%Fala% "- Aqui mesmo serve."
%Wait10%
call Scripts\Features\cena.cmd rosto a
%Fala% "- Voce nao vai lembrar de limpar isso."
%Wait2%
%Fala% "- Amanha voce vai colar em algum lugar sem pensar."
%Wait2%
%Fala% "- E ai eu apareco de novo."
%Wait5%
goto :EOF
