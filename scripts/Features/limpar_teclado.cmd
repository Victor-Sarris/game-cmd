@echo off
:: ============================================================
::  limpar_teclado.cmd  -  DESCARTA O QUE O JOGADOR DIGITOU
::
::  Usado nas cenas em que a entidade "toma" o teclado. O jogo
::  nao bloqueia nada no Windows: ele simplesmente ignora e joga
::  fora tudo o que foi digitado durante a cena, para que nada
::  apareca e nada vaze para a proxima pergunta.
::
::  O efeito para quem joga e identico ao de um teclado travado,
::  mas nao ha risco nenhum: nenhum driver, gancho ou API de
::  bloqueio de entrada e tocado.
:: ============================================================
powershell -NoProfile -Command "while([Console]::KeyAvailable){ [void][Console]::ReadKey($true) }" 2>nul
goto :EOF
