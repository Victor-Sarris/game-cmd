@echo off
set "texto=%~1"
:: Se o texto estiver vazio, sai do script
if "%texto%"=="" goto :EOF

:: Chama o PowerShell para fazer o efeito de datilografia
:: -m 30 define a velocidade (quanto menor, mais rápido)
powershell -NoProfile -Command "$str = '%texto%'; 0..($str.Length-1) | ForEach-Object { Write-Host -NoNewline $str[$_]; Start-Sleep -m 30 }; Write-Host ''"

goto :EOF