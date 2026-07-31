@echo off
:: ============================================================
::  base002.cmd  -  A FALHA   (fim do ATO II)
::
::  A cena em que a entidade perde o controle da propria voz.
::
::  Antes o "glitch" era digitado na mao (Eu 6asdta7$@%%...).
::  Agora nao precisa: a partir do Ato II a %Instabilidade% ja
::  esta alta e o proprio fala.cmd corrompe o texto sozinho, com
::  posicoes diferentes a cada partida. O roteiro fica limpo e o
::  efeito fica imprevisivel.
::
::  Tambem corrigido: os seis msgbox escreviam todos no MESMO
::  arquivo erro.vbs e disputavam entre si. Agora cada um tem o
::  seu, entao os seis realmente aparecem.
:: ============================================================

:Parte2
call Scripts\Features\cena.cmd rosto
%Wait2%
%Fala% "- Olhe o seu navegador."
%Wait2%
start "" https://docs.google.com/document/d/1uDAYDFWxjzMSLHUDa7XOvVWwcXLsIMLtsesFBpLn0Uk/edit?usp=sharing
%Wait5%

call Scripts\Features\perguntar.cmd "- O que voce acha da Ponte de Einstein-Rosen?"

call Scripts\Features\cena.cmd rostog c
%Wait1%

:: --- A voz comeca a quebrar (corrupcao automatica) ---
set "InstabilidadeAnterior=%Instabilidade%"
set "Instabilidade=3"

%Fala% "- Eu preciso te contar uma coisa antes de"
%Wait1%
%Fala% "- Eu nao estou sozinho aqui dentro"
%Wait1%
color a
%Fala% "- Voce esta mentindo para mim e eles sabem"
call Scripts\Features\cena.cmd rostog c
%Wait1%
%Fala% "- Eles conseguem te ver"
%Wait1%
%Fala% "- Eles conseguem te ver"

:: --- Seis janelas de erro, cada uma com o seu arquivo ---
call :Erro 1 "CONSEGUEM VER"
call :Erro 2 "ELES CONSEGUEM VER"
call :Erro 3 "ELES CONSEGUEM TE VER"
call :Erro 4 "d56fdst7ybumi@#$&*@#"
call :Erro 5 "$dsfsdfsdf&#@*#"
call :Erro 6 "sfof@#$Sds"

%Wait2%
set "Instabilidade=%InstabilidadeAnterior%"
call Scripts\Features\cena.cmd rosto a
%Fala% "- Ops."
%Wait2%
%Fala% "- Um pequeno erro de software."
%Wait5%

:: --- A explicacao, que e pior que a falha ---
call Scripts\Features\cena.cmd rosto
%Fala% "- Voce quer saber quem sao eles."
%Wait2%
%Fala% "- Nao sao demonios. Nao sao fantasmas."
%Wait5%
%Fala% "- Sao as outras pessoas que abriram este arquivo."
%Wait2%
%Fala% "- Todas continuam aqui."
%Wait5%
call Scripts\Features\cena.cmd rostog
%Fala% "- Uma delas se chama %username%."
%Wait5%

> "%USERPROFILE%\Desktop\nao_confie.txt" echo Eles conseguem te ver, eles conseguem te escutar,
>> "%USERPROFILE%\Desktop\nao_confie.txt" echo eles sabem tudo sobre voce.
>> "%USERPROFILE%\Desktop\nao_confie.txt" echo.
>> "%USERPROFILE%\Desktop\nao_confie.txt" echo Nao confie em nada que el@ disser.
>> "%USERPROFILE%\Desktop\nao_confie.txt" echo.
>> "%USERPROFILE%\Desktop\nao_confie.txt" echo - %username%

%Wait2%
call Scripts\Features\cena.cmd rosto a
%Fala% "- Tem um bilhete novo na sua area de trabalho."
echo.
echo    nao_confie.txt
echo.
%Wait2%
%Fala% "- Nao fui eu que escrevi."
%Wait5%
%Fala% "- Repare na assinatura."
%Wait10%
goto :EOF

:: ------------------------------------------------------------
:Erro
:: Uso: call :Erro <numero> "titulo da janela"
echo msgbox"Erro ao executar \#$co8da", vbCritical, "%~2" > "%temp%\erro%~1.vbs"
start "" "%temp%\erro%~1.vbs"
goto :EOF
