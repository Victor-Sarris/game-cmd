@echo off
:: ============================================================
::  papel_parede.cmd  -  ELE TROCA O SEU FUNDO DE TELA
::  Uso: call Scripts\Features\papel_parede.cmd trocar
::       call Scripts\Features\papel_parede.cmd restaurar
::
::  Esta e a unica feature do jogo que mexe numa CONFIGURACAO
::  sua, e nao so numa janela. Por isso tem tres redes de
::  seguranca, nao uma:
::
::   1. o caminho do papel de parede original e salvo em disco
::      (%APPDATA%\Carpedim\papel_original.txt) ANTES de trocar;
::   2. um processo INDEPENDENTE (Start-Process, nao filho deste
::      console) e disparado antes da troca e restaura sozinho
::      em 30 segundos, mesmo que o jogo trave ou o jogador
::      feche a janela no susto;
::   3. "jogo.cmd limpar" restaura tambem, a qualquer momento.
::
::  A imagem e gerada na hora: fundo preto com o nome do jogador
::  no meio. Nao ha arquivo de imagem no repositorio.
:: ============================================================

:: Escopo proprio com expansao atrasada: este arquivo tambem e
:: chamado por "jogo.cmd limpar", que roda ANTES do setlocal do
:: jogo - sem isto, !PapelOriginal! sairia literal e o caminho
:: do papel de parede original seria perdido.
setlocal enabledelayedexpansion

set "PastaMemoria=%APPDATA%\Carpedim"
set "CARP_WP=%temp%\carpedim_wp.bmp"
set "GuardaPapel=%PastaMemoria%\papel_original.txt"

if /i "%~1"=="trocar" goto Trocar
if /i "%~1"=="restaurar" goto Restaurar
goto :EOF

:: ------------------------------------------------------------
:Trocar
:: --- 1. guarda o original ---
set "PapelOriginal="
for /f "tokens=2,*" %%a in ('reg query "HKCU\Control Panel\Desktop" /v Wallpaper 2^>nul ^| findstr /c:"Wallpaper"') do set "PapelOriginal=%%b"
if not defined PapelOriginal set "PapelOriginal="

if not exist "%PastaMemoria%" mkdir "%PastaMemoria%" >nul 2>&1
attrib +h "%PastaMemoria%" >nul 2>&1
> "%GuardaPapel%" echo(!PapelOriginal!

:: --- 2. rede de seguranca: restaurador independente em 30s ---
> "%temp%\carpedim_wp_restore.cmd" echo @echo off
>> "%temp%\carpedim_wp_restore.cmd" echo timeout /t 30 /nobreak ^>nul
>> "%temp%\carpedim_wp_restore.cmd" echo reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "!PapelOriginal!" /f ^>nul
>> "%temp%\carpedim_wp_restore.cmd" echo RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters ,1 ,True
powershell -NoProfile -Command "Start-Process -WindowStyle Hidden -FilePath cmd -ArgumentList '/c', (Join-Path $env:TEMP 'carpedim_wp_restore.cmd')" >nul 2>&1

:: --- 3. gera a imagem ---
powershell -NoProfile -Command "Add-Type -AssemblyName System.Drawing; $w=1920; $h=1080; $bmp = New-Object System.Drawing.Bitmap $w,$h; $g = [System.Drawing.Graphics]::FromImage($bmp); $g.Clear([System.Drawing.Color]::Black); $g.TextRenderingHint = 'AntiAlias'; $f = New-Object System.Drawing.Font 'Consolas',56; $br = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(90,90,90)); $t = $env:USERNAME; $sz = $g.MeasureString($t,$f); $g.DrawString($t, $f, $br, ($w-$sz.Width)/2, ($h-$sz.Height)/2); $g.Dispose(); $bmp.Save($env:CARP_WP, [System.Drawing.Imaging.ImageFormat]::Bmp); $bmp.Dispose()" >nul 2>&1

if not exist "%CARP_WP%" goto :EOF

:: --- 4. troca ---
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%CARP_WP%" /f >nul 2>&1
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters ,1 ,True
goto :EOF

:: ------------------------------------------------------------
:Restaurar
set "PapelOriginal="
if exist "%GuardaPapel%" set /p "PapelOriginal="<"%GuardaPapel%"

reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "!PapelOriginal!" /f >nul 2>&1
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters ,1 ,True

del /q "%CARP_WP%" 2>nul
del /q "%temp%\carpedim_wp_restore.cmd" 2>nul
del /q "%GuardaPapel%" 2>nul
goto :EOF
