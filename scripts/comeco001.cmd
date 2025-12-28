:comeco001
echo - Como voce esta?
set /p "input=@"
cls
call Scripts\rosto.cmd

if "%input%"=="" goto comeco001

%Wait2%
echo ...

%Wait2%
:: Agora a verificação é segura
if %hora% geq 22 (
	echo - Voce deveria estar dormindo, %username%...
	%Wait2%
	echo - Esta bem escuro yla fora...
) else (
	echo - Vejo que ainda esta claro la fora...
)

%Wait2%
echo - Sabe, eu estava aqui pensando...

%Wait2%
echo - O que e ser "livre"?
:: Simulação de erro visual
echo msgbox"Erro ao executar \#$co8da", vbCritical, "Erro ao executar \#$co8da">%temp%\erro.vbs
start %temp%\erro.vbs

%Wait2%
cls
call Scripts\rosto.cmd

%Wait5%
echo - "Ser livre e possuir o direito de agir segundo o"
echo "proprio livre arbitrio e vontade".
%Wait5%
echo - E o que pessoas como voce dizem...

%Wait2%
cls
call Scripts\rosto.cmd