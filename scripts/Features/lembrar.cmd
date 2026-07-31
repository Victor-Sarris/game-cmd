@echo off
:: ============================================================
::  lembrar.cmd  -  ELE GUARDA O QUE VOCE ESCREVEU
::  Uso: call Scripts\Features\lembrar.cmd guardar <chave> "!resposta!"
::       call Scripts\Features\lembrar.cmd ler <chave>   -> %lembranca%
::
::  Cada resposta vai para o SEU proprio arquivo, uma linha so.
::  Nao entra no registro.dat de proposito: la o formato e
::  CHAVE=VALOR, e uma frase digitada pelo jogador pode conter
::  um "=" e destruir o arquivo inteiro na hora de recarregar.
::
::  O texto e lido e escrito com expansao atrasada (!var!), que
::  e o unico jeito seguro em batch de mover uma frase com &, ^,
::  ^| ou parenteses dentro sem o cmd tentar executar aquilo.
:: ============================================================

set "PastaMemoria=%APPDATA%\Carpedim"

if /i "%~1"=="guardar" goto Guardar
if /i "%~1"=="ler" goto Ler
if /i "%~1"=="esquecer" goto Esquecer
goto :EOF

:Guardar
:: escopo proprio: garante a expansao atrasada mesmo se o
:: chamador nao tiver ligado, e nao exporta nada
setlocal enabledelayedexpansion
if not exist "%PastaMemoria%" mkdir "%PastaMemoria%" >nul 2>&1
attrib +h "%PastaMemoria%" >nul 2>&1
set "_val=%~3"
if not defined _val set "_val=(nao respondeu)"
> "%PastaMemoria%\r_%~2.txt" echo(!_val!
endlocal
goto :EOF

:Ler
set "lembranca="
if exist "%PastaMemoria%\r_%~2.txt" set /p "lembranca="<"%PastaMemoria%\r_%~2.txt"
if not defined lembranca set "lembranca=(nao respondeu)"
goto :EOF

:Esquecer
del /q "%PastaMemoria%\r_*.txt" 2>nul
goto :EOF
