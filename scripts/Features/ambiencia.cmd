@echo off
:: ============================================================
::  ambiencia.cmd  -  O SOM QUE NAO E MUSICA
::  Uso: call Scripts\Features\ambiencia.cmd iniciar
::       call Scripts\Features\ambiencia.cmd parar
::
::  Um processo paralelo solta notas graves em intervalos
::  IRREGULARES (entre 9 e 26 segundos) durante a partida
::  inteira. Nao e trilha sonora: e o suficiente para o jogador
::  nunca relaxar e nunca conseguir prever.
::
::  Usa [Console]::Beep, entao nao precisa de arquivo de audio.
::  Frequencias entre 42 e 90 Hz - abaixo disso o Windows nem
::  aceita, acima ja soa como bipe de computador e perde a graca.
::
::  Morre sozinho se o arquivo-sentinela sumir (o jogo apaga ao
::  sair) ou depois de 45 minutos. Nunca fica orfao.
:: ============================================================

if /i "%~1"=="iniciar" goto Iniciar
if /i "%~1"=="parar" goto Parar
goto :EOF

:Iniciar
> "%temp%\carpedim_som.flag" echo 1
start "" /b powershell -NoProfile -WindowStyle Hidden -Command "$s = Join-Path $env:TEMP 'carpedim_som.flag'; $fim = (Get-Date).AddMinutes(45); while((Test-Path $s) -and ((Get-Date) -lt $fim)){ Start-Sleep -Seconds (Get-Random -Minimum 9 -Maximum 26); if(Test-Path $s){ try { [Console]::Beep((Get-Random -Minimum 42 -Maximum 90), (Get-Random -Minimum 130 -Maximum 420)) } catch { } } }" 2>nul
goto :EOF

:Parar
del /q "%temp%\carpedim_som.flag" 2>nul
goto :EOF
