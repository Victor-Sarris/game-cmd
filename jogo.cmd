<<<<<<< HEAD
@echo off
if /i "%~1"=="list" (
    echo Estagios disponiveis para debug: jogo.cmd ^<estagio^>
    echo   BootFake VigiaEnergiaStage Base001Stage VigiaProcessosStage
    echo   Condicao001Stage Enigma001Stage Base002Stage RuidoBrancoStage
    echo   Enigma002Stage VigiaClipboardStage VigiaArquivoStage VigiaSistemaStage
    exit /b
)
if not "%1" == "max" (
    start conhost "%~f0" max %1
    exit
)
:: ------------------------------------------

setlocal enabledelayedexpansion
title jogo
:: Tamanho da janela
mode 44,30
color a

set "Wait05=powershell -c Start-Sleep -m 500"
set "Wait1=timeout /t 1 /nobreak >nul"
set "Wait2=timeout /t 2 /nobreak >nul"
set "Wait5=timeout /t 5 /nobreak >nul"
set "Wait10=timeout /t 10 /nobreak >nul"
set "yesOrno=Sim sim s S N Nao nao Não não n"
set "CaminhoRaiz=%cd%"
set "CaminhoMusica=%CaminhoRaiz%\midea\music"

:: --- configurações de data-time ---

set "hora=%time:~0,2%"
set "hora=%hora: =0%"
set "hora=%hora::=%"

:: --- Limpeza de residuos de uma partida anterior ---
del /q "%USERPROFILE%\Desktop\oferenda.txt" 2>nul
del /q "%USERPROFILE%\Desktop\yasfgf6a78.txt" 2>nul
del /q "%USERPROFILE%\Desktop\nao_olhe.txt" 2>nul
del /q "%USERPROFILE%\Desktop\ponte.txt" 2>nul
del /q "%temp%\erro.vbs" 2>nul
del /q "%temp%\bridge.vbs" 2>nul

:: --- Modo debug: "jogo.cmd <Estagio>" pula direto para um estagio ---
:: (veja "jogo.cmd list" para ver os nomes de estagio disponiveis)
set "DebugTarget=%~2"
if not "%DebugTarget%"=="" goto %DebugTarget%

:: --- Aviso: o jogo interage de verdade com o Windows ---
cls
color a
echo ====================================================================
echo   AVISO: este jogo interage de verdade com o seu Windows.
echo   Durante a partida ele pode: ler/escrever na area de transferencia,
echo   criar e apagar arquivos na sua Area de Trabalho, abrir o navegador,
echo   fechar o Explorer.exe por alguns segundos e agendar (e cancelar)
echo   um desligamento do Windows, tudo como parte da historia.
echo.
echo   Nada disso causa dano permanente. Se preferir nao permitir,
echo   feche esta janela agora.
echo ====================================================================
echo.
pause
cls

:: --- INICIO DO JOGO ---
:: --- SCRIPTS DO GAME ---
:BootFake
call Scripts\Features\boot_fake.cmd
cls
:VigiaEnergiaStage
call Scripts\Features\VigiaEnergia.cmd
cls
:Base001Stage
call Scripts\base001.cmd
cls
:VigiaProcessosStage
call Scripts\Features\VigiaProcessos.cmd
cls
:Condicao001Stage
call Scripts\condicao001.cmd
cls
:Enigma001Stage
call Scripts\enigma001.cmd
cls
:Base002Stage
call Scripts\base002.cmd
cls
:RuidoBrancoStage
call Scripts\Features\ruido_branco.cmd
cls
:Enigma002Stage
call Scripts\enigma002.cmd
cls
:VigiaClipboardStage
call Scripts\Features\VigiaClipboard.cmd
cls
:VigiaArquivoStage
call Scripts\Features\VigiaArquivo.cmd
cls
:VigiaSistemaStage
call Scripts\Features\VigiaSistema.cmd
color 0c
cls
echo.
echo           CONEXAO PERDIDA.
echo.
pause
exit
=======
@echo off
if not "%1" == "max" (
    start conhost "%~f0" max
    exit
)

setlocal enabledelayedexpansion
title jogo
 :: Tamanho da janela
mode 44,30
color a

set "Wait05=powershell -c Start-Sleep -m 500"
set "Wait1=timeout /t 1 /nobreak >nul"
set "Wait2=timeout /t 2 /nobreak >nul"
set "Wait5=timeout /t 5 /nobreak >nul"
set "Wait10=timeout /t 10 /nobreak >nul"
set "yesOrno=Sim sim s S N Nao nao Não não n"
set "CaminhoRaiz=%cd%"
set "CaminhoMusica=%CaminhoRaiz%\midea\music"

:: --- configurações de data-time ---
set "hora=%time:~0,2%"
set "hora=%hora: =0%"
set "hora=%hora::=%"

call Scripts\Features\boot_fake.cmd
cls
call Scripts\Features\VigiaEnergia.cmd
cls
call Scripts\base001.cmd
cls
call Scripts\Features\VigiaProcessos.cmd
cls
call Scripts\condicao001.cmd
cls
call Scripts\enigma001.cmd
cls
call Scripts\base002.cmd
cls
call Scripts\Features\ruido_branco.cmd
cls
call Scripts\enigma002.cmd
cls
call Scripts\Features\VigiaClipboard.cmd
cls
call Scripts\Features\VigiaArquivo.cmd
cls
call Scripts\Features\VigiaSistema.cmd
color 0c
cls
echo.
echo           CONEXAO PERDIDA.
echo.
pause
exit
>>>>>>> origin/develop
