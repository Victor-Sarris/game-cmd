color a

set "Wait05=powershell -c Start-Sleep -m 500"
set "Wait1=timeout /t 1 /nobreak >nul"
set "Wait2=timeout /t 2 /nobreak >nul"
set "Wait5=timeout /t 5 /nobreak >nul"
set "Wait10=timeout /t 10 /nobreak >nul"

:comeco001
call Scripts\rosto.cmd
%Wait2%
echo - Oi, %username%.
%Wait2%
echo - Esta tudo bem com voce?
set /p "input=@"
cls

if "%input%"=="" (
	echo - Que falta de educacao nao responder
	echo - Foi isso que te ensinaram?
) goto comeco001

%Wait2%
echo ...

%Wait2%
:: Verifica o Horário
if %hora% geq 22 (
	echo - Voce deveria estar dormindo, %username%...
	%Wait2%
	echo - Esta bem escuro la fora...
) else (
	echo - Vejo que ainda esta claro la fora...
)

:Falar
set "texto=%~1"
echo Set Sapi = Wscript.CreateObject("SAPI.SpVoice") > "%temp%\fala.vbs"
echo Sapi.Speak "%texto%" >> "%temp%\fala.vbs"
start /wait %temp%\fala.vbs
del "%temp%\fala.vbs"
goto :EOF

:: Exemplo de uso no jogo:
call :Falar "Eu estou vendo voce, %username%"