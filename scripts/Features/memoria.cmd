@echo off
:: ============================================================
::  memoria.cmd  -  O REGISTRO QUE A ENTIDADE MANTEM SOBRE VOCE
::  Uso: call Scripts\Features\memoria.cmd carregar
::       call Scripts\Features\memoria.cmd marcar <numero do ato>
::       call Scripts\Features\memoria.cmd salvar
::       call Scripts\Features\memoria.cmd apagar
::
::  O arquivo NAO e apagado quando o jogo termina. E de proposito:
::  e o unico rastro que sobrevive a partida, e e o que permite a
::  entidade reconhecer o jogador quando ele volta.
::
::  Tres coisas sao guardadas aqui:
::   - o placar (partidas, docilidade, ruido, qual final);
::   - QUANTOS DIAS fazem desde a ultima vez que ele abriu;
::   - EM QUE ATO ele fechou o jogo no meio, se fechou.
::
::  O truque do abandono: "marcar" escreve o ato atual num
::  arquivo de progresso, e "salvar" (que so roda quando o jogo
::  chega ao fim) apaga esse arquivo. Se na proxima partida o
::  arquivo ainda estiver la, e porque ele desistiu no meio - e
::  o jogo sabe exatamente onde.
::
::  As frases digitadas pelo jogador ficam em arquivos separados,
::  cuidados pelo lembrar.cmd. Ver o porque la.
::
::  Fica em %APPDATA%\Carpedim (pasta oculta).
::  Para zerar tudo: jogo.cmd limpar
:: ============================================================
set "PastaMemoria=%APPDATA%\Carpedim"
set "Registro=%PastaMemoria%\registro.dat"
set "Progresso=%PastaMemoria%\progresso.dat"

if /i "%~1"=="carregar" goto Carregar
if /i "%~1"=="marcar"   goto Marcar
if /i "%~1"=="salvar"   goto Salvar
if /i "%~1"=="apagar"   goto Apagar
goto :EOF

:: ------------------------------------------------------------
:Carregar
:: Valores padrao de quem nunca jogou
set "Partidas=0"
set "NomeAnterior="
set "FinalAnterior="
set "DocilidadeTotal=0"
set "RuidoTotal=0"
set "FugiuAntes=0"
set "UltimoDia=0"
set "AbandonouAto=0"
set "DiasSumido=0"

:: --- em que ato ele fechou no meio da ultima vez ---
if exist "%Progresso%" set /p "AbandonouAto="<"%Progresso%"
del /q "%Progresso%" 2>nul

if not exist "%Registro%" goto :EOF

:: Cada linha do arquivo esta no formato CHAVE=VALOR, entao
:: basta entregar a linha inteira para o set.
for /f "usebackq delims=" %%l in ("%Registro%") do set "%%l"

:: --- quantos dias desde a ultima partida ---
call :DiaDeHoje
if "%UltimoDia%"=="0" goto :EOF
set /a "DiasSumido=DiaHoje-UltimoDia"
if %DiasSumido% lss 0 set "DiasSumido=0"
goto :EOF

:: ------------------------------------------------------------
:Marcar
:: Chamado no inicio de cada ato.
if not exist "%PastaMemoria%" mkdir "%PastaMemoria%" >nul 2>&1
attrib +h "%PastaMemoria%" >nul 2>&1
> "%Progresso%" echo %~2
goto :EOF

:: ------------------------------------------------------------
:Salvar
if not exist "%PastaMemoria%" mkdir "%PastaMemoria%" >nul 2>&1
attrib +h "%PastaMemoria%" >nul 2>&1

set /a "Partidas+=1"
set /a "DocilidadeTotal+=Docilidade"
set /a "RuidoTotal+=Ruido"
call :DiaDeHoje

> "%Registro%" (
    echo Partidas=%Partidas%
    echo NomeAnterior=%username%
    echo FinalAnterior=%Final%
    echo DocilidadeTotal=%DocilidadeTotal%
    echo RuidoTotal=%RuidoTotal%
    echo FugiuAntes=%Fugiu%
    echo UltimoDia=%DiaHoje%
)

:: chegou ao fim, entao nao houve abandono
del /q "%Progresso%" 2>nul
goto :EOF

:: ------------------------------------------------------------
:Apagar
del /q /f "%Registro%" 2>nul
del /q /f "%Progresso%" 2>nul
call Scripts\Features\lembrar.cmd esquecer
attrib -h "%PastaMemoria%" >nul 2>&1
rmdir "%PastaMemoria%" 2>nul
goto :EOF

:: ------------------------------------------------------------
:DiaDeHoje
:: Numero do dia (contado a partir de 2000) para dar para
:: subtrair duas datas sem precisar de aritmetica de calendario.
set "DiaHoje=0"
del /q "%temp%\carpedim_dia.txt" 2>nul
powershell -NoProfile -Command "$d = [int]((Get-Date) - [datetime]'2000-01-01').TotalDays; Set-Content -LiteralPath (Join-Path $env:TEMP 'carpedim_dia.txt') -Value $d" 2>nul
if exist "%temp%\carpedim_dia.txt" set /p "DiaHoje="<"%temp%\carpedim_dia.txt"
del /q "%temp%\carpedim_dia.txt" 2>nul
if not defined DiaHoje set "DiaHoje=0"
goto :EOF
