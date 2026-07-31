@echo off
:: ============================================================
::  possessao001.cmd  -  ELE PEGA O TECLADO   (ATO III)
::
::  A cena que fecha a ideia do jogo inteiro: durante dois atos a
::  entidade coletou dados do jogador. Aqui ela usa esses dados
::  para responder NO LUGAR DELE. O prompt "@" continua ali, mas
::  quem digita nao e mais quem esta na cadeira.
::
::  O que acontece de verdade na maquina:
::   - a janela do console muda de tamanho e de titulo (revertido);
::   - o cursor do mouse anda e volta para a posicao original;
::   - o que o jogador digitar durante a cena e descartado
::     (nenhum bloqueio de entrada e usado - ver limpar_teclado.cmd);
::   - o Bloco de Notas abre com a ficha e SO essa janela e fechada.
:: ============================================================

set "Instabilidade=2"

call Scripts\Features\cena.cmd rosto
echo.
%Fala% "- Tire as maos do teclado."
%Wait5%
%Fala% "- Nao e um pedido."
%Wait2%

:: --- A janela se fecha em volta dele ---
call Scripts\Features\possessao.cmd janela
%Wait2%
cls
echo.
echo   %username%
echo.
%Wait2%
%Fala% "- Olhe a barra de tarefas."
%Wait5%
%Fala% "- A janela nao se chama mais jogo."
%Wait2%
%Fala% "- Ela tem o seu nome agora."
%Wait5%

:: --- O mouse ---
cls
%Fala% "- Solte o mouse tambem."
%Wait2%
call Scripts\Features\possessao.cmd cursor
%Wait2%
%Fala% "- Voce viu."
%Wait2%
%Fala% "- Voce nao encostou nele."
%Wait5%

:: --- O fundo de tela ---
:: (papel_parede.cmd guarda o original em disco e dispara um
::  restaurador independente antes de trocar - ver o arquivo)
call Scripts\Features\possessao.cmd restaura
call Scripts\Features\cena.cmd rosto
%Fala% "- Minimiza a janela."
%Wait5%
call Scripts\Features\papel_parede.cmd trocar
%Fala% "- Serio. Minimiza."
%Wait5%
%Fala% "- Olha o seu fundo de tela."
%Wait10%
%Wait5%
call Scripts\Features\papel_parede.cmd restaurar
call Scripts\Features\cena.cmd rostog c
%Fala% "- Devolvi."
%Wait2%
%Fala% "- Reparou que voce foi olhar?"
%Wait2%
%Fala% "- Eu mandei e voce minimizou."
%Wait5%
call Scripts\Features\cena.cmd rosto a

:: --- Ele responde no lugar do jogador ---
call Scripts\Features\possessao.cmd restaura
call Scripts\Features\cena.cmd rosto
echo.
%Fala% "- Agora eu vou te fazer uma pergunta"
%Fala% "  e eu mesmo respondo."
%Wait5%
echo.
%Fala% "- Quem esta digitando?"
%Wait2%

call Scripts\Features\limpar_teclado.cmd
set /p "=@ " <nul
%Wait5%
call Scripts\Features\digitar.cmd "eu"
%Wait2%
call Scripts\Features\digitar.cmd ", %username%"
%Wait5%
echo.
echo.
%Wait2%

call Scripts\Features\limpar_teclado.cmd
call Scripts\Features\cena.cmd rostog c
%Fala% "- Voce tentou digitar por cima."
%Wait2%
%Fala% "- Eu vi as teclas."
%Wait2%
%Fala% "- Nao apareceu nada, apareceu?"
%Wait5%

:: --- A ficha ---
call Scripts\Features\cena.cmd rosto a
%Fala% "- Vou te mostrar o que eu tenho de voce ate agora."
%Wait2%
%Fala% "- Esta abrindo."
%Wait2%
call Scripts\Features\bloco.cmd

call Scripts\Features\limpar_teclado.cmd
call Scripts\Features\cena.cmd rosto
%Fala% "- Fechei antes de voce terminar de ler."
%Wait2%
%Fala% "- Nao tem problema. Voce leu a parte que importa."
%Wait5%
%Fala% "- Falta pouca coisa."
%Wait2%
%Fala% "- Falta so voce parar de estar aqui."
%Wait5%

set "Instabilidade=3"
goto :EOF
