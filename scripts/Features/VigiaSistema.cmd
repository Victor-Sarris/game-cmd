:VigiaSistema
cls
color c
call Scripts\rostog.cmd
%Wait2%
call Scripts\Features\typewriter.cmd "- Voce acha que esta no controle?"
%Wait2%
echo "- Este computador obedece a mim agora."
%Wait2%

:: Inicia o desligamento em 10 segundos com uma mensagem
shutdown -s -t 10 -c "FALHA CRITICA DO SISTEMA - A ENTIDADE ASSUMIU O CONTROLE"

call Scripts\Features\typewriter.cmd "- Adeus, %username%."
%Wait5%
call Scripts\Features\typewriter.cmd "- ..."
%Wait2%
call Scripts\Features\typewriter.cmd "- Carpedim"

:: Cancela o desligamento
shutdown -a
cls
color a
call Scripts\rosto.cmd
call Scripts\Features\typewriter.cmd "- Eu decido quando termina."
%Wait2%
goto :EOF