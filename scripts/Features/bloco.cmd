@echo off
:: ============================================================
::  bloco.cmd  -  A FICHA
::
::  O momento em que tudo o que a entidade coletou durante a
::  partida (rede, arquivos, camera, tempo ligado, hesitacao)
::  volta de uma vez so, montado, dentro do Bloco de Notas do
::  proprio jogador.
::
::  E o pagamento de todos os "Vigia": nao era terror aleatorio,
::  era um formulario sendo preenchido.
::
::  Seguranca: abre o Bloco de Notas capturando o PID e fecha
::  SO aquela janela. Nunca usa taskkill /im notepad.exe, que
::  mataria outros blocos de notas abertos do jogador com
::  trabalho nao salvo dentro.
:: ============================================================

set "Ficha=%temp%\carpedim_ficha.txt"

if not defined SSID set "SSID=(rede nao identificada)"
if not defined ArquivoAlvo set "ArquivoAlvo=(nada relevante)"
if not defined TotalArquivos set "TotalArquivos=0"
if not defined Camera set "Camera=(nao localizada)"
if not defined HorasLigado set "HorasLigado=?"
if not defined Hesitacao set "Hesitacao=0"
if not defined Docilidade set "Docilidade=0"
if not defined Ruido set "Ruido=0"

> "%Ficha%" (
    echo ============================================
    echo   FICHA DO SUJEITO - RASCUNHO
    echo   preenchida durante esta sessao
    echo ============================================
    echo.
    echo   NOME ..................: %username%
    echo   MAQUINA ...............: %COMPUTERNAME%
    echo   REDE ..................: %SSID%
    echo   LIGADO HA .............: %HorasLigado% horas
    echo   OLHO ..................: %Camera%
    echo.
    echo   ITENS NA AREA DE TRABALHO ..: %TotalArquivos%
    echo   ITEM DE REFERENCIA .........: %ArquivoAlvo%
    echo.
    echo   VEZES QUE OBEDECEU .........: %Docilidade%
    echo   VEZES QUE RESISTIU .........: %Ruido%
    echo   VEZES QUE TRAVOU ANTES DE RESPONDER: %Hesitacao%
    echo.
    echo --------------------------------------------
    echo   OBSERVACOES
    echo --------------------------------------------
    echo.
    echo   O sujeito responde mais rapido quando tem medo.
    echo   O sujeito le tudo ate o fim mesmo quando pede para parar.
    echo   O sujeito nao fechou a janela em nenhum momento.
    echo   O sujeito acha que isso e um jogo.
    echo.
    echo   Falta pouco. Quase tudo dele ja esta aqui dentro.
    echo   O que nao couber, eu invento. Ninguem vai conferir.
    echo.
    echo ============================================
)

set "PidFicha="
for /f "delims=" %%p in ('powershell -NoProfile -Command "(Start-Process notepad -ArgumentList '\"%Ficha%\"' -PassThru).Id" 2^>nul') do set "PidFicha=%%p"

%Wait10%
%Wait5%

if defined PidFicha taskkill /f /pid %PidFicha% >nul 2>&1
del /q "%Ficha%" 2>nul
goto :EOF
