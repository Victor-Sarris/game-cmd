:Enigma1

%Wait2%
cls
call Scripts\rosto.cmd
%Wait2%
call Scripts\Features\typewriter.cmd "- Me fale depois o que descobriu..."

set /p "input=@"

:: Verifica se tem "motorista"
echo "%input%" | findstr /i "motorista" >nul
if %errorlevel% neq 0 goto ErroEnigma1

:: Verifica se tem "passageiro"
echo "%input%" | findstr /i "passageiro" >nul
if %errorlevel% neq 0 goto ErroEnigma1

:: Verifica se tem "fluxo" (opcional, para ser mais preciso)
echo "%input%" | findstr /i "fluxo" >nul
if %errorlevel% neq 0 goto ErroEnigma1

goto ResolveuEnigma1

:ErroEnigma1
cls
call Scripts\rosto.cmd
%Wait2%
call Scripts\Features\typewriter.cmd "- Nao... nao e isso."
%Wait2%
call Scripts\Features\typewriter.cmd "- O que estava escrito naquele arquivo? Traduza para mim."
%Wait2% 
call Scripts\Features\typewriter.cmd "- Cesar fez isso uma vez..."
%Wait5% 
goto Enigma1

:ResolveuEnigma1
cls
call Scripts\rosto.cmd
%Wait2%
call Scripts\Features\typewriter.cmd "- Voce parece mais inteligente do que realmente e..."
%Wait2%
echo - Certo
%Wait2% 
cls
call Scripts\rosto.cmd
call Scripts\Features\typewriter.cmd "- Voce vai servir..."