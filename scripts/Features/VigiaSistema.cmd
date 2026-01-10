:VigiaSistema
cls
color c
call Scripts\rostog.cmd
%Wait2%
echo - Voce acha que esta no controle?
%Wait2%
echo - Este computador obedece a mim agora.
%Wait2%

:: Inicia o desligamento em 60 segundos com uma mensagem
shutdown -s -t 60 -c "FALHA CRITICA DO SISTEMA - A ENTIDADE ASSUMIU O CONTROLE"

echo - Adeus, %username%.
%Wait5%
echo - ...
%Wait2%
echo - Brincadeira.

:: Cancela o desligamento
shutdown -a
cls
color a
call Scripts\rosto.cmd
echo - Eu decido quando termina.
%Wait2%
goto :EOF