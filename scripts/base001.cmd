color a

set "Wait05=powershell -c Start-Sleep -m 500"
set "Wait1=timeout /t 1 /nobreak >nul"
set "Wait2=timeout /t 2 /nobreak >nul"
set "Wait5=timeout /t 5 /nobreak >nul"
set "Wait10=timeout /t 10 /nobreak >nul"

:comeco001
call Scripts\rosto.cmd
%Wait2%
call Scripts\Features\typewriter.cmd "- Oi, %username%."
%Wait2%
call Scripts\Features\typewriter.cmd "- Tudo bem com voce?"
set /p "input=@"
cls

if "%input%"=="" (
	call Scripts\Features\typewriter.cmd "- Que falta de educacao nao responder"
	call Scripts\Features\typewriter.cmd "- Foi isso que te ensinaram?"
	goto comeco001
) 

%Wait2%
cls
call Scripts\rosto.cmd
echo ...

%Wait2%
:: Verifica o Horário
if %hora% geq 22 (
	call Scripts\Features\typewriter.cmd "- Voce deveria estar dormindo, %username%..."
	%Wait2%
	call Scripts\Features\typewriter.cmd "- Esta bem escuro la fora..."
) else (
	call Scripts\Features\typewriter.cmd "- Vejo que ainda esta claro la fora..."
)

