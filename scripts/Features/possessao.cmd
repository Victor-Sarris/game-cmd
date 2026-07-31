@echo off
:: ============================================================
::  possessao.cmd  -  QUANDO A ENTIDADE PEGA O CONTROLE
::  Uso: call Scripts\Features\possessao.cmd <modo>
::
::  Modos:
::    janela   - a janela encolhe e o titulo vira o nome do jogador
::    cursor   - o mouse anda sozinho e depois volta ao lugar
::    restaura - devolve a janela ao tamanho e titulo normais
::
::  Tudo aqui e reversivel e escopado a partida:
::  - o cursor volta EXATAMENTE para onde estava;
::  - a janela volta ao tamanho original;
::  - nada e instalado, agendado ou deixado para tras.
:: ============================================================

if /i "%~1"=="janela"   goto Janela
if /i "%~1"=="cursor"   goto Cursor
if /i "%~1"=="restaura" goto Restaura
goto :EOF

:: ------------------------------------------------------------
:Janela
:: A janela se fecha em volta do jogador e passa a usar o nome dele.
title %username%
%Wait05%
mode 46,26
%Wait05%
mode 38,20
%Wait05%
mode 30,14
goto :EOF

:: ------------------------------------------------------------
:Restaura
mode %TamanhoJanela%
title jogo
goto :EOF

:: ------------------------------------------------------------
:Cursor
:: Guarda a posicao real do mouse, desenha um arco lento e devolve.
powershell -NoProfile -Command "Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $p = [System.Windows.Forms.Cursor]::Position; $x = $p.X; $y = $p.Y; for($i=1; $i -le 55; $i++){ $nx = [math]::Max(2, $x - ($i*4)); $ny = $y - [int](22 * [math]::Sin($i/7.0)); [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($nx, $ny); Start-Sleep -Milliseconds 22 }; Start-Sleep -Milliseconds 700; [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)" 2>nul
goto :EOF
