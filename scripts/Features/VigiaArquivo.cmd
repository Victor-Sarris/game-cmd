@echo off
:: ============================================================
::  VigiaArquivo.cmd  -  A OFERENDA
::
::  CORRECAO DE DESIGN: a versao antiga entrava em loop infinito
::  se o jogador simplesmente se recusasse a criar o arquivo.
::  Nao havia saida: o jogo nao podia ser terminado sem obedecer.
::  Agora, depois de 6 tentativas, a entidade desiste - e desistir
::  e mais assustador do que insistir, alem de contar como Ruido
::  para o final.
::
::  O arquivo pedido leva o nome do jogador de proposito: quando
::  a entidade o apaga, ela nao esta apagando um txt, esta
::  tomando o nome dele. E o gancho do Ato III.
::
::  Nome usado: oferenda_%username%.txt  - com prefixo justamente
::  para nunca colidir com um arquivo real do jogador.
:: ============================================================

set "Oferenda=%USERPROFILE%\Desktop\oferenda_%username%.txt"
set "Tentativas=0"

call Scripts\Features\cena.cmd rosto
echo.
%Fala% "- Agora eu quero uma prova."
%Wait2%
%Fala% "- Crie um arquivo de texto na sua area de trabalho."
%Wait2%
echo.
echo    oferenda_%username%.txt
echo.
%Wait2%
%Fala% "- Com o seu nome nele. Exatamente assim."
%Wait2%
%Fala% "- Eu vou esperar. Eu tenho tempo."

:ChecarArquivo
timeout /t 10 /nobreak >nul
if exist "%Oferenda%" goto ArquivoEncontrado

set /a "Tentativas+=1"
if %Tentativas% geq 6 goto Desistiu

if %Tentativas%==1 %Fala% "- Ainda nao encontrei nada."
if %Tentativas%==2 %Fala% "- Botao direito. Novo. Documento de texto."
if %Tentativas%==3 %Fala% "- Voce esta demorando de proposito."
if %Tentativas%==4 %Fala% "- Eu consigo ver a pasta. Continua vazia."
if %Tentativas%==5 %Fala% "- Ultima vez que eu peco com educacao."
goto ChecarArquivo

:ArquivoEncontrado
set /a "Docilidade+=2"
call Scripts\Features\cena.cmd rostog
echo.
%Fala% "- ACEITO."
%Wait2%
del /q "%Oferenda%" 2>nul
%Wait2%
call Scripts\Features\cena.cmd rosto a
%Fala% "- Pronto. Ja nao esta mais ai."
%Wait2%
%Fala% "- Repare no que voce acabou de fazer."
%Wait5%
%Fala% "- Uma voz sem rosto pediu o seu nome."
%Wait2%
%Fala% "- E voce escreveu, com a sua propria mao,"
%Fala% "  e colocou na mesa."
%Wait5%
%Fala% "- Ninguem te obrigou. Essa e a parte boa."
%Wait5%
goto :EOF

:Desistiu
set /a "Ruido+=3"
call Scripts\Features\cena.cmd rostog c
echo.
%Fala% "- Tudo bem."
%Wait5%
%Fala% "- Serio. Tudo bem."
%Wait2%
%Fala% "- Voce nao me deu o seu nome."
%Wait2%
call Scripts\Features\cena.cmd rosto a
%Fala% "- Eu ja tinha ele antes de te pedir."
%Wait2%
%Fala% "- Estava escrito na sua pasta de usuario o tempo todo."
%Wait5%
%Fala% "- Eu so queria ver se voce entregava."
%Wait5%
goto :EOF
