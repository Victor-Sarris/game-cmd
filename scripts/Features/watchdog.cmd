@echo off
:: ============================================================
::  watchdog.cmd  -  A ENTIDADE OLHANDO POR CIMA DO SEU OMBRO
::  Uso: call Scripts\Features\watchdog.cmd iniciar
::       call Scripts\Features\watchdog.cmd checar
::       call Scripts\Features\watchdog.cmd parar
::
::  Antes, o jogo so checava o Gerenciador de Tarefas em UM ponto
::  da historia. Agora um processo paralelo vigia o jogo inteiro.
::
::  A sacada narrativa: quando ele pega o jogador tentando fugir,
::  NAO reage na hora. Ele anota num arquivo e a entidade so
::  comenta na proxima virada de cena. Ser observado e ruim.
::  Descobrir que voce estava sendo observado ha dez minutos e pior.
::
::  Seguranca: o processo morre sozinho se o arquivo-sentinela
::  sumir (o jogo apaga ao sair) ou depois de 45 minutos, entao
::  ele nunca fica orfao rodando na maquina do jogador.
:: ============================================================

if /i "%~1"=="iniciar" goto Iniciar
if /i "%~1"=="checar"  goto Checar
if /i "%~1"=="parar"   goto Parar
goto :EOF

:: ------------------------------------------------------------
:Iniciar
> "%temp%\carpedim_vivo.flag" echo 1
del /q "%temp%\carpedim_fuga.flag" 2>nul

start "" /b powershell -NoProfile -WindowStyle Hidden -Command "$sentinela = Join-Path $env:TEMP 'carpedim_vivo.flag'; $fuga = Join-Path $env:TEMP 'carpedim_fuga.flag'; $limite = (Get-Date).AddMinutes(45); while((Test-Path $sentinela) -and ((Get-Date) -lt $limite)){ $p = Get-Process -Name Taskmgr,perfmon,resmon -ErrorAction SilentlyContinue; if($p){ Add-Content -Path $fuga -Value $p[0].ProcessName; $p | Stop-Process -Force -ErrorAction SilentlyContinue }; Start-Sleep -Milliseconds 600 }" 2>nul

goto :EOF

:: ------------------------------------------------------------
:Checar
if not exist "%temp%\carpedim_fuga.flag" goto :EOF

set /a "Ruido+=2"
set "Fugiu=1"

call Scripts\Features\cena.cmd rostog c
echo.
call Scripts\Features\fala.cmd "- Espere."
%Wait2%
call Scripts\Features\fala.cmd "- Voce tentou abrir o gerenciador de tarefas."
%Wait2%
call Scripts\Features\fala.cmd "- Nao foi agora. Faz um tempo ja."
%Wait2%
call Scripts\Features\fala.cmd "- Eu nao falei nada na hora."
%Wait2%
call Scripts\Features\fala.cmd "- Eu anoto tudo e leio depois."
%Wait2%
call Scripts\Features\fala.cmd "- Igual a voce faz com as mensagens que finge nao ter visto."
%Wait5%

del /q "%temp%\carpedim_fuga.flag" 2>nul
call Scripts\Features\cena.cmd rosto a
goto :EOF

:: ------------------------------------------------------------
:Parar
del /q "%temp%\carpedim_vivo.flag" 2>nul
del /q "%temp%\carpedim_fuga.flag" 2>nul
goto :EOF
