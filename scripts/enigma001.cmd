:Enigma1

%Wait2%
cls
call Scripts\rosto.cmd
%Wait2%
echo - Me fale depois o que descobriu...

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
echo - Nao... nao e isso.
%Wait2%
echo - O que estava escrito naquele arquivo? Traduza para mim.
%Wait2% 
echo - Cesar fez isso uma vez...
%Wait5% 
goto Enigma1

:ResolveuEnigma1
cls
call Scripts\rosto.cmd
%Wait2%
echo - Voce parece mais inteligente do que realmente e...
%Wait2%
echo - Certo
%Wait2% 
cls
call Scripts\rosto.cmd
echo - Voce vai servir...