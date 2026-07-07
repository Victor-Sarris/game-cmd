:Enigma1

%Wait2%
call Scripts\Features\cena.cmd rosto
%Wait2%
call Scripts\Features\typewriter.cmd "- Me fale depois o que descobriu..."
echo  (Decifre o arquivo e digite aqui)

set "input="
set /p "input=@ "

:: Verifica se tem "motorista"
echo "%input%" | findstr /i "motorista" >nul
if %errorlevel% neq 0 goto ErroEnigma1

:: Verifica se tem "passageiro"
echo "%input%" | findstr /i "passageiro" >nul
if %errorlevel% neq 0 goto ErroEnigma1

:: Verifica se tem "fluxo"
echo "%input%" | findstr /i "fluxo" >nul
if %errorlevel% neq 0 goto ErroEnigma1

goto ResolveuEnigma1

:ErroEnigma1
call Scripts\Features\cena.cmd rosto
%Wait2%
call Scripts\Features\typewriter.cmd "- Nao... nao e isso."
%Wait2%
call Scripts\Features\typewriter.cmd "- O que estava escrito naquele arquivo? Traduza para mim."
%Wait2% 
call Scripts\Features\typewriter.cmd "- Cesar fez isso uma vez..."
%Wait5% 
goto Enigma1

:ResolveuEnigma1
call Scripts\Features\cena.cmd rosto
%Wait2%
call Scripts\Features\typewriter.cmd "- Voce parece mais inteligente do que realmente e..."
%Wait2%
echo - Certo
%Wait2%
call Scripts\Features\cena.cmd rosto
call Scripts\Features\typewriter.cmd "- Voce vai servir..."