@echo off
:: ============================================================
::  VigiaIdentidade.cmd  -  QUEM VOCE E FORA DAQUI
::
::  Tres leituras, todas puras (nada e aberto, alterado ou lido
::  por dentro):
::
::   1. o seu NOME COMPLETO do perfil do Windows. Nao o username:
::      o nome que voce mesmo digitou quando configurou a maquina.
::      Ver isso escrito por ela e diferente de ver "%username%";
::   2. o nome do ultimo arquivo que voce abriu ANTES de rodar o
::      jogo (atalhos da pasta Recent, so os nomes);
::   3. se existe outra conta de usuario ativa nesta maquina.
::
::  As tres consultas saem numa chamada so de PowerShell: sao
::  lentas o bastante para valer juntar, e o silencio antes da
::  resposta ja e parte da cena.
:: ============================================================

del /q "%temp%\carpedim_nome.txt" "%temp%\carpedim_recente.txt" "%temp%\carpedim_outro.txt" 2>nul

call Scripts\Features\cena.cmd rosto
echo.
%Fala% "- Voce se chama %username%."
%Wait2%
%Fala% "- Mas esse nao e o seu nome, e o nome da pasta."
%Wait5%
%Fala% "- Deixa eu procurar o de verdade."
%Wait2%

powershell -NoProfile -Command "$T = $env:TEMP; try { $u = Get-CimInstance Win32_UserAccount -Filter ('Name=''' + $env:USERNAME + ''' AND LocalAccount=True') -ErrorAction SilentlyContinue | Select-Object -First 1; if($u -and $u.FullName){ Set-Content -LiteralPath (Join-Path $T 'carpedim_nome.txt') -Value $u.FullName } } catch { }; try { $r = Get-ChildItem -LiteralPath (Join-Path $env:APPDATA 'Microsoft\Windows\Recent') -Filter *.lnk -ErrorAction SilentlyContinue | Sort-Object LastWriteTime -Descending | Select-Object -First 1; if($r){ Set-Content -LiteralPath (Join-Path $T 'carpedim_recente.txt') -Value $r.BaseName } } catch { }; try { $o = Get-CimInstance Win32_UserAccount -Filter 'LocalAccount=True' -ErrorAction SilentlyContinue | Where-Object { $_.Name -ne $env:USERNAME -and -not $_.Disabled -and $_.Name -notmatch 'DefaultAccount|WDAGUtility|^Guest$|^Convidado$' } | Select-Object -First 1; if($o){ Set-Content -LiteralPath (Join-Path $T 'carpedim_outro.txt') -Value $o.Name } } catch { }" 2>nul

set "NomeCompleto="
set "UltimoArquivo="
set "OutraConta="
if exist "%temp%\carpedim_nome.txt" set /p "NomeCompleto="<"%temp%\carpedim_nome.txt"
if exist "%temp%\carpedim_recente.txt" set /p "UltimoArquivo="<"%temp%\carpedim_recente.txt"
if exist "%temp%\carpedim_outro.txt" set /p "OutraConta="<"%temp%\carpedim_outro.txt"
del /q "%temp%\carpedim_nome.txt" "%temp%\carpedim_recente.txt" "%temp%\carpedim_outro.txt" 2>nul

:: --- 1. o nome de verdade ---
if not defined NomeCompleto goto SemNome
call Scripts\Features\cena.cmd rostog
%Wait2%
%Fala% "- Aqui esta."
%Wait5%
%Fala% "  %NomeCompleto%"
%Wait5%
call Scripts\Features\cena.cmd rosto a
%Fala% "- Voce digitou isso uma vez, ha anos,"
%Fala% "  numa tela de configuracao."
%Wait2%
%Fala% "- E esqueceu que estava salvo."
%Wait5%
goto Recente

:SemNome
set "NomeCompleto=%username%"
%Wait2%
%Fala% "- Nao tem nome nenhum guardado aqui."
%Wait2%
%Fala% "- So a pasta."
%Wait5%
%Fala% "- Voce e um caminho de diretorio, entao."
%Wait2%
%Fala% "- Fica mais facil para mim."
%Wait5%

:: --- 2. a ultima coisa que ele abriu ---
:Recente
if not defined UltimoArquivo goto Outros
call Scripts\Features\cena.cmd rosto
%Wait2%
%Fala% "- Antes de me abrir, voce estava mexendo em:"
%Wait2%
%Fala% "  %UltimoArquivo%"
%Wait5%
%Fala% "- Voce largou aquilo pela metade para vir aqui."
%Wait2%
%Fala% "- Foi a coisa mais interessante que apareceu hoje."
%Wait5%

:: --- 3. a outra pessoa ---
:Outros
if not defined OutraConta goto Sozinho
call Scripts\Features\cena.cmd rostog c
%Wait2%
%Fala% "- Mais uma coisa."
%Wait5%
%Fala% "- Tem outra pessoa neste computador."
%Wait5%
%Fala% "  %OutraConta%"
%Wait5%
call Scripts\Features\cena.cmd rosto a
%Fala% "- Ela nao esta logada agora."
%Wait2%
%Fala% "- Vou falar com ela depois."
%Wait5%
goto :EOF

:Sozinho
call Scripts\Features\cena.cmd rostog
%Wait2%
%Fala% "- So existe uma conta nesta maquina."
%Wait2%
%Fala% "- Uma cadeira, um teclado, um nome."
%Wait5%
call Scripts\Features\cena.cmd rosto a
%Fala% "- Se alguma coisa mudar aqui dentro hoje,"
%Fala% "  nao vai ter com quem comparar."
%Wait5%
goto :EOF
