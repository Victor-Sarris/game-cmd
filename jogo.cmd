@echo off
:: ============================================================================
::   CARPEDIM  -  jogo de terror psicologico em cmd
::   Ponto de entrada. Controla os tres atos e roteia os finais.
::
::   Uso:
::     jogo.cmd              joga normalmente
::     jogo.cmd list         lista os estagios para pular (debug)
::     jogo.cmd <Estagio>    pula direto para um estagio (debug)
::     jogo.cmd esquecer     apaga a memoria entre partidas
::     jogo.cmd limpar       apaga memoria + arquivos deixados na Area de Trabalho
::     jogo.cmd aqui         roda na janela atual, sem abrir outra (para ver erros)
::
::   Conflito de merge resolvido nesta versao: mantido o lado HEAD.
:: ============================================================================

:: --- Argumentos que nao abrem o jogo ---
if /i "%~1"=="list" goto ListaEstagios
if /i "%~1"=="esquecer" goto Esquecer
if /i "%~1"=="limpar" goto Limpar

:: ----------------------------------------------------------------------------
::  Reabre em uma janela de console propria, do tamanho certo.
::
::  CORRECAO: a versao antiga fazia
::      start conhost "%~f0" max
::  e isso nao funciona. O conhost.exe monta a linha de comando e chama
::  CreateProcess, e CreateProcess NAO executa arquivo .cmd - so executavel
::  de verdade. Resultado: a janela nao aparece, ou pisca e some.
::
::  O certo e mandar o conhost rodar o cmd.exe (que e executavel) e deixar
::  o cmd.exe abrir o .cmd. Se o conhost nao existir na maquina, cai para
::  um "start cmd" normal.
::
::  Para depurar sem abrir janela nova:  jogo.cmd aqui
:: ----------------------------------------------------------------------------
if /i "%~1"=="aqui" goto Preparar

if not "%1" == "max" (
    if exist "%SystemRoot%\System32\conhost.exe" (
        start "" "%SystemRoot%\System32\conhost.exe" cmd.exe /c "%~f0" max %1
    ) else (
        start "jogo" cmd.exe /c "%~f0" max %1
    )
    exit /b
)

:Preparar

:: ============================================================================
setlocal enabledelayedexpansion
cd /d "%~dp0"
title jogo

:: ----------------------------------------------------------------------------
::  Tamanho da janela.
::
::  Os dois rostos em ASCII tem ~51 colunas, entao com o antigo "mode 44,30"
::  cada linha do desenho quebrava ao meio. 56 colunas resolvem a largura.
::
::  A altura ideal e 50 (cabe o rosto.cmd inteiro mais o dialogo), MAS pedir
::  uma janela maior do que a tela faz o mode falhar e o console abrir
::  torto ou fora do enquadramento. Entao o valor e limitado ao maximo que
::  a tela do jogador realmente comporta.
:: ----------------------------------------------------------------------------
set "Colunas=56"
set "Linhas=50"

:: (sem parenteses e sem aspas duplas aninhadas de proposito: os dois
::  atrapalham dentro de um for /f)
for /f "tokens=1,2" %%a in ('powershell -NoProfile -Command "$m=$Host.UI.RawUI.MaxWindowSize; '{0} {1}' -f $m.Width,$m.Height" 2^>nul') do (
    set "MaxCol=%%a"
    set "MaxLin=%%b"
)
if defined MaxCol if !MaxCol! lss !Colunas! set "Colunas=!MaxCol!"
if defined MaxLin if !MaxLin! lss !Linhas! set "Linhas=!MaxLin!"

set "TamanhoJanela=!Colunas!,!Linhas!"
mode !TamanhoJanela! >nul 2>&1
color a

:: --- Atalhos de tempo ---
set "Wait05=powershell -NoProfile -c Start-Sleep -m 500"
set "Wait1=timeout /t 1 /nobreak >nul"
set "Wait2=timeout /t 2 /nobreak >nul"
set "Wait5=timeout /t 5 /nobreak >nul"
set "Wait10=timeout /t 10 /nobreak >nul"

:: --- Atalho da voz da entidade (corrupcao + datilografia) ---
set "Fala=call Scripts\Features\fala.cmd"

set "CaminhoRaiz=%cd%"
set "CaminhoMusica=%CaminhoRaiz%\midea\music"

:: --- Data e hora ---
set "hora=%time:~0,2%"
set "hora=%hora: =0%"

:: --- Contadores da partida ---
set "Docilidade=0"
set "Ruido=0"
set "Hesitacao=0"
set "Instabilidade=0"
set "Fugiu=0"
set "Final=INCOMPLETO"

:: --- Limpeza de residuos da partida anterior ---
call :LimparResiduos

:: --- Memoria entre partidas (define %Partidas%, %FinalAnterior%, etc.) ---
call Scripts\Features\memoria.cmd carregar

:: --- Modo debug: pula direto para um estagio ---
set "DebugTarget=%~2"
if not "%DebugTarget%"=="" goto %DebugTarget%

:: ============================================================================
::   AVISO
:: ============================================================================
cls
color a
echo ======================================================
echo   AVISO
echo.
echo   Este jogo mexe de verdade no seu Windows. Durante a
echo   partida ele pode:
echo.
echo    - ler o nome da sua rede, seus processos abertos,
echo      a sua bateria e os NOMES dos arquivos da sua
echo      Area de Trabalho (so os nomes, nada e aberto);
echo    - detectar que existe uma camera e um microfone
echo      ligados - sem acessar nenhum dos dois;
echo    - escrever na sua area de transferencia;
echo    - criar e apagar arquivos na Area de Trabalho;
echo    - abrir o navegador e o Bloco de Notas;
echo    - fechar o explorer.exe por 4 segundos;
echo    - encerrar o Gerenciador de Tarefas se voce abrir;
echo    - mover o cursor do mouse e mudar o tamanho e o
echo      titulo desta janela;
echo    - agendar um desligamento do Windows e cancelar
echo      logo em seguida.
echo.
echo   Nada e permanente e nada e instalado. O jogo guarda
echo   um arquivo de progresso em %%APPDATA%%\Carpedim que
echo   sobrevive entre partidas, de proposito.
echo   Para apagar tudo:   jogo.cmd limpar
echo.
echo   Se preferir nao permitir, feche esta janela agora.
echo ======================================================
echo.
pause
cls

:: --- Processos paralelos: acompanham a partida inteira ---
call Scripts\Features\watchdog.cmd iniciar
call Scripts\Features\ambiencia.cmd iniciar

:: ============================================================================
::   ATO I  -  INVENTARIO
::   Ela nao esta te assustando. Esta te catalogando.
:: ============================================================================
call Scripts\Features\memoria.cmd marcar 1
:BootFake
call Scripts\Features\boot_fake.cmd
call Scripts\Features\ato.cmd I "INVENTARIO" 0
:Base001Stage
call Scripts\base001.cmd
:VigiaTempoStage
call Scripts\Features\VigiaTempo.cmd
:VigiaEnergiaStage
call Scripts\Features\VigiaEnergia.cmd
:VigiaRedeStage
call Scripts\Features\VigiaRede.cmd
:VigiaIdentidadeStage
call Scripts\Features\VigiaIdentidade.cmd
:VigiaProcessosStage
call Scripts\Features\VigiaProcessos.cmd
call Scripts\Features\watchdog.cmd checar
:Condicao001Stage
call Scripts\condicao001.cmd
:Enigma001Stage
call Scripts\enigma001.cmd

:: ============================================================================
::   ATO II  -  INTIMIDADE
::   Ela para de perguntar sobre voce e comeca a te mostrar voce.
:: ============================================================================
call Scripts\Features\memoria.cmd marcar 2
call Scripts\Features\ato.cmd II "INTIMIDADE" 1
:VigiaArquivosStage
call Scripts\Features\VigiaArquivos.cmd
:FalsoApagamentoStage
call Scripts\Features\falso_apagamento.cmd
:VigiaClipboardStage
call Scripts\Features\VigiaClipboard.cmd
:VigiaArquivoStage
call Scripts\Features\VigiaArquivo.cmd
:VigiaCameraStage
call Scripts\Features\VigiaCamera.cmd
:Enigma003Stage
call Scripts\enigma003.cmd
call Scripts\Features\watchdog.cmd checar
:RuidoBrancoStage
call Scripts\Features\ruido_branco.cmd
:Base002Stage
call Scripts\base002.cmd

:: ============================================================================
::   ATO III  -  SUBSTITUICAO
::   Ela ja tem o suficiente. Agora e so tirar voce do lugar.
:: ============================================================================
call Scripts\Features\memoria.cmd marcar 3
call Scripts\Features\ato.cmd III "SUBSTITUICAO" 2
:Enigma002Stage
call Scripts\enigma002.cmd
:FalsoCrashStage
call Scripts\Features\falso_crash.cmd
:Possessao001Stage
call Scripts\possessao001.cmd
:VigiaSistemaStage
call Scripts\Features\VigiaSistema.cmd
call Scripts\Features\watchdog.cmd checar

:: ============================================================================
::   FINAIS
::     ESPELHO      - secreto, a partir da terceira partida
::     RUIDO        - resistiu mais do que obedeceu
::     SUBSTITUICAO - obedeceu mais do que resistiu
:: ============================================================================
:Finais
call Scripts\Features\possessao.cmd restaura
if %Partidas% geq 2 goto FinalEspelho
if %Ruido% gtr %Docilidade% goto FinalRuido
goto FinalSubstituicao

:FinalEspelho
call Scripts\Finais\espelho.cmd
goto Encerrar

:FinalRuido
call Scripts\Finais\ruido.cmd
goto Encerrar

:FinalSubstituicao
call Scripts\Finais\substituicao.cmd
goto Encerrar

:: ============================================================================
:Encerrar
call Scripts\Features\memoria.cmd salvar
call Scripts\Features\watchdog.cmd parar
call Scripts\Features\ambiencia.cmd parar
call Scripts\Features\papel_parede.cmd restaurar
call Scripts\Features\possessao.cmd restaura
shutdown -a >nul 2>&1
echo.
pause
exit

:: ============================================================================
::   SUB-ROTINAS E MODOS AUXILIARES
:: ============================================================================

:LimparResiduos
:: Tudo o que uma partida anterior pode ter deixado para tras.
:: A memoria em %APPDATA%\Carpedim NAO entra aqui, de proposito.
del /q "%USERPROFILE%\Desktop\oferenda.txt" 2>nul
del /q "%USERPROFILE%\Desktop\oferenda_%username%.txt" 2>nul
del /q "%USERPROFILE%\Desktop\yasfgf6a78.txt" 2>nul
del /q "%USERPROFILE%\Desktop\nao_olhe.txt" 2>nul
del /q "%USERPROFILE%\Desktop\nao_confie.txt" 2>nul
del /q "%USERPROFILE%\Desktop\ponte.txt" 2>nul
del /q "%USERPROFILE%\Desktop\captura_bruta.log" 2>nul
del /q "%temp%\erro.vbs" 2>nul
del /q "%temp%\erro1.vbs" "%temp%\erro2.vbs" "%temp%\erro3.vbs" 2>nul
del /q "%temp%\erro4.vbs" "%temp%\erro5.vbs" "%temp%\erro6.vbs" 2>nul
del /q "%temp%\bridge.vbs" 2>nul
del /q "%temp%\carpedim_ficha.txt" 2>nul
del /q "%temp%\carpedim_cam.txt" 2>nul
del /q "%temp%\carpedim_mic.txt" 2>nul
del /q "%temp%\carpedim_vivo.flag" 2>nul
del /q "%temp%\carpedim_fuga.flag" 2>nul
del /q "%temp%\carpedim_som.flag" 2>nul
del /q "%temp%\carpedim_eco.txt" 2>nul
del /q "%temp%\carpedim_dia.txt" 2>nul
del /q "%temp%\carpedim_nome.txt" 2>nul
del /q "%temp%\carpedim_recente.txt" 2>nul
del /q "%temp%\carpedim_outro.txt" 2>nul
del /q "%temp%\carpedim_wp.bmp" 2>nul
del /q "%temp%\carpedim_wp_restore.cmd" 2>nul
del /q "clip" 2>nul
shutdown -a >nul 2>&1
goto :EOF

:ListaEstagios
echo.
echo  Estagios para debug:  jogo.cmd ^<Estagio^>
echo.
echo  ATO I
echo    BootFake              Base001Stage
echo    VigiaTempoStage       VigiaEnergiaStage
echo    VigiaRedeStage        VigiaIdentidadeStage
echo    VigiaProcessosStage   Condicao001Stage
echo    Enigma001Stage
echo.
echo  ATO II
echo    VigiaArquivosStage    FalsoApagamentoStage
echo    VigiaClipboardStage   VigiaArquivoStage
echo    VigiaCameraStage      Enigma003Stage
echo    RuidoBrancoStage      Base002Stage
echo.
echo  ATO III
echo    Enigma002Stage        FalsoCrashStage
echo    Possessao001Stage     VigiaSistemaStage
echo.
echo  FINAIS
echo    Finais                FinalEspelho
echo    FinalRuido            FinalSubstituicao
echo.
exit /b

:Esquecer
cd /d "%~dp0"
call Scripts\Features\memoria.cmd apagar
echo.
echo  Memoria apagada. Ele nao lembra mais de voce.
echo.
exit /b

:Limpar
cd /d "%~dp0"
:: o papel de parede primeiro: o caminho original esta guardado
:: dentro da pasta de memoria, que o "apagar" remove logo depois
call Scripts\Features\papel_parede.cmd restaurar
call Scripts\Features\memoria.cmd apagar
call Scripts\Features\ambiencia.cmd parar
call Scripts\Features\watchdog.cmd parar
call :LimparResiduos
echo.
echo  Memoria apagada, papel de parede restaurado e arquivos
echo  removidos da Area de Trabalho.
echo.
exit /b
