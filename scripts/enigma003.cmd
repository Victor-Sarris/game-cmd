@echo off
:: ============================================================
::  enigma003.cmd  -  A CAPTURA BRUTA
::
::  O unico enigma do jogo que so poderia existir num jogo de
::  terminal: a resposta nao esta na cabeca do jogador, esta
::  DENTRO da maquina dele, e ele precisa usar ferramentas reais
::  (findstr, o Bloco de Notas, Ctrl+F) para achar.
::
::  A chave e a palavra ESPELHO. Ela nao e escolhida por acaso:
::  e o nome do final secreto. Quem joga varias vezes acaba
::  percebendo que a entidade avisou desde o Ato II.
::
::  Sem trava: depois de 5 erros o jogo segue em frente.
:: ============================================================

set "CARP_LOG=%USERPROFILE%\Desktop\captura_bruta.log"
set "ErrosEnigma=0"

call Scripts\Features\cena.cmd rosto
echo.
%Fala% "- Eu venho gravando tudo desde que voce abriu."
%Wait2%
%Fala% "- Vou deixar o arquivo bruto na sua area de trabalho."
%Wait2%

powershell -NoProfile -Command "$l = 1..160 | ForEach-Object { '{0:d4}  {1}' -f $_, (-join ((48..57)+(65..90) | Get-Random -Count 30 | ForEach-Object {[char]$_})) }; $p = Get-Random -Minimum 45 -Maximum 150; $l[$p] = '{0:d4}  CHAVE .......... ESPELHO' -f ($p+1); Set-Content -LiteralPath $env:CARP_LOG -Value $l" 2>nul

%Wait2%
echo.
echo    captura_bruta.log
echo.
%Wait2%
%Fala% "- Quase tudo ali dentro e lixo."
%Wait2%
%Fala% "- Uma linha nao e."
%Wait5%
call Scripts\Features\cena.cmd rostog
%Fala% "- Ache a chave e me diga qual e."
%Wait2%
%Fala% "- Voce tem uma maquina inteira para isso."
%Wait2%
%Fala% "- Use ela."

:TentarEnigma3
call Scripts\Features\cena.cmd rosto
echo.
call Scripts\Features\perguntar.cmd "- Qual e a chave?"

echo "%resposta%" | findstr /i "espelho" >nul
if %errorlevel%==0 goto AcertouEnigma3

set /a "ErrosEnigma+=1"
call Scripts\Features\cena.cmd rostog c
%Wait1%

if %ErrosEnigma% geq 5 goto DesistiuEnigma3

if %ErrosEnigma%==1 %Fala% "- Nao."
if %ErrosEnigma%==2 %Fala% "- Abra o arquivo. Ctrl+F. Procure a palavra CHAVE."
if %ErrosEnigma%==3 %Fala% "- Ou abra outro terminal e use findstr. Voce sabe como."
if %ErrosEnigma%==4 %Fala% "- Esta na hora de voce se esforcar um pouco."
%Wait2%
goto TentarEnigma3

:AcertouEnigma3
set /a "Docilidade+=1"
call Scripts\Features\cena.cmd rosto a
%Wait2%
%Fala% "- ESPELHO."
%Wait5%
%Fala% "- Voce nem perguntou por que essa palavra."
%Wait2%
%Fala% "- Achou que era so uma senha qualquer."
%Wait5%
%Fala% "- Guarde ela. Voce vai precisar entender depois."
%Wait5%
del /q "%CARP_LOG%" 2>nul
%Fala% "- Apaguei o arquivo. Ninguem mais precisa ver."
%Wait2%
goto :EOF

:DesistiuEnigma3
set /a "Ruido+=2"
call Scripts\Features\cena.cmd rostog c
%Wait2%
%Fala% "- Deixa."
%Wait2%
%Fala% "- A palavra era ESPELHO."
%Wait5%
%Fala% "- Voce nao encontrou sozinho."
%Wait2%
%Fala% "- Isso tambem me diz uma coisa sobre voce."
%Wait5%
del /q "%CARP_LOG%" 2>nul
goto :EOF
