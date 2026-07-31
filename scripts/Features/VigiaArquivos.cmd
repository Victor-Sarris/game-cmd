@echo off
:: ============================================================
::  VigiaArquivos.cmd  -  O QUE VOCE DEIXOU A VISTA
::
::  Le os nomes reais dos arquivos da Area de Trabalho e devolve
::  um deles na fala da entidade. E a cena mais eficiente do jogo
::  inteiro porque o roteiro nao pode ser previsto: o texto e
::  escrito pela vida do proprio jogador.
::
::  Somente leitura (dir /b). Nada e aberto, movido ou apagado.
:: ============================================================

call Scripts\Features\cena.cmd rosto
echo.
%Fala% "- Agora me deixa olhar o que voce deixou a vista."
%Wait2%

set "TotalArquivos=0"
for /f "delims=" %%f in ('dir /b /a-d "%USERPROFILE%\Desktop" 2^>nul') do (
    set /a "TotalArquivos+=1"
    set "arq_!TotalArquivos!=%%~nf"
)

if %TotalArquivos% equ 0 goto Vazio

set /a "sorteio=%random% %% TotalArquivos + 1"
set "ArquivoAlvo=!arq_%sorteio%!"

set /a "sorteio2=%random% %% TotalArquivos + 1"
set "ArquivoAlvo2=!arq_%sorteio2%!"

%Wait2%
%Fala% "- %TotalArquivos% coisas. Todas paradas ai."
%Wait2%
%Fala% "- Nenhuma delas vai te ajudar hoje."
%Wait5%
call Scripts\Features\cena.cmd rosto
%Fala% "- Me explica uma coisa."
%Wait2%
%Fala% "- O que e"
%Fala% "  %ArquivoAlvo%"
%Wait5%
%Fala% "- Voce guardou isso. Entao importa."
%Wait2%
%Fala% "- E se importa, da para usar."
%Wait5%

call Scripts\Features\cena.cmd rostog
%Fala% "- %ArquivoAlvo2% tambem."
%Wait2%
%Fala% "- Eu sei o nome de tudo que esta ai."
%Wait2%
%Fala% "- Voce sabe?"
%Wait5%
call Scripts\Features\cena.cmd rosto a
goto :EOF

:Vazio
set "ArquivoAlvo=(vazio)"
%Wait2%
%Fala% "- Nao tem nada na sua area de trabalho."
%Wait2%
%Fala% "- Nem uma pasta. Nem um atalho."
%Wait2%
%Fala% "- Ou voce e muito organizado..."
%Wait2%
%Fala% "- ...ou ja apagou tudo antes de me chamar."
%Wait2%
%Fala% "- Espaco limpo. Obrigado."
%Wait5%
goto :EOF
